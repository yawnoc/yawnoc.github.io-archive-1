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
(although dictionaries are used for temporary storage).
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
from os.path import commonprefix as longest_common_prefix


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
    rf'^{HORIZONTAL_WHITESPACE_REGEX}+|^(?=[^\n])',
    string,
    flags=re.MULTILINE
  )
  
  # Remove longest common indentation
  longest_common_indentation = longest_common_prefix(indentation_list)
  string = re.sub(
    f'^{longest_common_indentation}',
    '',
    string,
    flags=re.MULTILINE
  )
  
  return string


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
    cmd_to_html(cmd_file)


if __name__ == '__main__':
  
  DESCRIPTION_TEXT = '''Convert CMD (Conway's markdown) to HTML.'''
  parser = argparse.ArgumentParser(description=DESCRIPTION_TEXT)
  
  CMD_FILE_HELP_TEXT = '''
    Name of CMD file to be converted.
    Omit to convert all CMD files.
  '''
  parser.add_argument(
    'cmd_file',
    help=CMD_FILE_HELP_TEXT,
    nargs='?',
    default=''
  )
  
  arguments = parser.parse_args()
  
  cmd_file = arguments.cmd_file
  
  main(cmd_file)
