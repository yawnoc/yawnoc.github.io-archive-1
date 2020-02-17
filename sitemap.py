#!/usr/bin/python

################################################################
# sitemap.py
################################################################
# Generates sitemap.txt.
# To be kept in the root directory.
# Released into the public domain (CC0):
#   https://creativecommons.org/publicdomain/zero/1.0/
# ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"
################################################################

import os
import re

NEWLINE = '\n'

# Convert list to newline-separated string
def list_to_string(list_):
  return NEWLINE.join(list_) + NEWLINE

# Convert newline-separated string to list
def string_to_list(string):
  return string.split(NEWLINE)

# Get list of all HTML pages
EXCLUDED_PAGES = [
  f'{file_name}.html'
    for file_name in [
      'googlefe5d4ec3587d5f3a',
      'test'
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

# Canonicalise ./index.html as ./
sitemap = re.sub(r'\./index.html', './', sitemap)

# Replace . with actual root
ROOT = 'https://yawnoc.github.io'
sitemap = re.sub(r'^\.', ROOT, sitemap, flags = re.MULTILINE)

# Sort sitemap
sitemap = string_to_list(sitemap)
sitemap.sort()
sitemap = list_to_string(sitemap)

# Write to sitemap.txt
with open('sitemap.txt', 'w', encoding = 'utf-8') as sitemap_file:
  sitemap_file.write(sitemap)
