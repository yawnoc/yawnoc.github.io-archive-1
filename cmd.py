#!/usr/bin/python

"""
----------------------------------------------------------------
cmd.py
----------------------------------------------------------------

A converter from Conway's markdown (CMD) to HTML,
written for the sole purpose of building his site
<https://yawnoc.github.io/>.

To be kept in the root directory.

Conversion is done entirely using regular expression replacements
and placeholder dictionaries.
Unlike John Gruber's markdown, I use fence-style constructs
to avoid the need for proper parsing.

You   : Why the hell would you use regex to do this?
Conway: It works, really!
You   : You're crazy.
Conway: Oh shut up, I already know that.

Documentation: <https://yawnoc.github.io/code/cmd.html>

Released into the public domain (CC0):
  <https://creativecommons.org/publicdomain/zero/1.0/>
ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"

"""


import argparse
import fnmatch
import functools
import os
import re


################################################################
# String processing
################################################################


ANY_CHARACTER_REGEX = r'[\s\S]'
ANY_STRING_MINIMAL_REGEX = f'{ANY_CHARACTER_REGEX}*?'
HORIZONTAL_WHITESPACE_REGEX = r'[^\S\n]'


def de_indent(string):
  """
  De-indent string.
  
  Trailing horizontal whitespace on the last line is removed.
  Empty lines do not count towards the longest common indentation.
  
  By contrast, textwrap.dedent will remove horizontal whitespace
  from *any* whitespace-only line, even in the middle of the string,
  which is undesirable.
  """
  
  # Remove trailing horizontal whitespace on the last line
  string = re.sub(f'{HORIZONTAL_WHITESPACE_REGEX}*$', '', string)
  
  # Get list of all indentations, either
  # (1) non-empty leading horizontal whitespace, or
  # (2) the leading empty string on a non-empty line.
  indentation_list = re.findall(
    rf'''
      ^{HORIZONTAL_WHITESPACE_REGEX}+
        |
      ^(?=[^\n])
    ''',
    string,
    flags=re.MULTILINE|re.VERBOSE
  )
  
  # Remove longest common indentation
  longest_common_indentation = os.path.commonprefix(indentation_list)
  string = re.sub(
    f'^{longest_common_indentation}',
    '',
    string,
    flags=re.MULTILINE
  )
  
  return string


def escape_html_syntax_characters(string):
  """
  Escape the three HTML syntax characters &, <, >.
    & becomes &amp;
    < becomes &lt;
    > becomes &gt;
  """
  
  string = re.sub('&', '&amp;', string)
  string = re.sub('<', '&lt;', string)
  string = re.sub('>', '&gt;', string)
  
  return string


def escape_html_attribute_value(string):
  """
  Escape the characters &, <, >, " in an attribute value.
    & becomes &amp;
    < becomes &lt;
    > becomes &gt;
    " becomes &quot;
  CMD shall always delimit attribute values by double quotes " ",
  never single quotes ' '.
  Therefore single quotes are not escaped as &apos;
  """
  
  string = escape_html_syntax_characters(string)
  string = re.sub('"', '&quot;', string)
  
  return string


################################################################
# Temporary storage
################################################################


PLACEHOLDER_MARKER = '\uE000'


def get_value_by_dictionary(dictionary, key):
  """
  Get the value for a key according to a dictionary.
  
  If the key is in the dictionary,
  the corresponding value is returned;
  otherwise the key is returned as is.
  """
  
  value = dictionary.get(key, key)
  
  return value


def replace_by_dictionary(dictionary, string, regex=False):
  """
  Apply a dictionary of replacements to a string.
  """
  
  for key in dictionary:
    
    if regex == False:
      key = re.escape(key)
    
    string = re.sub(
      key,
      functools.partial(process_match_by_dictionary, dictionary),
      string
    )
  
  return string


def process_match_by_dictionary(dictionary, match_object):
  """
  Proceses a match object according to a dictionary of replacements.
  
  If the entire string for the match object
  is a key in the dictionary,
  the corresponding value is returned;
  otherwise the string is returned as is.
  """
  
  match_string = match_object.group()
  replacement_string = get_value_by_dictionary(dictionary, match_string)
  
  return replacement_string


