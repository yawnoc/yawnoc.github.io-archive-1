#!/usr/bin/env python3

"""
----------------------------------------------------------------
generate-sitemap.py
----------------------------------------------------------------

Generate sitemap.txt.

To be kept in the root directory.

Licensed under "MIT No Attribution" (MIT-0),
see <https://spdx.org/licenses/MIT-0>.

"""


import os
import re


NEWLINE = '\n'


def list_to_string(list_):
  """
  Convert list to newline-separated string
  """
  
  return NEWLINE.join(list_) + NEWLINE


def string_to_list(string):
  """
  Convert newline-separated string to list
  """
  
  return string.strip().split(NEWLINE)


# Get list of all HTML pages
EXCLUDED_PAGES = [
  f'{file_name}.html'
    for file_name in [
      '404',
    ]
]
sitemap = [
  os.path.join(path, name)
    for path, _, files in os.walk('.')
      for name in files
        if name.endswith('.html') and name not in EXCLUDED_PAGES
]

# Convert sitemap from list to newline-separated string
sitemap = list_to_string(sitemap)

# Convert Windows backslashes to forward slashes
sitemap = re.sub(r'\\', '/', sitemap)

# Canonicalise /index.html as /
sitemap = re.sub('/index[.]html$', '/', sitemap, flags=re.MULTILINE)

# Remove .html extension
sitemap = re.sub('[.]html$', '', sitemap, flags=re.MULTILINE)

# Replace . with actual root
ROOT = 'https://yawnoc.github.io'
sitemap = re.sub('^[.]', ROOT, sitemap, flags=re.MULTILINE)

# Sort sitemap
sitemap = string_to_list(sitemap)
sitemap.sort()
sitemap = list_to_string(sitemap)

# Write to sitemap.txt
with open('sitemap.txt', 'w', encoding='utf-8') as sitemap_file:
  sitemap_file.write(sitemap)
