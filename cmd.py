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


################################################################
# Temporary storage
################################################################


PLACEHOLDER_MARKER = '\uE000'

NOT_WHITESPACE_OR_PERCENT_REGEX = r'[^\s%]'
PROPERTY_STRING_COMPILED_REGEX = f'%{NOT_WHITESPACE_OR_PERCENT_REGEX}+'


def process_match_by_dictionary(dictionary, match_object):
  """
  Proceses a match object according to a dictionary of replacements.
  
  If the entire string for the match object
  is a key in the dictionary,
  the corresponding value is returned;
  otherwise the string is returned as is.
  """
  
  match_object_string = match_object.group()
  replacement_string = dictionary.get(match_object_string, match_object_string)
  
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


class PropertyStorage:
  """
  Property storage class.
  
  Properties are specified in the preamble
  in the form %{property name} {property markup},
  where {property name} cannot contain whitespace or percent signs.
  
  Properties are stored in a dictionary with
    KEYS: %{property name}
    VALUES: {property markup}
  """
  
  def __init__(self):
    """
    Initialise property storage.
    """
    
    self.dictionary = {}
  
  def store_markup(self, property_name, property_markup):
    """
    Store property markup in the dictionary.
    """
    
    self.dictionary[f'%{property_name}'] = property_markup
  
  def replace_property_strings_with_markup(self, string):
    """
    Replace all property strings with their markup.
    """
    
    string = re.sub(
      PROPERTY_STRING_COMPILED_REGEX,
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
  Horizontal whitespace around {content} is stripped.
  For {content} containing one or more consecutive exclamation marks
  followed by a closing round bracket,
  use a greater number of exclamation marks in the delimiters,
  e.g. "(!! (! blah !) !!)" for "(! blah !)".
  """
  
  markup = re.sub(
    rf'''
      \(
        (?P<exclamation_marks>!+)
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        (?P=exclamation_marks)
      \)
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
  Process display code ``↵ {content} ↵``.
  
  ``↵ {content} ↵`` becomes <pre><code>{content}</code></pre>,
  with HTML syntax-character escaping
  and de-indentation for {content}.
  Arbitrary horizontal whitespace is allowed
  before the closing backticks, and is stripped.
  For {content} containing two or more consecutive backticks,
  use a greater number of backticks in the delimiters.
  """
  
  markup = re.sub(
    rf'''
      (?P<backticks>`{{2,}})
        \n
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        \n
        {HORIZONTAL_WHITESPACE_REGEX}*
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
  Horizontal whitespace around {content} is stripped.
  For {content} containing one or more consecutive backticks,
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
  Process display maths $$↵ {content} ↵$$.
  
  $$↵ {content} ↵$$ becomes <div class="maths">{content}</div>,
  with HTML syntax-character escaping
  and de-indentation for {content}.
  Arbitrary horizontal whitespace is allowed
  before the closing dollar signs, and is stripped.
  For {content} containing two or more consecutive dollar signs,
  e.g. \text{\$$d$, i.e.~$d$~dollars},
  use a greater number of dollar signs in the delimiters.
  """
  
  markup = re.sub(
    rf'''
      (?P<dollar_signs>[$]{{2,}})
        \n
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        \n
        {HORIZONTAL_WHITESPACE_REGEX}*
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
  Horizontal whitespace around {content} is stripped.
  For {content} containing one or more consecutive dollar signs,
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
# Preamble
################################################################


def process_preamble(placeholder_storage, property_storage, markup):
  """
  Process preamble %%↵ {content} ↵%%.
  
  %%↵ {content} ↵%% becomes the preamble,
  i.e. everything from <!DOCTYPE html> through to <body>.
  {content} is to consist of property specifications
  of the form %{property name} {property content},
  which are stored using the property storage class
  and may be referenced by writing %{property name}
  anywhere else in the document.
  {property name} cannot contain whitespace or percent signs.
  The following properties are accorded special treatment:
    %title
    %author
    %date-created
    %date-modified
    %resources
    %description
    %css
    %onload-js
  The following properties are stored
  based on the values supplied to %date-created and %date-modified:
    %year-created
    %year-modified
    %year-modified-next
  Arbitrary horizontal whitespace is allowed
  before the closing percent signs, and is stripped.
  For {property content} matching a {property name} pattern,
  use a CMD literal, e.g. (! a literal %propety-name !).
  For {content} containing two or more consecutive percent signs
  which are not already protected by CMD literals,
  use a greater number of percent signs in the delimiters.
  
  Only the first occurrence in the markup is replaced.
  """
  
  markup = re.sub(
    rf'''
      (?P<percent_signs>%{{2,}})
        \n
          (?P<content>{ANY_STRING_MINIMAL_REGEX})
        \n
        {HORIZONTAL_WHITESPACE_REGEX}*
      (?P=percent_signs)
    ''',
    functools.partial(process_preamble_match,
      placeholder_storage, property_storage
    ),
    markup,
    count=1,
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
  
  # Replace property strings with their markup
  markup = property_storage.replace_property_strings_with_markup(markup)
  
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
  
  if cmd_name == '':
    cmd_name_list = [
      os.path.join(path, name)
        for path, _, files in os.walk('.')
          for name in files
            if name.endswith('.cmd')
    ]
  else:
    cmd_name_list = [cmd_name]
  
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
    Omit to convert all CMD files.
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