class PlaceholderStorage:
  """
  Placeholder storage class for managing temporary replacements.
  
  There are many instances in which
  a portion of the markup should not be altered
  by any replacements in the processing to follow.
  To make these portions of markup immune to further alteration,
  they are temporarily replaced by placeholder strings
  which ought to have the following properties:
  (1) Not appearing in the original markup
  (2) Not appearing as a result of the processing to follow
  (3) Not changing as a result of the processing to follow
  (4) Not confusable with adjacent characters
  (5) Being uniquely identifiable
  Properties (2) and (3) are impossible to guarantee
  given that there will be user-supplied regex replacements,
  but in most situations it will suffice to use strings of the form
    XX...X{n}X
  where
  (a) X is U+E000, the first "Private Use Area" code point,
      and is referred to as the "placeholder marker"
  (b) XX...X is a run of length one more
      than the number of occurrences of X in the original markup
      (which is usually zero), and
  (c) {n} is an integer counter which is incremented.
  Assuming that the user does not supply regex replacements
  which insert or delete occurrences of X,
  or insert or delete or change integers,
  such strings will satisfy properties (1) through (5) above.
  
  The portion of markup which should not be altered
  is stored in a dictionary, with
    KEYS: the placeholder strings (XX...X{n}X), and
    VALUES: the respective portions of markup.
  """
  
  def __init__(self, placeholder_marker_occurrences):
    """
    Initialise placeholder storage.
    """
    
    self.PLACEHOLDER_MARKER_RUN = (
      (1 + placeholder_marker_occurrences) * PLACEHOLDER_MARKER
    )
    self.PLACEHOLDER_STRING_COMPILED_REGEX = (
      re.compile(f'{self.PLACEHOLDER_MARKER_RUN}[0-9]+{PLACEHOLDER_MARKER}')
    )
    
    self.dictionary = {}
    self.counter = 0
  
  def create_placeholder(self):
    """
    Create a placeholder string for the current counter value.
    """
    
    placeholder_string = (
      f'{self.PLACEHOLDER_MARKER_RUN}{self.counter}{PLACEHOLDER_MARKER}'
    )
    
    return placeholder_string
  
  def create_placeholder_store_markup(self, markup_portion):
    """
    Create a placeholder string for, and store, a markup portion.
    Then increment the counter.
    
    Existing placeholders in the markup portion
    are substituted with their corresponding markup portions
    before being stored in the dictionary.
    This ensures that all markup portions in the dictionary
    are free of placeholders.
    """
    
    placeholder_string = self.create_placeholder()
    self.dictionary[placeholder_string] = (
      self.replace_placeholders_with_markup(markup_portion)
    )
    self.counter += 1
    
    return placeholder_string
  
  def replace_placeholders_with_markup(self, string):
    """
    Replace all placeholder strings with their markup portions.
    XX...X{n}X becomes its markup portion as stored in the dictionary.
    """
    
    string = re.sub(
      self.PLACEHOLDER_STRING_COMPILED_REGEX,
      functools.partial(process_match_by_dictionary, self.dictionary),
      string
    )
    
    return string


PROPERTY_NAME_REGEX = '[a-zA-Z0-9-]+'


class PropertyStorage:
  """
  Property storage class.
  
  Properties are specified in the preamble
  in the form %{property name} {property markup},
  where {property name} may only contain letters, digits, and hyphens.
  %{property name} is called a property string.
  
  Properties are stored in a dictionary with
    KEYS: %{property name}
    VALUES: {property markup}
  """
  
  def __init__(self):
    """
    Initialise property storage.
    """
    
    self.dictionary = {}
  
  def store_property_markup(self, property_name, property_markup):
    """
    Store markup for a property.
    """
    
    property_string = f'%{property_name}'
    self.dictionary[property_string] = property_markup
  
  def get_property_markup(self, property_name):
    """
    Get property markup for a property.
    """
    
    property_string = f'%{property_name}'
    property_markup = (
      get_value_by_dictionary(self.dictionary, property_string)
    )
    
    return property_markup
  
  def read_specifications_store_markup(self, preamble_content):
    """
    Read and store property specifications.
    """
    
    re.sub(
      f'''
        %(?P<property_name>{PROPERTY_NAME_REGEX})
        (?P<property_markup>{ANY_STRING_MINIMAL_REGEX})
        (?=%|$)
      ''',
      self.process_specification_match,
      preamble_content,
      flags=re.VERBOSE
    )
  
  def process_specification_match(self, match_object):
    """
    Process a single property-specification match object.
    """
    
    property_name = match_object.group('property_name')
    
    property_markup = match_object.group('property_markup')
    property_markup = property_markup.strip()
    
    self.store_property_markup(property_name, property_markup)
    
    return ''
  
  def replace_property_strings_with_markup(self, string):
    """
    Replace all property strings with their markup.
    """
    
    string = re.sub(
      f'%{PROPERTY_NAME_REGEX}',
      functools.partial(process_match_by_dictionary, self.dictionary),
      string
    )
    
    return string


