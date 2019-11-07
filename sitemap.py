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

from os.path import join

# Whether a file is an HTML page
def is_page(name):
  return name.endswith('.html') and name != 'googlefe5d4ec3587d5f3a.html'

# Get list of all pages
sitemap = [
  join(path, name)
    for path, _, files in os.walk('.')
      for name in filter(is_page, files)
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
sitemap_file = open('sitemap.txt', 'w', encoding = 'utf-8')
sitemap_file.write(sitemap)