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

# Convert list to newline-separated string
sitemap = '\n'.join(sitemap)

# Convert Windows backslashes to forward slashes
sitemap = re.sub(r'\\', '/', sitemap)

# Canonicalise ./index.html as ./
sitemap = re.sub(r'\./index.html', './', sitemap)

# Replace . with actual root
root = 'https://yawnoc.github.io'
sitemap = re.sub(r'^\.', root, sitemap, flags = re.MULTILINE)

# Write to sitemap.txt
with open('sitemap.txt', 'w', encoding = 'utf-8') as sitemap_file:
  sitemap_file.write(sitemap)