################################################################
# Literals
################################################################


def process_literals(placeholder_storage, markup):
  """
  Process CMD literals (! {content} !).
  
  (! {content} !) becomes {content}, literally,
  with HTML syntax-character escaping.
  Whitespace around {content} is stripped.
  For {content} containing one or more consecutive exclamation marks
  followed by a closing round bracket,
  use a greater number of exclamation marks in the delimiters,
  e.g. "(!! (! blah !) !!)" for "(! blah !)".
  """
  
  markup = re.sub(
    f'''
      [(]
        (?P<exclamation_marks>!+)
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        (?P=exclamation_marks)
      [)]
    ''',
    functools.partial(process_literal_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_literal_match(placeholder_storage, match_object):
  """
  Process a single CMD-literal match object.
  """
  
  content = match_object.group('content')
  content = content.strip()
  content = escape_html_syntax_characters(content)
  
  return placeholder_storage.create_placeholder_store_markup(content)


################################################################
# Display code
################################################################


def process_display_code(placeholder_storage, markup):
  """
  Process display code ``↵ {content} ``.
  
  ``↵ {content} `` becomes <pre><code>{content}</code></pre>,
  with HTML syntax-character escaping
  and de-indentation for {content}.
  For {content} containing two or more consecutive backticks
  which are not already protected by CMD literals,
  use a greater number of backticks in the delimiters.
  """
  
  markup = re.sub(
    rf'''
      (?P<backticks>`{{2,}})
        \n
        (?P<content>{ANY_STRING_MINIMAL_REGEX})
      (?P=backticks)
    ''',
    functools.partial(process_display_code_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_display_code_match(placeholder_storage, match_object):
  """
  Process a single display-code match object.
  """
  
  content = match_object.group('content')
  content = de_indent(content)
  content = escape_html_syntax_characters(content)
  
  markup = f'<pre><code>{content}</code></pre>'
  
  return placeholder_storage.create_placeholder_store_markup(markup)


################################################################
# Inline code
################################################################


def process_inline_code(placeholder_storage, markup):
  """
  Process inline code ` {content} `.
  
  ` {content} ` becomes <code>{content}</code>,
  with HTML syntax-character escaping for {content}.
  Whitespace around {content} is stripped.
  For {content} containing one or more consecutive backticks
  which are not already protected by CMD literals,
  use a greater number of backticks in the delimiters.
  """
  
  markup = re.sub(
    f'''
      (?P<backticks>`+)
        (?P<content>{ANY_STRING_MINIMAL_REGEX})
      (?P=backticks)
    ''',
    functools.partial(process_inline_code_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_inline_code_match(placeholder_storage, match_object):
  """
  Process a single inline-code match object.
  """
  
  content = match_object.group('content')
  content = content.strip()
  content = escape_html_syntax_characters(content)
  
  markup = f'<code>{content}</code>'
  
  return placeholder_storage.create_placeholder_store_markup(markup)


################################################################
# Comments
################################################################


def process_comments(markup):
  """
  Process comments <!-- {content} -->.
  
  <!-- {content} --> is removed,
  along with any preceding horizontal whitespace.
  Although comments are weaker than literals and code
  they may still be used to remove them, e.g.
    (! A <!-- B --> !) becomes A <!-- B --> with HTML escaping,
  but
    <!-- A (! B !) --> is removed entirely.
  Therefore, while the comment syntax is not placeholder-protected,
  it is nevertheless accorded a place thereamong,
  for its power is on par therewith.
  """
  
  markup = re.sub(
    f'''
      {HORIZONTAL_WHITESPACE_REGEX}*
      <!
        [-][-]
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        [-][-]
      >
    ''',
    '',
    markup,
    flags=re.VERBOSE
  )
  
  return markup


################################################################
# Display maths
################################################################


def process_display_maths(placeholder_storage, markup):
  r"""
  Process display maths $$↵ {content} $$.
  
  $$↵ {content} $$ becomes <div class="maths">{content}</div>,
  with HTML syntax-character escaping
  and de-indentation for {content}.
  For {content} containing two or more consecutive dollar signs
  which are not already protected by CMD literals,
  e.g. \text{\$$d$, i.e.~$d$~dollars},
  use a greater number of dollar signs in the delimiters.
  """
  
  markup = re.sub(
    rf'''
      (?P<dollar_signs>[$]{{2,}})
        \n
        (?P<content>{ANY_STRING_MINIMAL_REGEX})
      (?P=dollar_signs)
    ''',
    functools.partial(process_display_maths_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_display_maths_match(placeholder_storage, match_object):
  """
  Process a single display-maths match object.
  """
  
  content = match_object.group('content')
  content = de_indent(content)
  content = escape_html_syntax_characters(content)
  
  markup = f'<div class="maths">{content}</div>'
  
  return placeholder_storage.create_placeholder_store_markup(markup)


################################################################
# Inline maths
################################################################


def process_inline_maths(placeholder_storage, markup):
  r"""
  Process inline maths $ {content} $.
  
  ` {content} ` becomes <span class="maths">{content}</span>,
  with HTML syntax-character escaping for {content}.
  Whitespace around {content} is stripped.
  For {content} containing one or more consecutive dollar signs
  which are not already protected by CMD literals,
  e.g. \text{$x = \infinity$ is very big},
  use a greater number of dollar signs in the delimiters.
  """
  
  markup = re.sub(
    f'''
      (?P<dollar_signs>[$]+)
        (?P<content>{ANY_STRING_MINIMAL_REGEX})
      (?P=dollar_signs)
    ''',
    functools.partial(process_inline_maths_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_inline_maths_match(placeholder_storage, match_object):
  """
  Process a single inline-maths match object.
  """
  
  content = match_object.group('content')
  content = content.strip()
  content = escape_html_syntax_characters(content)
  
  markup = f'<span class="maths">{content}</span>'
  
  return placeholder_storage.create_placeholder_store_markup(markup)


################################################################
# Inclusions
################################################################


def process_inclusions(placeholder_storage, markup):
  """
  Process inclusions (+ {file_name} +).
  
  (+ {file_name} +) includes the content of the file {file_name}.
  For {file_name} containing one or more consecutive plus signs
  followed by a closing round bracket,
  use a greater number of plus signs in the delimiters,

  """
  
  markup = re.sub(
    f'''
      [(]
        (?P<plus_signs>[+]+)
          (?P<file_name>{ANY_STRING_MINIMAL_REGEX})
        (?P=plus_signs)
      [)]
    ''',
    functools.partial(process_inclusion_match, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_inclusion_match(placeholder_storage, match_object):
  """
  Process a single inclusion match object.
  """
  
  file_name = match_object.group('file_name')
  file_name = file_name.strip()
  
  with open(file_name, 'r', encoding='utf-8') as file:
    content = file.read()
  
  content = process_literals(placeholder_storage, content)
  content = process_display_code(placeholder_storage, content)
  content = process_inline_code(placeholder_storage, content)
  content = process_comments(content)
  content = process_display_maths(placeholder_storage, content)
  content = process_inline_maths(placeholder_storage, content)
  
  return content


################################################################
# Preamble
################################################################


def process_preamble(placeholder_storage, property_storage, markup):
  """
  Process the preamble %%↵ {content} %%.
  
  %%↵ {content} %% becomes the HTML preamble,
  i.e. everything from <!DOCTYPE html> through to <body>.
  {content} is to consist of property specifications
  of the form %{property name} {property markup},
  which are stored using the property storage class
  and may be referenced by writing %{property name},
  called a property string, anywhere else in the document.
  {property name} may only contain letters, digits, and hyphens.
  If the same property is specified more than once,
  the latest specification shall prevail.
  The following properties, called original properties,
  are accorded special treatment:
    %lang
    %title
    %author
    %date-created
    %date-modified
    %resources
    %description
    %css
    %onload-js
    %footer-copyright-remark
    %footer-remark
  The following properties, called derived properties,
  are computed based on the supplied original properties:
    %html-lang-attribute
    %meta-element-author
    %meta-element-description
    %title-element
    %style-element
    %body-onload-attribute
    %year-created
    %year-modified
    %year-modified-next
    %footer-element
  In particular, the year properties are taken
  from the first 4 characters of the appropriate date properties.
  (NOTE: This will break come Y10K.)
  The following defaults exist for original properties:
    %title Title
    %author
    %date-created yyyy-mm-dd
    %date-modified yyyy-mm-dd
    %resources
    %description
    %css
    %onload-js
  For {property markup} matching a {property name} pattern,
  use a CMD literal, e.g. (! a literal %propety-name !).
  For {content} containing two or more consecutive percent signs
  which are not already protected by CMD literals,
  use a greater number of percent signs in the delimiters.
  
  Only the first occurrence in the markup is replaced.
  """
  
  markup, preamble_count = re.subn(
    rf'''
      (?P<percent_signs>%{{2,}})
        \n
        (?P<content>{ANY_STRING_MINIMAL_REGEX})
      (?P=percent_signs)
    ''',
    functools.partial(process_preamble_match,
      placeholder_storage, property_storage
    ),
    markup,
    count=1,
    flags=re.VERBOSE
  )
  
  if preamble_count > 0:
    
    markup = f'''\
      <!DOCTYPE html>
      <html%html-lang-attribute>
        <head>
          <meta charset="utf-8">
          %meta-element-author
          %meta-element-description
          %resources
          %title-element
          %style-element
        </head>
        <body%body-onload-attribute>
          {markup}
        </body>
      </html>
    '''
  
  return markup


DEFAULT_ORIGINAL_PROPERTY_SPECIFICATIONS = '''
  %lang en
  %title Title
  %author
  %date-created yyyy-mm-dd
  %date-modified yyyy-mm-dd
  %resources
  %description
  %css
  %onload-js
  %footer-copyright-remark
  %footer-remark
'''


def process_preamble_match(
  placeholder_storage, property_storage, match_object
):
  """
  Process a single preamble match object.
  
  (1) The default property specifications
      for original properties are prepended as defaults
      (which will be overwritten by the supplied properties).
  (2) The properties are stored.
  (3) The derived properties are computed and stored.
  (4) Finally the preamble is removed.
  """
  
  content = match_object.group('content')
  content = DEFAULT_ORIGINAL_PROPERTY_SPECIFICATIONS + content
  
  property_storage.read_specifications_store_markup(content)
  
  # Derived property %html-lang-attribute
  lang = property_storage.get_property_markup('lang')
  lang = escape_html_attribute_value(lang)
  html_lang_attribute = f' lang="{lang}"'
  property_storage.store_property_markup(
    'html-lang-attribute', html_lang_attribute
  )
  
  # Derived property %meta-element-author
  author = property_storage.get_property_markup('author')
  author = escape_html_attribute_value(author)
  if author == '':
    meta_element_author = ''
  else:
    meta_element_author = f'<meta name="author" content="{author}">'
  property_storage.store_property_markup(
    'meta-element-author', meta_element_author
  )
  
  # Derived property %meta-element-description
  description = property_storage.get_property_markup('description')
  description = escape_html_attribute_value(description)
  if description == '':
    meta_element_description = ''
  else:
    meta_element_description = (
      f'<meta name="description" content="{description}">'
    )
  property_storage.store_property_markup(
    'meta-element-description', meta_element_description
  )
  
  # Derived property %title-element
  title = property_storage.get_property_markup('title')
  title_element = f'<title>{title}</title>'
  property_storage.store_property_markup('title-element', title_element)
  
  # Derived property %style-element
  css = property_storage.get_property_markup('css')
  if css == '':
    style_element = ''
  else:
    style_element = f'<style>{css}</style>'
  property_storage.store_property_markup(
    'style-element', style_element
  )
  
  # Derived property %body-onload-attribute
  onload_js = property_storage.get_property_markup('onload-js')
  onload_js = escape_html_attribute_value(onload_js)
  if onload_js == '':
    body_onload_attribute = ''
  else:
    body_onload_attribute = f' onload="{onload_js}"'
  property_storage.store_property_markup(
    'body-onload-attribute', body_onload_attribute
  )
  
  # Derived property %year-created
  date_created = property_storage.get_property_markup('date-created')
  year_created = date_created[:4]
  property_storage.store_property_markup(
    'year-created', year_created
  )
  
  # Derived property %year-modified
  date_modified = property_storage.get_property_markup('date-modified')
  year_modified = date_modified[:4]
  property_storage.store_property_markup(
    'year-modified', year_modified
  )
  
  # Derived property %year-modified-next
  try:
    year_modified_next = f'{int(year_modified) + 1}'
  except ValueError:
    year_modified_next = '????'
  property_storage.store_property_markup(
    'year-modified-next', year_modified_next
  )
  
  # Derived property %footer-element
  year_range = year_created
  try:
    if int(year_modified) > int(year_created):
      year_range += f'--{year_modified}'
  except ValueError:
    pass
  if author == '':
    author_markup = ''
  else:
    author_markup = f'~{author}'
  footer_copyright_remark = (
    property_storage.get_property_markup('footer-copyright-remark')
  )
  if footer_copyright_remark == '':
    footer_copyright_remark_markup = ''
  else:
    footer_copyright_remark_markup = f', {footer_copyright_remark}'
  footer_remark = property_storage.get_property_markup('footer-remark')
  if footer_remark == '':
    footer_remark_markup = ''
  else:
    footer_remark_markup = rf'''
      \\
      {footer_remark}
    '''
  footer_element = f'''
    <footer>
      <hr>
      ©~{year_range}{author_markup}{footer_copyright_remark_markup}.
      {footer_remark_markup}
    </footer>
  '''
  property_storage.store_property_markup(
    'footer-element', footer_element
  )
  
  return ''


################################################################
# Punctuation
################################################################


PUNCTUATION_REPLACEMENT_DICTIONARY = {
  r'\\': '<br>',
  '~': '&nbsp;',
  r'\_': '&numsp;',
  r'\,': '&thinsp;',
  '---': '—',
  '--': '–',
  r'\P': '¶',
}


def process_punctuation(markup):
  """
  Process punctuation.
    ~   becomes &nbsp;
    \_  becomes &numsp;
    \,  becomes &thinsp;
    --- becomes — U+2014 EM DASH
    --  becomes – U+2013 EN DASH
    \P  becomes ¶ U+00B6 PILCROW SIGN
  Most of these are based on LaTeX syntax.
  """
  
  markup = replace_by_dictionary(PUNCTUATION_REPLACEMENT_DICTIONARY, markup)
  
  return markup


################################################################
# Whitespace
################################################################


def process_whitespace(markup):
  """
  Process whitespace.
  
  (1) Leading and trailing horizontal whitespace is removed.
  (2) Empty lines are removed.
      (In the implementation, consecutive newlines
      are normalised to a single newline.)
  (3) Backslash line continuation is effected.
  (4) Whitespace before line break elements <br> is removed.
  (5) Whitespace for attributes is canonicalised:
      (a) a single space is used before the attribute name, and
      (b) no whitespace is used around the equals sign.
  """
  
  markup = re.sub(
    f'''
      ^{HORIZONTAL_WHITESPACE_REGEX}+
        |
      {HORIZONTAL_WHITESPACE_REGEX}+$
    ''',
    '',
    markup,
    flags=re.MULTILINE|re.VERBOSE
  )
  markup = re.sub(r'[\n]+', r'\n', markup)
  markup = re.sub(r'\\\n', '', markup)
  markup = re.sub(r'[\s]+(?=<br>)', '', markup)
  markup = re.sub(
    r'''
      [\s]+?
        (?P<attribute_name>[\S]+?)
      [\s]*?
        =
      [\s]*?
        (?P<quoted_attribute_value>"[^"]*?")
    ''',
    r' \g<attribute_name>=\g<quoted_attribute_value>',
    markup,
    flags=re.VERBOSE
  )
  
  return markup


################################################################
# Converter
################################################################


def cmd_to_html(cmd, cmd_name):
  """
  Convert CMD to HTML.
  
  The CMD-name argument determines the URL of the resulting page,
  which is needed to generate the "Cite this page" section.
  
  During the conversion, the string is neither CMD nor HTML,
  and is referred to as "markup".
  """
  
  markup = cmd
  
  ################################################
  # START of conversion
  ################################################
  
  # Initialise placeholder storage
  placeholder_marker_occurrences = markup.count(PLACEHOLDER_MARKER)
  placeholder_storage = PlaceholderStorage(placeholder_marker_occurrences)
  
  # Initialise property storage
  property_storage = PropertyStorage()
  
  # Process placeholder-protected syntax
  markup = process_literals(placeholder_storage, markup)
  markup = process_display_code(placeholder_storage, markup)
  markup = process_inline_code(placeholder_storage, markup)
  markup = process_comments(markup)
  markup = process_display_maths(placeholder_storage, markup)
  markup = process_inline_maths(placeholder_storage, markup)
  
  # Process inclusions
  markup = process_inclusions(placeholder_storage, markup)
  
  # Process preamble
  markup = process_preamble(placeholder_storage, property_storage, markup)
  
  # Replace property strings with their markup
  markup = property_storage.replace_property_strings_with_markup(markup)
  
  # Process punctuation
  markup = process_punctuation(markup)
  
  # Process whitespace
  markup = process_whitespace(markup)
  
  # Replace placeholders strings with markup portions
  markup = placeholder_storage.replace_placeholders_with_markup(markup)
  
  ################################################
  # END of conversion
  ################################################
  
  html = markup
  
  return html


################################################################
# Wrappers
################################################################


def cmd_file_to_html_file(cmd_name):
  """
  Run converter on CMD file and generate HTML file.
  """
  
  # Canonicalise file name:
  # (1) Convert Windows backslashes to forward slashes
  # (2) Remove leading dot-slash for current directory
  # (3) Remove trailing "." or ".cmd" extension if given
  cmd_name = re.sub(r'\\', '/', cmd_name)
  cmd_name = re.sub(r'^\./', '', cmd_name)
  cmd_name = re.sub(r'\.(cmd)?$', '', cmd_name)
  
  # Read CMD from CMD file
  with open(f'{cmd_name}.cmd', 'r', encoding='utf-8') as cmd_file:
    cmd = cmd_file.read()
  
  # Convert CMD to HTML
  html = cmd_to_html(cmd, cmd_name)
  
  # Write HTML to HTML file
  with open(f'{cmd_name}.html', 'w', encoding='utf-8') as html_file:
    html_file.write(html)


def main(cmd_name):
  
  # Read CMD ignore patterns from .cmdignore
  try:
    with open('.cmdignore', 'r', encoding='utf-8') as cmd_ignore_file:
      cmd_ignore_content = cmd_ignore_file.read()
  except FileNotFoundError:
    cmd_ignore_content = ''
  
  # Convert to a list and ensure leading ./
  cmd_ignore_pattern_list = cmd_ignore_content.split()
  cmd_ignore_pattern_list = [
    re.sub('^(?![.]/)', './', cmd_ignore_pattern)
      for cmd_ignore_pattern in cmd_ignore_pattern_list
  ]
  
  # Get list of CMD files to be converted
  if cmd_name == '':
    # Get list of all CMD files
    cmd_name_list = [
      os.path.join(path, name)
        for path, _, files in os.walk('.')
          for name in files
            if fnmatch.fnmatch(name, '*.cmd')
    ]
    # Filter out ignored CMD files
    cmd_name_list = [
      cmd_name
        for cmd_name in cmd_name_list
          if not any(
            fnmatch.fnmatch(cmd_name, cmd_ignore_pattern)
              for cmd_ignore_pattern in cmd_ignore_pattern_list
          )
    ]
  else:
    cmd_name_list = [cmd_name]
  
  # Convert CMD files
  for cmd_name in cmd_name_list:
    cmd_file_to_html_file(cmd_name)


if __name__ == '__main__':
  
  DESCRIPTION_TEXT = '''
    Convert Conway's markdown (CMD) to HTML.
  '''
  parser = argparse.ArgumentParser(description=DESCRIPTION_TEXT)
  
  CMD_NAME_HELP_TEXT = '''
    Name of CMD file to be converted.
    Output is cmd_name.html.
    Omit to convert all CMD files,
    except those listed in .cmdignore.
  '''
  parser.add_argument(
    'cmd_name',
    help=CMD_NAME_HELP_TEXT,
    metavar='cmd_name[.[cmd]]',
    nargs='?',
    default=''
  )
  
  arguments = parser.parse_args()
  
  cmd_name = arguments.cmd_name
  
  main(cmd_name)
