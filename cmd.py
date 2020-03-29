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
import os
import re


################################################################
# String processing
################################################################


HORIZONTAL_WHITESPACE_REGEX = r'[^\S\n]'


def de_indent(string):
  """
  De-indent string.
  
  Horizontal whitespace at the very start and the very end is removed.
  Empty lines do not count towards the longest common indentation.
  
  By contrast, textwrap.dedent will remove horizontal whitespace
  from whitespace-only lines even in the middle of the string,
  which is undesirable.
  """
  
  # Remove horizontal whitespace at the very start and the very end
  string = re.sub(f'^{HORIZONTAL_WHITESPACE_REGEX}*', '', string)
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
    self.dictionary[placeholder_string] = markup_portion
    self.counter += 1
    
    return placeholder_string
  
  def replace_placeholders_with_markup(self, string):
    """
    Replace all placeholder strings with their markup portions.
    XX...X{n}X becomes its markup portion as stored in the dictionary.
    """
    
    string = re.sub(
      self.PLACEHOLDER_STRING_COMPILED_REGEX,
      self.replace_placeholder_match_with_markup,
      string
    )
    
    return string
  
  def replace_placeholder_match_with_markup(self, match_object):
    """
    Convert a match for a placeholder string to its markup portion.
    """
    
    placeholder_string = match_object.group()
    markup_portion = self.dictionary[placeholder_string]
    
    return markup_portion


################################################################
# Literals
################################################################


def process_literals(markup, placeholder_storage):
  """
  Process CMD literal (! {content} !).
  
  (! {content} !) becomes {content}, literally,
  with HTML syntax-character escaping,
  and is unaffected by any further processing.
  Horizontal whitespace around {content} is stripped.
  For {content} containing "!)", use multiple exclamation marks,
  e.g. "(!! (! blah !) !!)" for "(! blah !)".
  """
  
  markup = re.sub(
    r'''
      \(
        (?P<exclamation_marks>!+)
          (?P<content>[\s\S]*?)
        (?P=exclamation_marks)
      \)
    ''',
    lambda match_object:
      process_literal_match(match_object, placeholder_storage),
    markup,
    flags=re.VERBOSE
  )
  
  return markup


def process_literal_match(match_object, placeholder_storage):
  
  content = match_object.group('content')
  content = content.strip()
  content = escape_html_syntax_characters(content)
  
  return placeholder_storage.create_placeholder_store_markup(content)

################################################################
# Converter
################################################################


def cmd_to_html(cmd, file_name):
  """
  Convert CMD to HTML.
  
  The file-name argument determines the URL of the resulting page,
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
  
  # Process supreme syntax
  markup = process_literals(markup, placeholder_storage)
  
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


def cmd_file_to_html_file(cmd_file):
  """
  Run converter on CMD file and generate HTML file.
  """
  
  # Canonicalise file name:
  # (1) Convert Windows backslashes to forward slashes
  # (2) Remove leading dot-slash for current directory
  # (3) Remove trailing "." or ".cmd" extension if given
  file_name = cmd_file
  file_name = re.sub(r'\\', '/', file_name)
  file_name = re.sub(r'^\./', '', file_name)
  file_name = re.sub(r'\.(cmd)?$', '', file_name)
  
  # Read CMD from CMD file
  with open(f'{file_name}.cmd', 'r', encoding='utf-8') as opened_cmd_file:
    cmd = opened_cmd_file.read()
  
  # Convert CMD to HTML
  html = cmd_to_html(cmd, file_name)
  
  # Write HTML to HTML file
  with open(f'{file_name}.html', 'w', encoding='utf-8') as opened_html_file:
    opened_html_file.write(html)


def main(cmd_file):
  
  if cmd_file == '':
    cmd_file_list = [
      os.path.join(path, name)
        for path, _, files in os.walk('.')
          for name in files
            if name.endswith('.cmd')
    ]
  else:
    cmd_file_list = [cmd_file]
  
  for cmd_file in cmd_file_list:
    cmd_file_to_html_file(cmd_file)


if __name__ == '__main__':
  
  DESCRIPTION_TEXT = '''
    Convert Conway's markdown (CMD) to HTML
    and write to cmd_file.html.
  '''
  parser = argparse.ArgumentParser(description=DESCRIPTION_TEXT)
  
  CMD_FILE_HELP_TEXT = '''
    Name of CMD file to be converted.
    Omit to convert all CMD files.
  '''
  parser.add_argument(
    'cmd_file',
    help=CMD_FILE_HELP_TEXT,
    metavar='cmd_file[.[cmd]]',
    nargs='?',
    default=''
  )
  
  arguments = parser.parse_args()
  
  cmd_file = arguments.cmd_file
  
  main(cmd_file)
