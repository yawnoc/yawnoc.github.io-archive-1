#!/usr/bin/python

################################################################
# cch.py
################################################################
# A converter from Conway's concise HTML (CCH) to HTML,
# written by Conway, for the sole purpose of building his site
#   https://yawnoc.github.io/
# with fewer keystrokes and better readability than straight HTML.
# Done entirely with regular expression replacements.
# ----------------------------------------------------------------
# You   : Why the hell would you use regex to do this?
# Conway: It works, really!
# You   : You're crazy.
# Conway: Oh shut up, I already know that.
# ----------------------------------------------------------------
# To be kept in the root directory.
# ----------------------------------------------------------------
# Basic documentation on how CCH works:
#   https://yawnoc.github.io/code/cch.html
# ----------------------------------------------------------------
# Released into the public domain (CC0):
#   https://creativecommons.org/publicdomain/zero/1.0/
# ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"
################################################################

################################################################
# Elements in canonical order
################################################################
#   Element         Name                              Descendants
# ----------------------------------------------------------------
# Supreme elements
# ----------------------------------------------------------------
# These are immune to any processing below them.
#   <``>            display_code
#   <`>             inline_code
#   <!-- -->        html_comment
#   <script>        html_script
#   <% %>           user_defined_definition
#   <$$>            display_maths
#   <$>             inline_maths
#   <$d>            inline_maths_definition
# ----------------------------------------------------------------
# Zero-argument elements
# ----------------------------------------------------------------
#   <@i{type}>      item_anchor_abbreviation          <@i>
#   <^^>            assisting_romanisation_radio      <^>
#   <-{type}>       svg_style_abbreviation
# ----------------------------------------------------------------
# Multiple-argument elements
# ----------------------------------------------------------------
# Arguments are to be separated by the pipe character |.
# Use \| for a literal pipe.
# Nesting is allowed provided the inner element appears higher in this list.
#   <+{pos}>        dialogue_image                    <+>
#   <+>             image
#   <^>             assisting_romanisation            <^e>
#   <^cm[gov]>      cantonese_mandarin_romanisation   <@>, <^e>
#   <@{dir}>        directed_triangle_anchor          <@>
#   <@i>            item_anchor                       <@>
#   <@{level}>      heading_self_link_anchor          <@>
#   <@>             anchor
#   <#[size]>       boxed_translation
#   <;sh>           sun_tzu_heading                   <@{level}>
#   <;s@@>          sun_tzu_link_division             <@@>, <@{dir}>, <@>
#   <*>             preamble
#   <*p>            page_properties                   <@>
#   <*c>            cite_this_page                    <@{level}>
#   <*f>            footer
# <@{dir}>, <@{level}>, <@> require a second pass, since they are descendants
# of multiple-argument elements which are lower down than themselves.
# ----------------------------------------------------------------
# Single-argument elements
# ----------------------------------------------------------------
#   <,>             html_noscript
#   <_>             assisting_numeral                 <_e>
#   <:{type}>       formatted_span
#   <#[type]>       boxed_division
#   <~~>            dialogue_division
#   <~{pos}[type]>  dialogue_paragraph
#   <@@>            link_division
#   <=h>            header_navigation_bar             <=>
#   <=>             navigation_bar
#   <.>             note_paragraph
#   <![type]>       overflowing_division
#   <-->            svg_style_container
#   <^e>            text_romanisation
#   <_e>            text_numeral
################################################################

################################################################
# Escapes
################################################################
#   Unescaped       Escaped
# ----------------------------------------------------------------
# Python (for regex replacement strings)
# ----------------------------------------------------------------
#   \               \\
# ----------------------------------------------------------------
# HTML
# ----------------------------------------------------------------
#   &               &amp;
#   <               &lt;
#   >               &gt;
# ----------------------------------------------------------------
# Quotes (for attribute values)
# ----------------------------------------------------------------
#   "               &quot;
# ----------------------------------------------------------------
# Conway
# ----------------------------------------------------------------
#   \               \\              (literal backslash)
#   |               \|              (literal pipe)
#   ~               \~              (literal tilde)
#   {hyphen run}    \{hyphen run}   (literal hyphen run (2 or more))
#   {               \{              (literal opening curly bracket)
#   }               \}              (literal closing curly bracket)
#   {empty string}  \!              (literal empty string)
#   &nbsp;          ~               (non-breaking space)
#   {U+2014}        ---             (— U+2014 EM DASH)
#   {U+2013}        --              (– U+2013 EN DASH)
#   {U+30FB}        \.              (・ U+30FB KATAKANA MIDDLE DOT)
#   {Chinese run}   \{Chinese run}  (literal Chinese run (no language span))
#   &amp;           \&              (HTML-escaped ampersand)
#   &lt;            \<              (HTML-escaped less than)
#   &gt;            \>              (HTML-escaped greater than)
#   LORD            \LORD           (Lord in small caps)
#   &numsp;         \_              (figure space for use in numerical tables)
#   &thinsp;        \,              (thin space)
#   {master URL}    \/              (GitHub: yawnoc.github.io master root)
#   {yawnoc URL}    \=              (GitHub: yawnoc)
#   <i>             {               (Conway italics opening tag)
#   </i>            }               (Conway italics closing tag)
#   \or             <...>or</...>   (alternative type "or")
#   \lit            <...>lit.</...> (alternative type "lit.")
#   \sic            {sic}           (italicised "sic")
# ~, {hyphen run}, { and } are called special Conway literals.
# ----------------------------------------------------------------
# Romanisation (for text romanisation elements)
# ----------------------------------------------------------------
# Conway only
#   œ       oe      (œ U+0153 LATIN SMALL LIGATURE OE)
# Wade--Giles only
#   ê       e^      (ê U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX)
#   ŭ       uu      (ŭ U+016D LATIN SMALL LETTER U WITH BREVE)
# Pinyin tone 1 陰平 (dark level) only
#   ā       a=      (ā U+0101 LATIN SMALL LETTER A WITH MACRON)
#   ē       e=      (ē U+0113 LATIN SMALL LETTER E WITH MACRON)
#   ī       i=      (ī U+012B LATIN SMALL LETTER I WITH MACRON)
#   ō       o=      (ō U+014D LATIN SMALL LETTER O WITH MACRON)
#   ū       u=      (ū U+016B LATIN SMALL LETTER U WITH MACRON)
#   ǖ       u"=     (ǖ U+01D6 LATIN SMALL LETTER U WITH DIAERESIS AND MACRON)
# Pinyin tone 2 陽平 (light level) only
#   á       a/      (á U+00E1 LATIN SMALL LETTER A WITH ACUTE)
#   é       e/      (é U+00E9 LATIN SMALL LETTER E WITH ACUTE)
#   í       i/      (í U+00ED LATIN SMALL LETTER I WITH ACUTE)
#   ó       o/      (ó U+00F3 LATIN SMALL LETTER O WITH ACUTE)
#   ú       u/      (ú U+00FA LATIN SMALL LETTER U WITH ACUTE)
#   ǘ       u"/     (ǘ U+01D8 LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE)
# Pinyin tone 3 上 (rising) only
#   ǎ       av      (ǎ U+01CE LATIN SMALL LETTER A WITH CARON)
#   ě       ev      (ě U+011B LATIN SMALL LETTER E WITH CARON)
#   ǐ       iv      (ǐ U+01D0 LATIN SMALL LETTER I WITH CARON)
#   ǒ       ov      (ǒ U+01D2 LATIN SMALL LETTER O WITH CARON)
#   ǔ       uv      (ǔ U+01D4 LATIN SMALL LETTER U WITH CARON)
#   ǚ       u"v     (ǚ U+01DA LATIN SMALL LETTER U WITH DIAERESIS AND CARON)
# Pinyin tone 4 去 (departing) only
#   à       a\      (à U+00E0 LATIN SMALL LETTER A WITH GRAVE)
#   è       e\      (è U+00E8 LATIN SMALL LETTER E WITH GRAVE)
#   ì       i\      (ì U+00EC LATIN SMALL LETTER I WITH GRAVE)
#   ò       o\      (ò U+00F2 LATIN SMALL LETTER O WITH GRAVE)
#   ù       u\      (ù U+00F9 LATIN SMALL LETTER U WITH GRAVE)
#   ǜ       u"\     (ǜ U+01DC LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE)
# Common
#   ü       u"      (ü U+00FC LATIN SMALL LETTER U WITH DIAERESIS)
################################################################

################################################################
# Italics
################################################################
# Curly brackets {} are automatically converted to italics tags
# <i></i>, unless preceded immediately by a backslash.
################################################################

################################################################
# Whitespace (for lighter HTML)
################################################################
# Unnecessary whitespace is removed:
# 1. Preformatted elements are de-indented
#    (but not affected by the subsequent removals)
# 2. Horizontal whitespace around line break elements is removed
# 3. Leading whitespace is removed
# 4. Empty lines are removed
# 5. Trailing whitespace is removed
# 6. Newlines immediately following a backslash are removed
#    (i.e. backslash is the line continuation character)
# 7. Newlines immediately preceding line break elements are removed
################################################################

################################################################
# Language spans
################################################################
# Runs of Chinese characters and ・ (U+30FB KATAKANA MIDDLE DOT),
# and consecutive runs of formatted spans containing these,
# are automatically wrapped in a lang="zh-Hant" span,
# unless the runs of Chinese are preceded immediately by a backslash.
################################################################

###############################################################################
###############################################################################
###############################################################################

import argparse
import os
import re
from os.path import commonprefix as longest_common_prefix

################################################################
# CCH error
################################################################

# ----------------------------------------------------------------
# Error span
# ----------------------------------------------------------------

def cch_error_span(error_message):
  
  error_message = error_message.strip()
  error_message = de_indent(error_message)
  error_message = escape_html(error_message)
  error_message = escape_user_defined_old_strings(error_message)
  error_message = escape_conway_special_literals(error_message)
  
  return f'<span class="cch-error">CCH error: {error_message}</span>'

# ----------------------------------------------------------------
# Error page with navigation bar link to CCH documentation
# ----------------------------------------------------------------

def cch_error_page(error_message, element_id, element_title):
  
  element_id = escape_attribute_value(element_id)
  element_title = escape_attribute_value(element_title)
  
  return f'''
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="utf-8">
      <link rel="stylesheet" href="/conway.min.css">
      <title>CCH error</title>
    </head>
    <body>
      <=h>
        <li>
          <a
            href="/code/cch.html#{element_id}"
            title="{element_title}"\
          >{element_title} help</a>
        </li>
      </=h>
      {cch_error_span(error_message)}
    </body>
    </html>
  '''

################################################################
# Replace display code with temporary replacements
################################################################

# Unprocessed string:
#   <``> {content} </``>

# Raw regular expression for unprocessed string:
#   <``>([\s\S]*?)</``>
#   \1  {content}

# Processed string:
#   <pre> {HTML-escaped, de-indented content} </pre>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_display_code(match_object):
  
  content = match_object.group(1)
  content = escape_html(content)
  content = de_indent(content)
  
  processed_string = f'<pre>{content}</pre>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_display_code(string):
  
  return re.sub(r'<``>([\s\S]*?)</``>', replace_display_code, string)

################################################################
# Replace inline code with temporary replacements
################################################################

# Unprocessed string:
#   <`> {content} </`>

# Raw regular expression for unprocessed string:
#   <`>([\s\S]*?)</`>
#   \1  {content}

# Processed string:
#   <code> {HTML-escaped content} </code>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_inline_code(match_object):
  
  content = match_object.group(1)
  content = escape_html(content)
  
  processed_string = f'<code>{content}</code>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_inline_code(string):
  
  return re.sub(r'<`>([\s\S]*?)</`>', replace_inline_code, string)

################################################################
# Remove HTML comments (and all preceding whitespace)
################################################################

# Unprocessed string:
#   {horizontal whitespace} <!-- {content} -->

# Raw regular expression for unprocessed string:
#   [^\S\n]*<!\-\-[\s\S]*?\-\->

# Processed string:
#   {empty string}

def remove_all_html_comments(string):
  
  return re.sub(r'[^\S\n]*<!\-\-[\s\S]*?\-\->', '', string)

################################################################
# Replace HTML script elements with temporary replacements
################################################################

# Unprocessed string:
#   <script> {content} </script>

# Raw regular expression for unprocessed string:
#   <script>([\s\S]*?)</script>
#   \1  {content}

# Processed string:
#   <script> {whitespace-stripped content} </script>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_html_script(match_object):
  
  content = match_object.group(1)
  content = remove_unnecessary_whitespace(content)
  
  processed_string = f'<script>{content}</script>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_html_scripts(string):
  
  return re.sub(r'<script>([\s\S]*?)</script>', replace_html_script, string)

################################################################
# Store user-defined definitions (of user-defined replacements)
################################################################

# Unprocessed string:
#   <% {old string} | {new string} %>
# where {old string} cannot contain \, |, ~, < or >
# and must begin with two non-whitespace characters
# (to make it escapable using the literal empty string escape \!)

# Raw regular expression for unprocessed string:
#   <%[\s]*([^\s\\|~<>]{2}[^\\|~<>]*?)[\s]*\|([\s\S]*?)%>
#   \1  {old string}
#   \2  {new string}

# Processed string:
#   {empty string}

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def store_user_defined_definition(match_object):
  
  global user_defined_replacement_dictionary
  
  old_string = match_object.group(1)
  new_string = match_object.group(2)
  new_string = new_string.strip()
  
  if old_string in user_defined_replacement_dictionary:
    return cch_error_span(
      f'User-defined replacement for {old_string} defined twice.'
    )
  
  user_defined_replacement_dictionary[old_string] = new_string
  
  return ''

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def store_all_user_defined_definitions(string):
  
  global user_defined_replacement_dictionary
  
  string = re.sub(
    r'<%[\s]*([^\s\\|~<>]{2}[^\\|~<>]*?)[\s]*\|([\s\S]*?)%>',
    store_user_defined_definition,
    string
  )
  
  user_defined_replacement_dictionary = (
    dict(
      reversed(
        list(
          user_defined_replacement_dictionary.items()
        )
      )
    )
  )
  
  return string

################################################################
# Apply user-defined replacements (defined by user-defined definitions)
################################################################

def apply_all_user_defined_replacements(string):
  
  for old_string in user_defined_replacement_dictionary:
    
    new_string = user_defined_replacement_dictionary[old_string]
    string = re.sub(
      re.escape(old_string),
      escape_python_backslash(new_string),
      string
    )
  
  return string

################################################################
# Escape user-defined old strings
################################################################

def escape_user_defined_old_strings(string):
  
  for old_string in user_defined_replacement_dictionary:
    
    # Escape each user-defined {old string}
    # by inserting a literal empty string escape \! after the first character
    # ({old string} must begin with two non-whitespace characters
    # as per the specification for user-defined definition elements <% %>)
    escaped_old_string = old_string[0] + r'\!' + old_string[1:]
    
    string = re.sub(
      re.escape(old_string),
      escape_python_backslash(escaped_old_string),
      string
    )
  
  return string

################################################################
# Replace display maths with temporary replacements
################################################################

# Unprocessed string:
#   <$$> {content} </$$>

# Raw regular expression for unprocessed string:
#   <\$\$>([\s\S]*?)</\$\$>
#   \1  {content}

# Processed string:
#   <div class="maths"> {HTML-escaped, de-indented content} </div>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_display_maths(match_object):
  
  content = match_object.group(1)
  content = escape_html(content)
  content = de_indent(content)
  
  processed_string = f'<div class="maths">{content}</div>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_display_maths(string):
  
  return re.sub(r'<\$\$>([\s\S]*?)</\$\$>', replace_display_maths, string)

################################################################
# Replace inline maths with temporary replacements
################################################################

# Unprocessed string:
#   <$> {content} </$>

# Raw regular expression for unprocessed string:
#   <\$>([\s\S]*?)</\$>
#   \1  {content}

# Processed string:
#   <span class="maths"> {HTML-escaped content} </span>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_inline_maths(match_object):
  
  content = match_object.group(1)
  content = escape_html(content)
  
  processed_string = f'<span class="maths">{content}</span>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_inline_maths(string):
  
  return re.sub(r'<\$>([\s\S]*?)</\$>', replace_inline_maths, string)

################################################################
# Replace inline maths definitions with temporary replacements
################################################################

# Unprocessed string:
#   <$d> {content} </$d>

# Raw regular expression for unprocessed string:
#   <\$d>([\s\S]*?)</\$d>
#   \1  {content}

# Processed string:
#   <span class="maths embedded-definitions"> {HTML-escaped content} </span>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_inline_maths_definition(match_object):
  
  content = match_object.group(1)
  content = escape_html(content)
  
  processed_string = (
    f'<span class="maths embedded-definitions">{content}</span>'
  )
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_inline_maths_definitions(string):
  
  return re.sub(
    r'<\$d>([\s\S]*?)</\$d>',
    replace_inline_maths_definition,
    string
  )

################################################################
# Replace item anchor abbreviations
################################################################

# Unprocessed string:
#   <@i{type}></@i{type}>
# where {type} is one of h, t, i, n, r or c

# Raw regular expression for unprocessed string:
#   <@i([htinrc])></@i\1>
#   \1  {type}

# Processed string:
#   <@i> {content} | {href} | {title} </@i>
# where {content}, {href} and {title} depend on {type}

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

item_anchor_abbreviation_content_dictionary = {
  'h': 'Home',
  't': 'Top',
  'i': 'Intro',
  'n': 'Translation',
  'r': 'Result',
  'c': 'Cite'
}

item_anchor_abbreviation_href_dictionary = {
  'h': '/',
  't': '#',
  'i': '#introduction',
  'n': '#translation',
  'r': '#result',
  'c': '#cite'
}

item_anchor_abbreviation_title_dictionary = {
  'h': 'Home page',
  't': 'Jump back to top',
  'i': 'Introduction',
  'n': 'Translation',
  'r': 'Skip to the result',
  'c': 'Cite this page'
}

def replace_item_anchor_abbreviation(match_object):
  
  type = match_object.group(1)
  
  content = item_anchor_abbreviation_content_dictionary[type]
  href = item_anchor_abbreviation_href_dictionary[type]
  title = item_anchor_abbreviation_title_dictionary[type]
  
  processed_string = f'<@i> {content} | {href} | {title} </@i>'
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_item_anchor_abbreviations(string):
  
  return re.sub(
    r'<@i([htinrc])></@i\1>',
    replace_item_anchor_abbreviation,
    string
  )

################################################################
# Replace assisting romanisation radio
################################################################

# Only the first occurrence is replaced.

# Unprocessed string:
#   <^^></^^>

# Raw regular expression for unprocessed string:
#   <\^\^></\^\^>

# Processed string:
#   <div class="romanisation-radio">
#     <,>romanisation toggling</,>
#     Romanisation~(<kbd>F2</kbd>):~\
#       音標 <^>yam peeu | yin piao | yin biao</^> <br>
#     <input type="radio" name="romanisation"
#         id="romanisation-none" value="none">
#       <label for="romanisation-none">None</label>
#     <input type="radio" name="romanisation"
#         id="romanisation-conway" value="conway">
#       <label for="romanisation-conway">Conway</label>
#     <input type="radio" name="romanisation"
#         id="romanisation-wadegiles" value="wadegiles">
#       <label for="romanisation-wadegiles">Wade--Giles</label>
#     <input type="radio" name="romanisation"
#         id="romanisation-pinyin" value="pinyin">
#       <label for="romanisation-pinyin">Pinyin</label>
#   </div>

def replace_assisting_romanisation_radio(string):
  
  processed_string = r'''
    <div class="romanisation-radio">
      <,>romanisation toggling</,>
      Romanisation~(<kbd>F2</kbd>):~音標 <^>yam peeu | yin piao | yin biao</^>
      <br>
      <input type="radio" name="romanisation"
          id="romanisation-none" value="none">
        <label for="romanisation-none">None</label>
      <input type="radio" name="romanisation"
          id="romanisation-conway" value="conway">
        <label for="romanisation-conway">Conway</label>
      <input type="radio" name="romanisation"
          id="romanisation-wadegiles" value="wadegiles">
        <label for="romanisation-wadegiles">Wade--Giles</label>
      <input type="radio" name="romanisation"
          id="romanisation-pinyin" value="pinyin">
        <label for="romanisation-pinyin">Pinyin</label>
    </div>
  '''
  
  return re.sub(
    r'<\^\^></\^\^>',
    escape_python_backslash(processed_string),
    string,
    count = 1
  )

################################################################
# Replace SVG style abbreviations
################################################################

# Unprocessed string:
#   <-{type}></-{type}>
# where {type} is one of s, t, m, lc, tc

# Raw regular expressions for unprocessed string:
#   <\-t></\-t>
#   <\-m></\-m>

# Processed string for {type} s:
#   stroke: black;
#   vector-effect: non-scaling-stroke;
# Processed string for {type} t:
#   text {
#     font-family: sans-serif;
#     text-anchor: middle;
#   }
# Processed string for {type} m:
#   @font-face {
#     font-display: swap;
#     font-family: "KaTeX_Math-Italic";
#     src:
#       url("/fonts/KaTeX_Math-Italic.woff2") format("woff2"),
#       url("/fonts/KaTeX_Math-Italic.woff") format("woff"),
#       url("/fonts/KaTeX_Math-Italic.ttf") format("truetype");
#   }
#   @font-face {
#     font-display: swap;
#     font-family: "KaTeX_Main-Regular";
#     src:
#       url("/fonts/KaTeX_Main-Regular.woff2") format("woff2"),
#       url("/fonts/KaTeX_Main-Regular.woff") format("woff"),
#       url("/fonts/KaTeX_Main-Regular.ttf") format("truetype");
#   }
#   .maths-italic {
#     font-family: "KaTeX_Math-Italic", "KaTeX_Main-Regular";
#   }
#   .maths-roman {
#     font-family: "KaTeX_Main-Regular";
#   }
# Processed string for {type} lc:
#   line.red {
#     stroke: red;
#     stroke-width: 3;
#   }
#   line.green {
#     stroke: green;
#     stroke-width: 3;
#   }
#   line.blue {
#     stroke: blue;
#     stroke-width: 3;
#   }
#   line.violet {
#     stroke: darkviolet;
#     stroke-width: 3;
#   }
# Processed string for {type} tc:
#   text.red {
#     fill: red;
#   }
#   text.green {
#     fill: green;
#   }
#   text.blue {
#     fill: blue;
#   }
#   text.violet {
#     fill: darkviolet;
#   }
# where all curly brackets are literal

def replace_all_svg_style_abbreviations(string):
  
  processed_string = '''
    stroke: black;
    vector-effect: non-scaling-stroke;
  '''
  string = re.sub(
    r'<\-s></\-s>',
    escape_python_backslash(processed_string),
    string
  )
  
  processed_string = '''
    text {
      font-family: sans-serif;
      text-anchor: middle;
    }
  '''
  string = re.sub(
    r'<\-t></\-t>',
    escape_python_backslash(processed_string),
    string
  )
  
  processed_string = '''
    @font-face {
      font-display: swap;
      font-family: "KaTeX_Math-Italic";
      src:
        url("/fonts/KaTeX_Math-Italic.woff2") format("woff2"),
        url("/fonts/KaTeX_Math-Italic.woff") format("woff"),
        url("/fonts/KaTeX_Math-Italic.ttf") format("truetype");
    }
    @font-face {
      font-display: swap;
      font-family: "KaTeX_Main-Regular";
      src:
        url("/fonts/KaTeX_Main-Regular.woff2") format("woff2"),
        url("/fonts/KaTeX_Main-Regular.woff") format("woff"),
        url("/fonts/KaTeX_Main-Regular.ttf") format("truetype");
    }
    .maths-italic {
      font-family: "KaTeX_Math-Italic", "KaTeX_Main-Regular";
    }
    .maths-roman {
      font-family: "KaTeX_Main-Regular";
    }
  '''
  string = re.sub(
    r'<\-m></\-m>',
    escape_python_backslash(processed_string),
    string
  )
  
  processed_string = '''
    line.red {
      stroke: red;
      stroke-width: 3;
    }
    line.green {
      stroke: green;
      stroke-width: 3;
    }
    line.blue {
      stroke: blue;
      stroke-width: 3;
    }
    line.violet {
      stroke: darkviolet;
      stroke-width: 3;
    }
  '''
  string = re.sub(
    r'<\-lc></\-lc>',
    escape_python_backslash(processed_string),
    string
  )
  
  processed_string = '''
    text.red {
      fill: red;
    }
    text.green {
      fill: green;
    }
    text.blue {
      fill: blue;
    }
    text.violet {
      fill: darkviolet;
    }
  '''
  string = re.sub(
    r'<\-tc></\-tc>',
    escape_python_backslash(processed_string),
    string
  )
  
  return string

################################################################
# Split string by pipe character and surrounding whitespace
################################################################

def split_by_pipe(string):
  
  string = replace_all_conway_literal_pipes(string)
  
  argument_list = string.split('|')
  argument_list = [argument.strip() for argument in argument_list]
  
  return argument_list

################################################################
# Replace dialogue images
################################################################

# Unprocessed string:
#   <+{pos}> {src} | {alt} </+{pos}>
# where position {pos} is one of h or g

# Raw regular expression for unprocessed string:
#   <\+([hg])>([\s\S]*?)</\+\1>
#   \1 {pos}
#   \2 {arguments}: {src} | {alt}

# Processed string:
#   <+> {src} | {alt} | | | dialogue-{full pos} </+>
# where {full pos} is host if {pos} is h, and guest if {pos} is g.

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_dialogue_image(match_object):
  
  pos = match_object.group(1)
  if pos == 'h':
    full_pos = 'host'
  else:
    full_pos = 'guest'
  
  arguments = match_object.group(2)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Dialogue image <+{pos}> {src} | {alt} </+{pos}> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  src, alt = argument_list[:num_arguments]
  
  processed_string = f'<+> {src} | {alt} | | | dialogue-{full_pos} </+>'
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_dialogue_images(string):
  
  return re.sub(r'<\+([hg])>([\s\S]*?)</\+\1>', replace_dialogue_image, string)

################################################################
# Replace images
################################################################

# Unprocessed string:
#   <+> {src} | {alt} [| title [| width [| class]]] </+>

# Raw regular expression for unprocessed string:
#   <\+>([\s\S]*?)</\+>
#   \1  {arguments}: {src} | {alt} [| title [| width [| class]]]

# Processed string:
#   <img[ class="[class]"] src="{src}" alt="{alt}"\
#     [ title="[title]"][ width="[width]"]>
# where an empty [title], [width] or [class] is equivalent to an omitted one

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_image(match_object):
  
  arguments = match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Image <+> {src} | {alt} [| title [| width [| class]]] </+> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments + 3
  argument_list += [''] * (num_arguments - num_supplied_arguments)
  src, alt, title, width, class_ = argument_list[:num_arguments]
  
  src = escape_attribute_value(src)
  alt = escape_attribute_value(alt)
  title = escape_attribute_value(title)
  width = escape_attribute_value(width)
  class_ = escape_attribute_value(class_)
  
  if title == '':
    title_spec = ''
  else:
    title_spec = f' title="{title}"'
  
  if width == '':
    width_spec = ''
  else:
    width_spec = f' width="{width}"'
  
  if class_ == '':
    class_spec = ''
  else:
    class_spec = f' class="{class_}"'
  
  processed_string = (
    f'<img{class_spec} src="{src}" alt="{alt}"{title_spec}{width_spec}>'
  )
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_images(string):
  
  return re.sub(r'<\+>([\s\S]*?)</\+>', replace_image, string)

################################################################
# Replace assisting romanisations
################################################################

# Unprocessed string:
#   {horizontal whitespace} <^> {conway} | {wadegiles} | {pinyin} </^>

# Raw regular expression for unprocessed string:
#   [^\S\n]*<\^>([\s\S]*?)</\^>
#   \1  {arguments}: {conway} | {wadegiles} | {pinyin}

# Processed string:
#   <span class="romanisation romanisation-conway">\
#     ~(<^e>{conway}</^e>)</span>\
#   <span class="romanisation romanisation-wadegiles">\
#     ~(<^e>{wadegiles}</^e>)</span>\
#   <span class="romanisation romanisation-pinyin">\
#     ~(<^e>{pinyin}</^e>)</span>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_assisting_romanisation(match_object):
  
  arguments = match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 3
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Assisting romanisation <^> {conway} | {wadegiles} | {pinyin} </^> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  conway, wadegiles, pinyin = argument_list[:num_arguments]
  
  processed_string = (
    '<span class="romanisation romanisation-conway">'
      f'~(<^e>{conway}</^e>)</span>'
    '<span class="romanisation romanisation-wadegiles">'
      f'~(<^e>{wadegiles}</^e>)</span>'
    '<span class="romanisation romanisation-pinyin">'
      f'~(<^e>{pinyin}</^e>)</span>'
  )
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_assisting_romanisations(string):
  
  return re.sub(
    r'[^\S\n]*<\^>([\s\S]*?)</\^>',
    replace_assisting_romanisation,
    string
  )

################################################################
# Replace Cantonese & Mandarin romanisations
################################################################

# Unprocessed string:
#   <^cm[gov]> {cantonese} | {mandarin} [| government] </^cm[gov]>
# where [gov] is one of g or n, otherwise omitted

# Raw regular expression for unprocessed string:
#   <\^cm([gn]?)>([\s\S]*?)</\^cm\1>
#   \1  [gov]
#   \2  {arguments}: {cantonese} | {mandarin} [| government]

# Processed string:
#   <@>
#     Cantonese
#     | /cantonese/conway-romanisation.html
#     | Conway's Custom Romanisation for Cantonese
#   </@>:~<^e>{cantonese}</^e>,
#   Mandarin:~<^e>{mandarin}</^e>\
#   [, [full gov] Mandarin (統讀):~<^e>{government}</^e>]
# where [full gov] is Government-regulated if [gov] is g and
# nominally-Communist if [gov] is n

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_cantonese_mandarin_romanisation(match_object):
  
  gov = match_object.group(1)  
  if gov == 'g':
    full_gov = 'Government-regulated'
  elif gov == 'n':
    full_gov = 'nominally-Communist'
  else:
    full_gov = ''
  
  arguments = match_object.group(2)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Cantonese & Mandarin romanisation '
      '<^cm[gov]> {cantonese} | {mandarin} [| government] </^cm[gov]> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments + 1
  argument_list += [''] * (num_arguments - num_supplied_arguments)
  cantonese, mandarin, government = argument_list[:num_arguments]
  
  if gov == '':
    gov_spec = ''
  else:
    if government == '':
      return cch_error_span(
        'Cantonese & Mandarin romanisation '
        '<^cm[gov]> {cantonese} | {mandarin} [| government] </^cm[gov]> '
        'requires non-empty [government] if [gov] is supplied'
      )
    gov_spec = f', {full_gov} Mandarin (統讀):~<^e>{government}</^e>'
  
  processed_string = f'''
    <@>
      Cantonese
      | /cantonese/conway-romanisation.html
      | Conway's Custom Romanisation for Cantonese
    </@>:~<^e>{cantonese}</^e>,
    Mandarin:~<^e>{mandarin}</^e>{gov_spec}
  '''
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_cantonese_mandarin_romanisations(string):
  
  return re.sub(
    r'<\^cm([gn]?)>([\s\S]*?)</\^cm\1>',
    replace_cantonese_mandarin_romanisation,
    string
  )

################################################################
# Replace directed-triangle anchors
################################################################

# Unprocessed string:
#   <@{dir}> {content} | {id} [| title] </@{dir}>
# where {dir} is one of u or d
# and [title] defaults to {content} if supplied explicitly as {empty string}

# Raw regular expression for unprocessed string:
#   <@([ud])>([\s\S]*?)</@\1>
#   \1  {dir}
#   \2  {arguments}: {content} | {id} [| title]

# Processed string:
#   <@> [{triangle}\,{content}] | #{id} [| title] </@>
# where {triangle} is
#   ▲ U+25B2 BLACK UP-POINTING TRIANGLE if {dir} is u and
#   ▼ U+25BC BLACK DOWN-POINTING TRIANGLE if {dir} is d

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_directed_triangle_anchor(match_object):
  
  dir = match_object.group(1)
  if dir == 'u':
    triangle = '▲'
  else:
    triangle = '▼'
  
  arguments = match_object.group(2)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Directed-triangle anchor '
      '<@{dir}> {content} | {id} [| title] </@{dir}> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  content, id_ = argument_list[:num_required_arguments]
  if num_supplied_arguments > num_required_arguments:
    title = argument_list[num_required_arguments]
    if title == '':
      title = content
    title_spec = f'| {title}'
  else:
    title_spec = ''
  
  processed_string = f'<@> [{triangle}\\,{content}] | #{id_}{title_spec} </@>'
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_directed_triangle_anchors(string):
  
  return re.sub(
    r'<@([ud])>([\s\S]*?)</@\1>',
    replace_directed_triangle_anchor,
    string
  )

################################################################
# Replace item anchors
################################################################

# Unprocessed string:
#   <@i> {content} | {href} [| title] </@i>
# where [title] defaults to {content} if supplied explicitly as {empty string}

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <@i>  </@i>

# Processed string:
#   <li><@> {content} | {href} [| title] </@></li>

def replace_all_item_anchors(string):
  
  string = re.sub('<@i>', '<li><@>', string)
  string = re.sub('</@i>', '</@></li>', string)
  
  return string

################################################################
# Replace heading self-link anchors
################################################################

# Unprocessed string:
#   <@{level}> {content} | {id} </@{level}>
# where {level} is one of 2, 3 or 4

# Raw regular expression for unprocessed string:
#   <@([234])>([\s\S]*?)</@\1>
#   \1  {level}
#   \2  {arguments}: {content} | {id}

# Processed string:
#   <h{level} id="{id}"><a class="self-link" href="#{id}"></a>
#     {content}
#   </h{level}>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_heading_self_link_anchor(match_object):
  
  level = match_object.group(1)
  
  arguments = match_object.group(2)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Heading self-link anchor <@{level}> {content} | {id} </@{level}> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  content, id_ = argument_list[:num_arguments]
  
  id_ = escape_attribute_value(id_)
  
  processed_string = f'''
    <h{level} id="{id_}"><a class="self-link" href="#{id_}"></a>
      {content}
    </h{level}>
  '''
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_heading_self_link_anchors(string):
  
  return re.sub(
    r'<@([234])>([\s\S]*?)</@\1>',
    replace_heading_self_link_anchor,
    string
  )

################################################################
# Replace anchors
################################################################

# Unprocessed string:
#   <@> {content} | {href} [| title] </@>
# where [title] defaults to {content} if supplied explicitly as {empty string}

# Raw regular expression for unprocessed string:
#   <@>([\s\S]*?)</@>
#   \1  {arguments}: {content} | {href} [| title]

# Processed string:
#   <a href="{href}"[ title="[title]"]>{content}</a>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_anchor(match_object):
  
  arguments = match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Anchor <@> {content} | {href} [| title] </@> '
      'or Item anchor <@i> {content} | {href} [| title] </@i>'
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  content, href = argument_list[:num_required_arguments]
  if num_supplied_arguments > num_required_arguments:
    title = argument_list[num_required_arguments]
    if title == '':
      title = content
  else:
    title = ''
  
  href = escape_attribute_value(href)
  title = escape_attribute_value(title)
  
  if title == '':
    title_spec = ''
  else:
    title_spec = f' title="{title}"'
  
  processed_string = f'<a href="{href}"{title_spec}>{content}</a>'
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_anchors(string):
  
  return re.sub(r'<@>([\s\S]*?)</@>', replace_anchor, string)

################################################################
# Replace boxed translations
################################################################

# Unprocessed string:
#   <#t[size]> {chinese} | {english} </#t[size]>
# where [size] is n, otherwise omitted

# Raw regular expression for unprocessed string:
#   <#t(n?)>([\s\S]*?)</#t\1>
#   \1  [size]
#   \2  {arguments}: {chinese} | {english}

# Processed string:
#   <div class="boxed[ not-large] translation">
#     {chinese}
#     <hr>
#     {english}
#   </div>
# where [ not-large] is included if and only if [size] is supplied as n

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_boxed_translation(match_object):
  
  size = match_object.group(1)
  if size == '':
    size_spec = ''
  else:
    size_spec = ' not-large'
  
  arguments = match_object.group(2)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 2
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Boxed translation <#t[size]> {chinese} | {english} </#t[size]> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  chinese, english = argument_list[:num_arguments]
  
  processed_string = f'''
    <div class="boxed{size_spec} translation">
      {chinese}
      <hr>
      {english}
    </div>
  '''
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_boxed_translations(string):
  
  return re.sub(
    r'<#t(n?)>([\s\S]*?)</#t\1>',
    replace_boxed_translation,
    string
  )

################################################################
# Replace Sun Tzu headings
################################################################

# Unprocessed string:
#   <;sh> {volume} | {paragraph} | {content} </;sh>

# Raw regular expression for unprocessed string:
#   <;sh>([\s\S]*?)</;sh>
#   \1  {arguments}: {volume} | {paragraph} | {content}

# Processed string:
#   <@3>
#     Vol.~{capital roman volume}~¶{paragraph}.
#     <span class="heading">{content}</span>
#     | {paragraph}
#   </@3>
# where the paragraph symbol is U+00B6 PILCROW SIGN

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_sun_tzu_heading(match_object):
  
  arguments = match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 3
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Sun Tzu heading <;sh> {volume} | {paragraph} | {content} </;sh> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  volume, paragraph, content = argument_list[:num_arguments]
  
  capital_roman_volume = int(volume) * 'I'
  
  processed_string = f'''
    <@3>
      Vol.~{capital_roman_volume}~¶{paragraph}.
      <span class="heading">{content}</span>
      | {paragraph}
    </@3>
  '''
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_sun_tzu_headings(string):
  
  return re.sub(r'<;sh>([\s\S]*?)</;sh>', replace_sun_tzu_heading, string)

################################################################
# Replace Sun Tzu link divisions
################################################################

# Unprocessed string:
#   <;s@@>
#     {volume} | {paragraph} | {a p} | {b p} | {c p} | {c q} | {d p}
#   </;s@@>

# Raw regular expression for unprocessed string:
#   <;s@@>([\s\S]*?)</;s@@>
#   \1  {arguments}:
#         {volume} | {paragraph} | {a p} | {b p} | {c p} | {c q} | {d p}

# Processed string:
#   <@@>
#     <@u>
#       Paragraphs
#       | paragraphs
#       | Volume {capital roman volume}: Paragraph navigation
#     </@u>
#     <@>
#       [manuscript]
#       | /manuscripts/sun-tzu-{small roman volume}-{paragraph}.pdf
#       | Translation manuscript for Vol. {capital roman volume} ¶{paragraph}
#     </@>
#     [<@>
#       A{a p}
#       | https://archive.org/details/02094034.cn/page/n{a p}
#       | Version A: 02094034.cn at archive.org
#     </@>]
#     [<@>
#       B{b p}({b p minus 5})
#       | https://commons.wikimedia.org/w/index.php\
#           ?title=\
#             File%3A\
#             %E6%96%87%E6%B7%B5%E9%96%A3%E5%9B%9B%E5%BA%AB%E5%85%A8%E6%9B%B8\
#             _0797%E5%86%8A.djvu\
#           &page={b p}
#       | Version B: 《文淵閣四庫全書》第0797冊 at Wikimedia Commons
#     </@>]
#     <@>
#       C{c p}({volume}.{c q})
#       | https://ctext.org/sunzi-suan-jing#n{c p}
#       | Version C: ctext.org database page
#     </@>
#     <@>
#       D{d p}
#       | https://ctext.org/library.pl?if=en&file=86926&page={d p}
#       | Version D: 《知不足齋叢書》本 at ctext.org library
#     </@>
#   </@@>
# where the square brackets for [manuscript] are literal,
# and the links for Versions A and B are omitted if {a p} and {b p}
# are {empty string} respectively

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_sun_tzu_link_division(match_object):
  
  arguments = match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 7
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_span(
      'Sun Tzu link division <;s@@> '
      '{volume} | {paragraph} | {a p} | {b p} | {c p} | {c q} | {d p} </;s@@> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied'
    )
  
  num_arguments = num_required_arguments
  volume, paragraph, a_p, b_p, c_p, c_q, d_p = argument_list[:num_arguments]
  
  capital_roman_volume = int(volume) * 'I'
  small_roman_volume = int(volume) * 'i'
  
  paragraphs_link = f'''
    <@u>
      Paragraphs
      | paragraphs
      | Volume {capital_roman_volume}: Paragraph navigation
    </@u>
  '''
  
  manuscript_link = f'''
    <@>
      [manuscript]
      | /manuscripts/sun-tzu-{small_roman_volume}-{paragraph}.pdf
      | Translation manuscript for Vol. {capital_roman_volume} ¶{paragraph}
    </@>
  '''
  
  if a_p == '':
    version_a_link = ''
  else:
    version_a_link = f'''
      <@>
        A{a_p}
        | https://archive.org/details/02094034.cn/page/n{a_p}
        | Version A: 02094034.cn at archive.org
      </@>
    '''
  
  if b_p == '':
    version_b_link = ''
  else:
    b_p_minus_5 = int(b_p) - 5
    version_b_link = rf'''
      <@>
        B{b_p}({b_p_minus_5})
        | https://commons.wikimedia.org/w/index.php\
            ?title=\
              File%3A\
              %E6%96%87%E6%B7%B5%E9%96%A3%E5%9B%9B%E5%BA%AB%E5%85%A8%E6%9B%B8\
              _0797%E5%86%8A.djvu\
            &page={b_p}
        | Version B: 《文淵閣四庫全書》第0797冊 at Wikimedia Commons
      </@>
    '''
      
  version_c_link = f'''
    <@>
      C{c_p}({volume}.{c_q})
      | https://ctext.org/sunzi-suan-jing#n{c_p}
      | Version C: ctext.org database page
    </@>
  '''
  
  version_d_link = f'''
    <@>
      D{d_p}
      | https://ctext.org/library.pl?if=en&file=86926&page={d_p}
      | Version D: 《知不足齋叢書》本 at ctext.org library
    </@>
  '''
  
  processed_string = f'''
    <@@>
      {paragraphs_link}
      {manuscript_link}
      {version_a_link}
      {version_b_link}
      {version_c_link}
      {version_d_link}
    </@@>
  '''
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_sun_tzu_link_divisions(string):
  
  return re.sub(
    r'<;s@@>([\s\S]*?)</;s@@>', 
    replace_sun_tzu_link_division,
    string
  )

################################################################
# Replace preamble
################################################################

# Must be supplied at the very beginning of markup.
# Only the first occurrence is replaced.

# Unprocessed string:
#   <*>
#     {title} | {first created} | {last modified}
#     [| rendering [| description [| css [| js ]]]]
#   </*>
# where [rendering] is specified by including or excluding d, m and r

# Raw regular expression for unprocessed string:
#   <\*>([\s\S]*?)</\*>
#   \1  {arguments}:
#     {title} | {first created} | {last modified}
#     [| rendering [| description [| css [| js ]]]]

# Processed string (beginning):
#   <!DOCTYPE html>
#   <html lang="en">
#   <head>
#     <meta charset="utf-8">
#     <link rel="apple-touch-icon"
#       sizes="180x180" href="/apple-touch-icon.png">
#     <link rel="icon" type="image/png"
#       sizes="32x32" href="/favicon-32x32.png">
#     <link rel="icon" type="image/png"
#       sizes="16x16" href="/favicon-16x16.png">
#     <link rel="manifest" href="/site.webmanifest">
#     <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
#     <meta name="author" content="Conway">
#     [<meta name="description" content="[description]">]
#     <meta name="msapplication-TileColor" content="#00aba9">
#     <meta name="theme-color" content="#ffffff">
#     <meta name="viewport"
#       content="width=device-width, initial-scale=1, minimum-scale=1">
#     <link rel="stylesheet" href="/conway.min.css">
#     [<link rel="stylesheet" href="/conway-katex.min.css">
#     <script defer src="/conway-katex.min.js"></script>]
#     [<script defer src="/conway-render.min.js"></script>]
#     <title>[title \| ]Conway's site</title>
#     [<style>
#       [Conway-special-literal-escaped CSS]
#     </style>]
#   </head>
#   <body[ onload="
#     [dateRender();]
#     [mathsRender();]
#     [romanisationInitialise();]
#     [js]"]>
# where description is omitted if [description] is {empty string},
# "/conway-katex.min.*" are loaded if [rendering] contains m,
# "/conway-render.min.js" is loaded if [rendering] contains any of d, m or r,
# [title \| ] is omitted if {title} is {empty string},
# and [dateRender();], [mathsRender();] and [romanisationInitialise();]
# are called if and only if [rendering] contains d, m and r respectively.

# Processed string (end):
#   </body>
#   </html>

def replace_preamble(string):
  
  global first_created, last_modified
  global year_first_created, year_last_modified
  global require_maths
  
  preamble_regex = re.compile(r'<\*>([\s\S]*?)</\*>')
  preamble_match_object = preamble_regex.match(string)
  if preamble_match_object is None:
    return cch_error_page(
      'Preamble '
      '<*> {title} | {first created} | {last modified} '
      '[| rendering [| description [| css [| js ]]]] </*> '
      'must be supplied at the very beginning of markup',
      'preamble',
      'Preamble element'
    )
  
  arguments = preamble_match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 3
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_page(
      'Preamble '
      '<*> {title} | {first created} | {last modified} '
      '[| rendering [| description [| css [| js ]]]] </*> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied',
      'preamble',
      'Preamble element'
    )
  
  num_arguments = num_required_arguments + 4
  argument_list += [''] * (num_arguments - num_supplied_arguments)
  title, first_created, last_modified, rendering, description, css, js = (
    argument_list[:num_arguments]
  )
  
  # {first created} and {last modified} assumed to be in the form YYYYMMDD.
  # (I probably won't be around come Y10K, i.e. 10000 A.D.)
  year_first_created = first_created[:4]
  year_last_modified = last_modified[:4]
  
  title = escape_attribute_value(title)
  description = escape_attribute_value(description)
  
  if title == '':
    title_with_pipe = ''
  else:
    title_with_pipe = f'{title} \| '
  
  require_date = 'd' in rendering
  require_maths = 'm' in rendering
  require_romanisation = 'r' in rendering
  require_js = js != ''
  require_rendering = require_date or require_maths or require_romanisation
  require_onload = require_rendering or require_js
  
  if require_maths:
    maths_css_js = '''
      <link rel="stylesheet" href="/conway-katex.min.css">
      <script defer src="/conway-katex.min.js"></script>
    '''
  else:
    maths_css_js = ''
  
  if description == '':
    meta_description = ''
  else:
    meta_description = f'<meta name="description" content="{description}">'
  
  if require_rendering:
    rendering_js = '<script defer src="/conway-render.min.js"></script>'
  else:
    rendering_js = ''
  
  if require_onload:
    onload_functions = ''
    if require_date:
      onload_functions += ' dateRender();'
    if require_maths:
      onload_functions += ' mathsRender();'
    if require_romanisation:
      onload_functions += ' romanisationInitialise();'
    if require_js:
      js = escape_conway_special_literals(js)
      js = escape_attribute_value(js)
      onload_functions += js
    onload_functions = onload_functions.lstrip()
    onload_spec = f' onload="{onload_functions}"'
  else:
    onload_spec = ''
  
  if css == '':
    embedded_css = ''
  else:
    css = escape_conway_special_literals(css)
    embedded_css = f'<style>{css}</style>'
  
  processed_string_beginning = f'''
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="utf-8">
      <link rel="apple-touch-icon"
        sizes="180x180" href="/apple-touch-icon.png">
      <link rel="icon" type="image/png"
        sizes="32x32" href="/favicon-32x32.png">
      <link rel="icon" type="image/png"
        sizes="16x16" href="/favicon-16x16.png">
      <link rel="manifest" href="/site.webmanifest">
      <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
      <meta name="author" content="Conway">
      {meta_description}
      <meta name="msapplication-TileColor" content="#00aba9">
      <meta name="theme-color" content="#ffffff">
      <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1">
      <link rel="stylesheet" href="/conway.min.css">
      {maths_css_js}
      {rendering_js}
      <title>{title_with_pipe}Conway's site</title>
      {embedded_css}
    </head>
    <body{onload_spec}>
  '''
  
  processed_string_end = '''
    </body>
    </html>
  '''
  
  string = preamble_regex.sub('', string, count = 1)
  string = string.strip()
  
  string = processed_string_beginning + string + processed_string_end
  
  return string

################################################################
# Replace page properties
################################################################

# Only the first occurrence is replaced.

# Unprocessed string:
#   <*p> [see also] [| misc] </*p>

# Raw regular expression for unprocessed string:
#   <\*p>([\s\S]*?)</\*p>
#   \1  {arguments}: [see also] [| misc]

# Processed string:
#   <p class="page-properties">
#     First created:~{first created} <br>
#     Last modified:~<b>{last modified}</b>[<br>
#     <b>See also:</b>~[see also]][<br>
#     [misc]]
#     [equation rendering noscript]
#   </p>
# where {last modified} links to #history if building the root index.html
# and [equation rendering noscript] is included
# if [rendering] in preamble contains m

def replace_page_properties(string):
  
  page_properties_regex = re.compile(r'<\*p>([\s\S]*?)</\*p>')
  page_properties_match_object = page_properties_regex.search(string)
  if page_properties_match_object is None:
    return string
  
  arguments = page_properties_match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  
  num_arguments = 2
  argument_list += [''] * (num_arguments - num_supplied_arguments)
  see_also, misc = argument_list[:num_arguments]
  
  if see_also == '':
    see_also_spec = ''
  else:
    see_also_spec = f'''
      <br>
      <b>See also:</b>~{see_also}
    '''
  
  if misc == '':
    misc_spec = ''
  else:
    misc_spec = f'''
      <br>
      {misc}
    '''
  
  if is_root_index:
    last_modified_spec = (
      f'<@> <b>{last_modified}</b> | #history | Site history </@>'
    )
  else:
    last_modified_spec = f'<b>{last_modified}</b>'
  
  if require_maths:
    equation_rendering_noscript = '''
      <,>
        <@>
          equation rendering
          | /code/katex-guide.html
          | How to render mathematical equations using KaTeX
        </@>
      </,>
    '''
  else:
    equation_rendering_noscript = ''
  
  processed_string = f'''
    <p class="page-properties">
      First created:~{first_created} <br>
      Last modified:~{last_modified_spec}
      {see_also_spec}
      {misc_spec}
      {equation_rendering_noscript}
    </p>
  '''
  
  return page_properties_regex.sub(
    escape_python_backslash(processed_string),
    string,
    count = 1
  )

################################################################
# Replace cite this page
################################################################

# Only the first occurrence is replaced.

# Unprocessed string:
#   <*c> {text heading} | {tex key} | {tex heading} </*c>

# Raw regular expression for unprocessed string:
#   <\*c>([\s\S]*?)</\*c>
#   \1  {arguments}: {text heading} | {tex key} | {tex heading}

# Processed string:
#   <@2> Cite this page | cite </@2>
#   <ul>
#     <li>Text:
#       <p>
#         Conway~({year last modified}).
#         {text heading}.
#         \<{url}\>
#         [Accessed <span class="date">d~month~yyyy</span>]
#       </p>
#     </li>
#     <li>BibTeX:
#       <pre>
#         @misc《conway-{tex key},
#           author = 《Conway》,
#           year = 《{year last modified}》,
#           title = 《{Conway-special-literal-escaped tex heading}》,
#           howpublished = 《\\url《{url}》》,
#           note = 《[Accessed <span class="date">d\~month\~yyyy</span>]》
#         》
#       </pre>
#     </li>
#     <li>BibLaTeX:
#       <pre>
#         @online《conway-{tex key},
#           author = 《Conway》,
#           year = 《{year last modified}》,
#           title = 《{Conway-special-literal-escaped tex heading}》,
#           url = 《{url}》,
#           urldate = 《<span class="date">yyyy-mm-dd</span>》
#         》
#       </pre>
#     </li>
#   </ul>
# where the square brackets for [Accessed ...] are literal,
# and, for readability,《 and 》 stand for \{ and \}
# (which should render as literal { and })

def replace_cite_this_page(string):
  
  cite_this_page_regex = re.compile(r'<\*c>([\s\S]*?)</\*c>')
  cite_this_page_match_object = cite_this_page_regex.search(string)
  if cite_this_page_match_object is None:
    return string
  
  arguments = cite_this_page_match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  num_required_arguments = 3
  
  if num_supplied_arguments < num_required_arguments:
    return cch_error_page(
      'Cite this page '
      '<*c> {text heading} | {tex key} | {tex heading} </*c> '
      f'requires at least {num_required_arguments} pipe-delimited arguments; '
      f'only {num_supplied_arguments} supplied',
      'cite-this-page',
      'Cite this page element'
    )
  
  num_arguments = num_required_arguments
  text_heading, tex_key, tex_heading = argument_list[:num_arguments]
  
  tex_heading = escape_conway_special_literals(tex_heading)
  tex_heading = remove_unnecessary_whitespace(tex_heading)
  
  # NOTE: <pre> ... </pre> must be used rather than <``> ... </``>
  # in order for <span class="date">d\~month\~yyyy</span> to actually render
  # today's date, rather than appear literally
  
  processed_string = '''
    <@2> Cite this page | cite </@2>
    <ul>
      <li>Text:
        <p>
          Conway~({year_last_modified}).
          {text_heading}.
          \<{url}\>
          [Accessed <span class="date">d~month~yyyy</span>]
        </p>
      </li>
      <li>BibTeX:
        <pre>
          @misc《conway-{tex_key},
            author = 《Conway》,
            year = 《{year_last_modified}》,
            title = 《{tex_heading}》,
            howpublished = 《\\url《{url}》》,
            note = 《[Accessed <span class="date">d\~month\~yyyy</span>]》
          》
        </pre>
      </li>
      <li>BibLaTeX:
        <pre>
          @online《conway-{tex_key},
            author = 《Conway》,
            year = 《{year_last_modified}》,
            title = 《{tex_heading}》,
            url = 《{url}》,
            urldate = 《<span class="date">yyyy-mm-dd</span>》
          》
        </pre>
      </li>
    </ul>
  '''
  
  # NOTE: doubled curly brackets are required for replacing 《 and 》 below
  # since processed_string will be passed to str.format().
  # The replacements must be performed before str.format() because
  # the strings inserted by str.format() may contain 《 and 》,
  # which we have only used for readability of the code above.
  
  # Conway-escaped italic brackets: 《 and 》 to \{ and \}
  processed_string = re.sub('《', r'\\{{', processed_string)
  processed_string = re.sub('》', r'\\}}', processed_string)
  
  processed_string = processed_string.format(
    year_last_modified = year_last_modified,
    url = url,
    text_heading = text_heading,
    tex_key = tex_key,
    tex_heading = tex_heading
  )
  
  return cite_this_page_regex.sub(
    escape_python_backslash(processed_string),
    string,
    count = 1
  )

################################################################
# Replace footer
################################################################

# Only the first occurrence is replaced.

# Unprocessed string:
#   <*f> [copyright exception] [| ending remark] </*f>

# Raw regular expression for unprocessed string:
#   <\*f>([\s\S]*?)</\*f>
#   \1  {arguments}: [copyright exception] [| ending remark]

# Processed string:
#   <footer>
#     <hr>
#     ©~{year first created}[--year last modified]~Conway[,
#     [copyright exception]].[<br>
#     [ending remark]]
#   </footer>
# where [--year last modified] is only included if {year last modified}
# is greater than {year first created},
# and a default [ending remark] is used if building the root index.html.

def replace_footer(string):
  
  footer_regex = re.compile(r'<\*f>([\s\S]*?)</\*f>')
  footer_match_object = footer_regex.search(string)
  if footer_match_object is None:
    return string
  
  arguments = footer_match_object.group(1)
  argument_list = split_by_pipe(arguments)
  
  num_supplied_arguments = len(argument_list)
  
  num_arguments = 2
  argument_list += [''] * (num_arguments - num_supplied_arguments)
  copyright_exception, ending_remark = argument_list[:num_arguments]
  
  if is_root_index:
    next_year = int(year_last_modified) + 1
    ending_remark = f'''
      And if the current year is greater than~{year_last_modified}:
      no, the footer is not "out of date".
      It means that I haven't thought up or gotten around to adding content
      since~{next_year}; possibly I have died.
    '''
  
  year_range = year_first_created
  
  if int(year_last_modified) > int(year_first_created):
    year_range += f'--{year_last_modified}'
  
  if copyright_exception == '':
    copyright_exception_spec = ''
  else:
    copyright_exception_spec = f', {copyright_exception}'
  
  if ending_remark == '':
    ending_remark_spec = ''
  else:
    ending_remark_spec = f'''
      <br>
      {ending_remark}
    '''
  
  processed_string = f'''
    <footer>
      <hr>
      ©~{year_range}~Conway{copyright_exception_spec}.
      {ending_remark_spec}
    </footer>
  '''
  
  return footer_regex.sub(
    escape_python_backslash(processed_string),
    string,
    count = 1
  )

################################################################
# Replace HTML noscript elements
################################################################

# Unprocessed string:
#   <,> {content} </,>

# Raw regular expression for unprocessed string:
#   <\,>([\s\S]*?)</\,>
#   \1  {content}

# Processed string:
#   <noscript>Enable Javascript for {content} to work.</noscript>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_html_noscript(match_object):
  
  content = match_object.group(1)
  content = content.strip()
  
  processed_string = (
    f'<noscript>Enable Javascript for {content} to work.</noscript>'
  )
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_html_noscripts(string):
  
  return re.sub(r'<\,>([\s\S]*?)</\,>', replace_html_noscript, string)

################################################################
# Replace assisting numerals
################################################################

# Unprocessed string:
#   {horizontal whitespace} <_>{content}</_>

# Raw regular expression for unprocessed string
# (opening and closing tags are decoupled):
#   [^\S\n]<_>  </_>

# Processed string:
#   <span class="numeral">~(<_e>{content}</_e>)</span>

def replace_all_assisting_numerals(string):
  
  string = re.sub('[^\S\n]<_>', '<span class="numeral">~(<_e>', string)
  string = re.sub('</_>', '</_e>)</span>', string)
  
  return string

################################################################
# Replace formatted spans
################################################################

# Unprocessed string:
#   <:{type}>{content}</:{type}>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <:r>  </:r>
#   <:g>  </:g>
#   <:b>  </:b>
#   <:v>  </:v>
#   <:y>  </:y>
#   <:h>  </:h>
#   <:t>  </:t>

# Processed string for {type} r:
#   <span class="red">{content}</span>

# Processed string for {type} g:
#   <span class="green">{content}</span>

# Processed string for {type} b:
#   <span class="blue">{content}</span>

# Processed string for {type} v:
#   <span class="violet">{content}</span>

# Processed string for {type} y:
#   <span class="lightyellow">{content}</span>

# Processed string for {type} h:
#   <span class="highlighted-part">{content}</span>

# Processed string for {type} t:
#   <span class="thought">{content}</span>

def replace_all_formatted_spans(string):
  
  string = re.sub('<:r>', '<span class="red">', string)
  string = re.sub('</:r>', '</span>', string)
  
  string = re.sub('<:g>', '<span class="green">', string)
  string = re.sub('</:g>', '</span>', string)
  
  string = re.sub('<:b>', '<span class="blue">', string)
  string = re.sub('</:b>', '</span>', string)
  
  string = re.sub('<:v>', '<span class="violet">', string)
  string = re.sub('</:v>', '</span>', string)
  
  string = re.sub('<:y>', '<span class="lightyellow">', string)
  string = re.sub('</:y>', '</span>', string)
  
  string = re.sub('<:h>', '<span class="highlighted-part">', string)
  string = re.sub('</:h>', '</span>', string)
  
  string = re.sub('<:t>', '<span class="thought">', string)
  string = re.sub('</:t>', '</span>', string)
  
  return string

################################################################
# Replace boxed divisions
################################################################

# Unprocessed string:
#   <#[type]>{content}</#[type]>
# where [type] is one of c or n, otherwise omitted

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <#>   </#>
#   <#c>  </#c>
#   <#n>  </#n>

# Processed string for omitted [type]:
#   <div class="boxed">{content}</div>

# Processed string for [type] c:
#   <div class="boxed centred-text">{content}</div>

# Processed string for [type] n:
#   <div class="boxed not-large">{content}</div>

def replace_all_boxed_divisions(string):
  
  string = re.sub('<#>', '<div class="boxed">', string)
  string = re.sub('</#>', '</div>', string)
  
  string = re.sub('<#c>', '<div class="boxed centred-text">', string)
  string = re.sub('</#c>', '</div>', string)
  
  string = re.sub('<#n>', '<div class="boxed not-large">', string)
  string = re.sub('</#n>', '</div>', string)
  
  return string

################################################################
# Replace dialogue divisions
################################################################

# Unprocessed string:
#   <~~>{content}</~~>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <~~>  </~~>

# Processed string:
#   <div class="dialogue">
#     {content}
#     <div class="end">END</div>
#   </div>

def replace_all_dialogue_divisions(string):
  
  string = re.sub('<~~>', '<div class="dialogue">', string)
  string = re.sub('</~~>', r'<div class="end">END</div>\n</div>', string)
  
  return string

################################################################
# Replace dialogue paragraphs
################################################################

# Unprocessed string:
#   <~{pos}[type]>{content}</~{pos}[type]>
# where {pos} is one of h or g and [type] is t, otherwise omitted

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <~g>    </~g>
#   <~gt>   </~gt>
#   <~h>    </~h>
#   <~ht>   </~ht>

# Processed string for {pos} g and omitted [type]:
#   <p class="dialogue-guest">{content}</p>

# Processed string for {pos} g and [type] t:
#   <p class="dialogue-guest thought">{content}</p>

# Processed string for {pos} h and omitted [type]:
#   <p class="dialogue-host">{content}</p>

# Processed string for {pos} h and [type] t:
#   <p class="dialogue-host thought">{content}</p>

def replace_all_dialogue_paragraphs(string):
  
  string = re.sub('<~g>', '<p class="dialogue-guest">', string)
  string = re.sub('</~g>', '</p>', string)
  
  string = re.sub('<~gt>', '<p class="dialogue-guest thought">', string)
  string = re.sub('</~gt>', '</p>', string)
  
  string = re.sub('<~h>', '<p class="dialogue-host">', string)
  string = re.sub('</~h>', '</p>', string)
  
  string = re.sub('<~ht>', '<p class="dialogue-host thought">', string)
  string = re.sub('</~ht>', '</p>', string)
  
  return string

################################################################
# Replace link divisions
################################################################

# Unprocessed string:
#   <@@>{content}</@@>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <@@>  </@@>

# Processed string:
#   <div class="links">{content}</div>

def replace_all_link_divisions(string):
  
  string = re.sub('<@@>', '<div class="links">', string)
  string = re.sub('</@@>', '</div>', string)
  
  return string

################################################################
# Replace header navigation bars
################################################################

# Unprocessed string:
#   <=h>{content}</=h>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <=h>  </=h>

# Processed string:
#   <header><=>{content}</=></header>

def replace_all_header_navigation_bars(string):
  
  string = re.sub('<=h>', '<header><=>', string)
  string = re.sub('</=h>', '</=></header>', string)
  
  return string

################################################################
# Replace navigation bars
################################################################

# Unprocessed string:
#   <=>{content}</=>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <=>  </=>

# Processed string:
#   <nav><ul>{content}</ul></nav>

def replace_all_navigation_bars(string):
  
  string = re.sub('<=>', '<nav><ul>', string)
  string = re.sub('</=>', '</ul></nav>', string)
  
  return string

################################################################
# Replace note paragraphs
################################################################

# Unprocessed string:
#   <.>{content}</.>

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <\.>  </\.>

# Processed string:
#   <p class="note">{content}</p>

def replace_all_note_paragraphs(string):
  
  string = re.sub('<\.>', '<p class="note">', string)
  string = re.sub('</\.>', '</p>', string)
  
  return string

################################################################
# Replace overflowing divisions
################################################################

# Unprocessed string:
#   <![type]>{content}</![type]>
# where [type] is one of c or cc, otherwise omitted

# Raw regular expressions for unprocessed string
# (opening and closing tags are decoupled):
#   <!>     </!>
#   <!c>    </!c>
#   <!cc>   </!cc>

# Processed string for omitted [type]:
#   <div class="overflowing">{content}</div>

# Processed string for [type] c:
#   <div class="centred-flex"><div class="overflowing">{content}</div></div>

# Processed string for [type] cc:
#   <div class="centred-flex"><div class="centred-text overflowing">
#     {content}
#   </div></div>

def replace_all_overflowing_divisions(string):
  
  string = re.sub('<!>', '<div class="overflowing">', string)
  string = re.sub('</!>', '</div>', string)
  
  string = re.sub(
    '<!c>',
    '<div class="centred-flex"><div class="overflowing">',
    string
  )
  string = re.sub('</!c>', '</div></div>', string)
  
  string = re.sub(
    '<!cc>',
    '<div class="centred-flex"><div class="centred-text overflowing">',
    string
  )
  string = re.sub('</!cc>', '</div></div>', string)
  
  return string

################################################################
# Replace SVG style containers
################################################################

# Unprocessed string:
#   <-->{content}</-->

# Raw regular expressions for unprocessed string:
#   <\-\->([\s\S]*?)</\-\->
#   \1  {content}

# Processed string:
#   <svg class="embedded-styles"><style>
#     {Conway-special-literal-escaped content}
#   </style></svg>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_svg_style_container(match_object):
  
  content = match_object.group(1)
  content = escape_conway_special_literals(content)
  
  processed_string = (
    f'<svg class="embedded-styles"><style>{content}</style></svg>'
  )
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_svg_style_containers(string):
  
  return re.sub(
    r'<\-\->([\s\S]*?)</\-\->',
    replace_svg_style_container,
    string
  )

################################################################
# Replace text romanisations
################################################################

# Unprocessed string:
#   <^e> {content} </^e>

# Raw regular expression for unprocessed string:
#   <\^e>([\s\S]*?)</\^e>
#   \1  {content}

# Processed string:
#   {romanisation-unescaped content}

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_text_romanisation(match_object):
  
  content = match_object.group(1)
  content = content.strip()
  
  content = replace_all_conway_literal_backslashes(content)
  
  content = unescape_romanisations(content)
  
  return content

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_text_romanisations(string):
  
  return re.sub(r'<\^e>([\s\S]*?)</\^e>', replace_text_romanisation, string)

################################################################
# Replace text numerals
################################################################

# Unprocessed string:
#   <_e> {content} </_e>

# Raw regular expression for unprocessed string:
#   <_e>([\s\S]*?)</_e>
#   \1  {content}

# Processed string:
#   {math-processed content}
# with processing of {content} as follows:
#   1.  Horizontal whitespace around ^ and * is removed
#   2.  ^{exponent} is converted to <sup>{exponent}</sup>
#   3.  - is converted to − (U+2212 MINUS SIGN)
#   4.  * is converted to × (U+00D7 MULTIPLICATION SIGN)
#       surrounded by ' ' (U+205F MEDIUM MATHEMATICAL SPACE) on either side

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_text_numeral(match_object):
  
  content = match_object.group(1)
  
  content = re.sub(r'[^\S\n]*([*^])[^\S\n]*', r'\1', content)
  content = re.sub(r'\^([+-]?[0-9]*)', r'<sup>\1</sup>', content)
  content = re.sub(r'\-', '−', content)
  content = re.sub(r'\*', ' × ', content)
  
  return content

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_text_numerals(string):
  
  return re.sub(r'<_e>([\s\S]*?)</_e>', replace_text_numeral, string)

################################################################
# Escape Python (for regex replacement strings)
################################################################

def escape_python_backslash(string):
  
  # Escape \ as \\
  return re.sub(r'\\', r'\\\\', string)

################################################################
# Escape Quotes (for attribute values)
################################################################

def escape_quotes(string):
  
  # Escape " as &quot;
  return re.sub('"', '&quot;', string)

################################################################
# Escape HTML
################################################################

def escape_html(string):
  
  # Escape & as &amp;
  string = re.sub('&', '&amp;', string)
  
  # Escape < as &lt;
  string = re.sub('<', '&lt;', string)
  
  # Escape > as &gt;
  string = re.sub('>', '&gt;', string)
  
  return string

################################################################
# Replace Conway literal backslashes with temporary replacements
################################################################

# Unprocessed string:
#   \\

# Raw regular expression for unprocessed string:
#   \\\\

# Processed string:
#   \

def replace_all_conway_literal_backslashes(string):
  
  processed_string = '\\'
  
  return re.sub(
    r'\\\\',
    create_temporary_replacement_string(processed_string),
    string
  )

################################################################
# Replace Conway literal pipes with temporary replacements
################################################################

# Unprocessed string:
#   \|

# Raw regular expression for unprocessed string:
#   \\\|

# Processed string:
#   |

def replace_all_conway_literal_pipes(string):
  
  processed_string = '|'
  
  return re.sub(
    r'\\\|',
    create_temporary_replacement_string(processed_string),
    string
  )

################################################################
# Replace Conway literal tildes with temporary replacements
################################################################

# Unprocessed string:
#   \~

# Raw regular expression for unprocessed string:
#   \\~

# Processed string:
#   ~

def replace_all_conway_literal_tildes(string):
  
  processed_string = '~'
  
  return re.sub(
    r'\\~',
    create_temporary_replacement_string(processed_string),
    string
  )

################################################################
# Replace Conway literal hyphen runs with temporary replacements
################################################################

# Unprocessed string:
#   \{hyphen run}
# where there are 2 or more hyphens

# Raw regular expression for unprocessed string:
#   \\([-]{2,})
#   \1  {hyphen run}

# Processed string:
#   {hyphen run}

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_conway_literal_hyphen_run(match_object):
  
  hyphen_run = match_object.group(1)
  
  return create_temporary_replacement_string(hyphen_run)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_conway_literal_hyphen_runs(string):
  
  return re.sub(
    r'\\([-]{2,})',
    replace_conway_literal_hyphen_run,
    string
  )

################################################################
# Replace Conway literal curly brackets with temporary replacements
################################################################

# Unprocessed strings:
#   \{  \}

# Raw regular expression for unprocessed strings
# (opening and closing brackets are decoupled):
#   \\\{
#   \\\}

# Processed strings:
#   {   }

def replace_all_conway_literal_curly_brackets(string):
  
  processed_string = '{'
  
  string = re.sub(
    r'\\\{',
    create_temporary_replacement_string(processed_string),
    string
  )
  
  processed_string = '}'
  
  string = re.sub(
    r'\\\}',
    create_temporary_replacement_string(processed_string),
    string
  )
  
  return string

################################################################
# Replace Conway literal empty strings with temporary replacements
################################################################

# Unprocessed string:
#   \!

# Raw regular expression for unprocessed string:
#   \\!

# Processed string:
#   {empty string}

def replace_all_conway_literal_empty_strings(string):
  
  processed_string = ''
  
  return re.sub(
    r'\\!',
    create_temporary_replacement_string(processed_string),
    string
  )

################################################################
# Replace Conway literal Chinese runs with temporary replacements
################################################################

# Unprocessed string:
#   \{Chinese run}

# Raw regular expression for unprocessed string:
#   \\([{Chinese character range}]+)
#   \1  {Chinese run}

# Processed string:
#   {Chinese run}

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_conway_literal_chinese(match_object):
  
  chinese_run = match_object.group(1)
  
  processed_string = chinese_run
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_conway_literal_chinese_runs(string):
  
  return re.sub(
    rf'\\([{CHINESE_CHARACTER_RANGE}]+)',
    replace_conway_literal_chinese,
    string
  )

################################################################
# Escape Conway special literals
################################################################

def escape_conway_special_literals(string):
  
  # Escape ~ as \~
  string = re.sub(r'~', r'\\~', string)
  
  # Escape {hyphen run} (2 or more hyphens) as \{hyphen run}
  string = re.sub(r'[-]{2,}', r'\\\g<0>', string)
  
  # Escape { as \{
  string = re.sub(r'\{', r'\\{', string)
  
  # Escape } as \}
  string = re.sub(r'\}', r'\\}', string)
  
  return string

################################################################
# Ensure Conway-escaped HTML
################################################################

# Ensures that &, < and > which are not preceded by a backslash
# are replaced with their Conway-escaped forms \&, \< and \>.
# Used in attribute value escaping.

def ensure_conway_escaped_html(string):
  
  string = replace_all_conway_literal_backslashes(string)
  
  string = re.sub(r'(?<!\\)&', r'\\&', string)
  string = re.sub(r'(?<!\\)<', r'\\<', string)
  string = re.sub(r'(?<!\\)>', r'\\>', string)
  
  return string

################################################################
# Ensure Conway-escaped Chinese runs
################################################################

# Ensures that any {Chinese run} not preceded by a backslash
# is replaced with its Conway-escaped form \{Chinese run}.
# Used in attribute value escaping.

def ensure_conway_escaped_chinese_run(string):
  
  string = replace_all_conway_literal_backslashes(string)
  string = unescape_katakana_middle_dot(string)
  
  string = re.sub(
    rf'(?<!\\)([{CHINESE_CHARACTER_RANGE}]+)',
    r'\\\1',
    string
  )
  
  return string

################################################################
# Escape attribute values
################################################################

def escape_attribute_value(string):
  
  string = replace_all_text_romanisations(string)
  string = ensure_conway_escaped_html(string)
  string = ensure_conway_escaped_chinese_run(string)
  string = remove_conway_italics(string)
  string = escape_quotes(string)
  
  return string

################################################################
# Range of Chinese characters
################################################################

CHINESE_CHARACTER_RANGE = (
  
  # ----------------------------------------------------------------
  # U+2E80 to U+2EFF (CJK Radicals Supplement)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/CJK_Radicals_Supplement
  
  '\u2E80-\u2EFF'     # All
  
  # ----------------------------------------------------------------
  # U+2F00 to U+2FDF (Kangxi Radicals)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/Kangxi_Radicals
  
  '\u2F00-\u2FDF'     # All
  
  # ----------------------------------------------------------------
  # U+2FF0 to U+2FFF (Ideographic Description Characters)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   Ideographic_Description_Characters
  
  '\u2FF0-\u2FFF'     # All
  
  # ----------------------------------------------------------------
  # U+3000 to U+303F (CJK Symbols and Punctuation)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Symbols_and_Punctuation
  
  '\u3000-\u3002'     # Ideographic space (　), comma (、) and full stop (。)
  '\u3005'            # Ideographic iteration mark (々)
  '\u3007'            # Ideographic number zero (〇)
  '\u3008-\u3011'     # Brackets
  '\u301C'            # Wave dash
  '\u3021-\u3029'     # Suzhou numerals one through nine
  '\u302A-\u302D'     # Ideographic tone marks (four tones 平上去入)
  '\u3038-\u303A'     # Suzhou numerals ten, twenty and thirty
  
  # ----------------------------------------------------------------
  # U+30A0 to U+30FF (Katakana)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/Katakana
  
  '\u30FB'            # Katakana middle dot (・)
  
  # ----------------------------------------------------------------
  # U+31C0 to U+31EF (CJK Strokes)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/CJK_Strokes
  
  '\u31C0-\u31EF'     # All
  
  # ----------------------------------------------------------------
  # U+3400 to U+4DBF (CJK Unified Ideographs Extension A)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_A
  
  '\u3400-\u4DBF'     # All
  
  # ----------------------------------------------------------------
  # U+4DC0 to U+4DFF (Yijing Hexagram Symbols)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/Yijing_Hexagram_Symbols
  
  '\u4DC0-\u4DFF'     # All
  
  # ----------------------------------------------------------------
  # U+4E00 to U+9FFF (CJK Unified Ideographs)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/CJK_Unified_Ideographs
  
  '\u4E00-\u9FFF'     # All
  
  # ----------------------------------------------------------------
  # U+A700 to U+A71F (Modifier Tone Letters)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/Modifier_Tone_Letters
  
  '\uA700-\uA707'     # Eight tone modifiers (陰平 through 陽入)
  
  # ----------------------------------------------------------------
  # U+F900 to U+FAFF (CJK Compatibility Ideographs)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Compatibility_Ideographs
  
  '\uF900-\uFAFF'     # All
  
  # ----------------------------------------------------------------
  # U+FF00 to U+FFEF (Halfwidth and Fullwidth Forms)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   Halfwidth_and_Fullwidth_Forms
  
  '\uFF01-\uFF1F'     # Fullwidth punctuation and digits
  '\uFF3B-\uFF3E'     # Fullwidth punctuation
  '\uFF5B-\uFF60'     # Fullwidth punctuation
  
  # ----------------------------------------------------------------
  # U+20000 to U+2A6DF (CJK Unified Ideographs Extension B)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_B
  
  '\U00020000-\U0002A6DF'   # All
  
  # ----------------------------------------------------------------
  # U+2A700 to U+2B73F (CJK Unified Ideographs Extension C)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_C
  
  '\U0002A700-\U0002B73F'   # All
  
  # ----------------------------------------------------------------
  # U+2B740 to U+2B81F (CJK Unified Ideographs Extension D)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_D
  
  '\U0002B740-\U0002B81F'   # All
  
  # ----------------------------------------------------------------
  # U+2B820 to U+2CEAF (CJK Unified Ideographs Extension E)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_E
  
  '\U0002B820-\U0002CEAF'   # All
  
  # ----------------------------------------------------------------
  # U+2CEB0 to U+2EBEF (CJK Unified Ideographs Extension F)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Unified_Ideographs_Extension_F
  
  '\U0002CEB0-\U0002EBEF'   # All
  
  # ----------------------------------------------------------------
  # U+2F800 to U+2FA1F (CJK Compatibility Ideographs Supplement)
  # ----------------------------------------------------------------
  # https://en.wiktionary.org/wiki/Appendix:Unicode/\
  #   CJK_Compatibility_Ideographs_Supplement
  
  '\U0002F800-\U0002FA1F'   # All

)

################################################################
# Unescape Katakana middle dot
################################################################

def unescape_katakana_middle_dot(string):
  
  # Unescape \. as ・ U+30FB KATAKANA MIDDLE DOT
  string = re.sub(r'\\\.', '・', string)
  
  return string

################################################################
# Unescape Conway
################################################################

def unescape_conway(string):
  
  # Unescape \\ as \
  string = replace_all_conway_literal_backslashes(string)
  
  # Unescape \| as |
  string = replace_all_conway_literal_pipes(string)
  
  # Unescape \~ as ~
  string = replace_all_conway_literal_tildes(string)
  
  # Unescape \{hyphen run} (2 or more hyphens) as {hyphen run}
  string = replace_all_conway_literal_hyphen_runs(string)
  
  # Unescape \{ as {
  # Unescape \} as }
  string = replace_all_conway_literal_curly_brackets(string)
  
  # Unescape \! as {empty string}
  string = replace_all_conway_literal_empty_strings(string)
  
  # Unescape ~ as &nbsp;
  string = re.sub('~', '&nbsp;', string)
  
  # Unescape --- as — U+2014 EM DASH
  string = re.sub('[-]{3}', '—', string)
  
  # Unescape -- as – U+2013 EN DASH
  string = re.sub('[-]{2}', '–', string)
  
  # Unescape \. as ・ U+30FB KATAKANA MIDDLE DOT
  string = unescape_katakana_middle_dot(string)
  
  # Unescape \{Chinese run} as {Chinese run}
  string = replace_all_conway_literal_chinese_runs(string)
  
  # Unescape \& as &amp;
  string = re.sub(r'\\&', '&amp;', string)
  
  # Unescape \< as &lt;
  string = re.sub(r'\\<', '&lt;', string)
  
  # Unescape \> as &gt;
  string = re.sub(r'\\>', '&gt;', string)
  
  # Unescape \LORD as Lord in small caps;
  string = re.sub(r'\\LORD', '<span class="small-caps">Lord</span>', string)
  
  # Unescape \_ as &numsp;
  string = re.sub(r'\\_', '&numsp;', string)
  
  # Unescape \, as &thinsp;
  string = re.sub(r'\\,', '&thinsp;', string)
  
  # Unescape \/ as \=/yawnoc.github.io/blob/master/
  string = re.sub(r'\\/', '\\=/yawnoc.github.io/blob/master/', string)
  
  # Unescape \= as https://github.com/yawnoc
  string = re.sub(r'\\=', 'https://github.com/yawnoc', string)
  
  # Unescape \or as <span class="alternative-type">or</span>
  string = re.sub(
    r'\\or',
    '<span class="alternative-type">or</span>',
    string
  )
  
  # Unescape \lit as <span class="alternative-type">lit.</span>
  string = re.sub(
    r'\\lit',
    '<span class="alternative-type">lit.</span>',
    string
  )
  
  # Unescape \sic as {sic}
  string = re.sub(r'\\sic', '{sic}', string)
  
  return(string)

################################################################
# Unescape romanisations
################################################################

def unescape_romanisations(string):
  
  # Conway only
  string = re.sub('oe', 'œ', string)
  
  # Wade–Giles only
  string = re.sub(r'e\^', 'ê', string)
  string = re.sub('uu', 'ŭ', string)
  
  # Pinyin tone 1 陰平 (dark level) only
  string = re.sub('a=', 'ā', string)
  string = re.sub('e=', 'ē', string)
  string = re.sub('i=', 'ī', string)
  string = re.sub('o=', 'ō', string)
  string = re.sub('u=', 'ū', string)
  string = re.sub('u"=', 'ǖ', string)
  
  # Pinyin tone 2 陽平 (light level) only
  string = re.sub(r'a\/', 'á', string)
  string = re.sub(r'e\/', 'é', string)
  string = re.sub(r'i\/', 'í', string)
  string = re.sub(r'o\/', 'ó', string)
  string = re.sub(r'u\/', 'ú', string)
  string = re.sub(r'u"\/', 'ǘ', string)
  
  # Pinyin tone 3 上 (rising) only
  string = re.sub('av', 'ǎ', string)
  string = re.sub('ev', 'ě', string)
  string = re.sub('iv', 'ǐ', string)
  string = re.sub('ov', 'ǒ', string)
  string = re.sub('uv', 'ǔ', string)
  string = re.sub('u"v', 'ǚ', string)
  
  # Pinyin tone 4 去 (departing) only
  string = re.sub(r'a\\', 'à', string)
  string = re.sub(r'e\\', 'è', string)
  string = re.sub(r'i\\', 'ì', string)
  string = re.sub(r'o\\', 'ò', string)
  string = re.sub(r'u\\', 'ù', string)
  string = re.sub(r'u"\\', 'ǜ', string)
  
  # Common
  string = re.sub('u"', 'ü', string)
  
  return string

################################################################
# Wrap Chinese runs in a language span
################################################################

# Unprocessed string:
#   Repetitions of [<span class="{class}">...]{Chinese run}[...</span>]
# This allows for all formatted spans.
# No check is performed for mismatched tags.

# Raw regular expression for unprocessed string:
#   (
#     (<span class="[^"]+?">)*
#     {Chinese run regular expression}
#     (</span>)*
#   )+
#   \g<0>   {unprocessed string} in its entirety

# Processed string:
#   <span lang="zh-Hant">{Chinese run}</span>

def wrap_chinese_runs(string):
  
  return re.sub(
    (
      '('
        '(<span class="[^"]+?">)*'
        f'[{CHINESE_CHARACTER_RANGE}]+?'
        '(</span>)*'
      ')+'
    ),
    r'<span lang="zh-Hant">\g<0></span>',
    string
  )

################################################################
# Apply Conway italics
################################################################

# Unprocessed strings:
#   {   }

# Raw regular expression for unprocessed strings
# (opening and closing brackets are decoupled):
#   \{
#   \}

# Processed strings:
#   <i>   </i>

def apply_conway_italics(string):
  
  processed_string = '<i>'
  
  string = re.sub(
    r'\{',
    create_temporary_replacement_string(processed_string),
    string
  )
  
  processed_string = '</i>'
  
  string = re.sub(
    r'\}',
    create_temporary_replacement_string(processed_string),
    string
  )
  
  return string

################################################################
# Remove Conway italics
################################################################

# Removes { and } which are not preceded by a backslash.
# Used in attribute value escaping.

def remove_conway_italics(string):
  
  string = replace_all_conway_literal_backslashes(string)
  
  string = re.sub(r'(?<!\\)\{', '', string)
  string = re.sub(r'(?<!\\)\}', '', string)
  
  return string

################################################################
# Replace preformatted code with temporary replacements
################################################################

# Unprocessed string:
#   <pre> {content} </pre>

# Raw regular expression for unprocessed string:
#   <pre>([\s\S]*?)</pre>
#   \1  {content}

# Processed string:
#   <pre> {de-indented content} </pre>

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_preformatted(match_object):
  
  content = match_object.group(1)
  content = de_indent(content)
  
  processed_string = f'<pre>{content}</pre>'
  
  return create_temporary_replacement_string(processed_string)

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_preformatted(string):
  
  return re.sub(r'<pre>([\s\S]*?)</pre>', replace_preformatted, string)

################################################################
# Remove unnecessary whitespace
################################################################

def remove_unnecessary_whitespace(string):
  
  # De-indent preformatted elements (and temporarily replace them
  # so that subsequent whitespace removal does not affect them)
  string = replace_all_preformatted(string)
  
  # Remove horizontal whitespace around line break elements
  string = re.sub(r'[^\S\n]*<br>[^\S\n]*', '<br>', string)
  
  # Remove leading whitespace and empty lines
  string = re.sub(r'^[\s]+', '', string, flags = re.MULTILINE)
  
  # Remove trailing whitespace
  string = re.sub(r'[\s]+$', '', string, flags = re.MULTILINE)
  
  # Remove newlines immediately following a backslash
  # (i.e. backslash is the line continuation character)
  string = re.sub(r'\\\n', '', string)
  
  # Remove newlines immediately preceding line break elements
  string = re.sub(r'\n<br>', '<br>', string)
  
  # Canonicalise attribute whitespace with
  # (1) a single space before the attribute name, and
  # (2) no whitespace around the equals sign
  string = re.sub(
    r'[\s]+?([\S]+?)[\s]*?=[\s]*?("[^"]*?")',
    r' \1=\2',
    string
  )
  
  return string

################################################################
# De-indent string
################################################################

# A custom implementation of textwrap.dedent, which I am not using
# because it ignores ALL non-empty whitespace-only lines.
# In my case I only ignore non-empty whitespace-only lines
# at the very start and very end of the string.

def de_indent(string):
  
  # Ignore non-empty whitespace-only line at the very start
  string = re.sub(r'^[^\S\n]*\n', '\n', string)
  
  # Ignore non-empty whitespace-only line at the very end
  string = re.sub(r'\n[^\S\n]*$', '\n', string)
  
  # List of all indents, either
  # 1. Non-empty leading horizontal whitespace; or
  # 2. The leading empty string on a non-empty line.
  indent_list = re.findall(
    r'^[^\S\n]+|^(?=[^\n])',
    string,
    flags = re.MULTILINE
  )
  
  # Determine longest common indent
  indent = longest_common_prefix(indent_list)
  
  # Remove longest common indent
  string = re.sub(f'^{indent}', '', string, flags = re.MULTILINE)
  
  return string

################################################################
# Create temporary replacement string and add to dictionary
################################################################

def create_temporary_replacement_string(processed_string):
  
  global temporary_replacement_counter, temporary_replacement_dictionary
  
  # Increment counter
  temporary_replacement_counter += 1
  
  # Build temporary replacement string
  temporary_replacement_string = (
    f'{E000_RUN}{temporary_replacement_counter}{E000}'
  )
  
  # NOTE: the processed string may contain existing temporary replacements,
  # which must be replaced with their own corresponding processed strings,
  # before the current processed string is stored to the dictionary
  processed_string = replace_all_temporary_replacements(processed_string)
  
  # Add entry to dictionary with
  # key {temporary replacement string} and value {processed string}
  temporary_replacement_dictionary[temporary_replacement_string] = (
    processed_string
  )
  
  # Return the temporary replacement string
  return temporary_replacement_string

################################################################
# Replace temporary replacements with processed strings
################################################################

# Raw regular expression for temporary replacement:
#   {E000_RUN}[0-9]+{E000}
#   \g<0>   {temporary replacement string} in its entirety

# ----------------------------------------------------------------
# Single
# ----------------------------------------------------------------

def replace_temporary_replacement(match_object):
  
  temporary_replacement_string = match_object.group(0)
  
  processed_string = (
    temporary_replacement_dictionary[temporary_replacement_string]
  )
  
  return processed_string

# ----------------------------------------------------------------
# All
# ----------------------------------------------------------------

def replace_all_temporary_replacements(string):
  
  return TEMPORARY_REPLACEMENT_REGEX.sub(
    replace_temporary_replacement,
    string
  )

################################################################
# Converter
################################################################

def cch_to_html(file_name):
  
  global is_root_index, url
  global E000, E000_RUN, TEMPORARY_REPLACEMENT_REGEX
  global temporary_replacement_counter, temporary_replacement_dictionary
  global user_defined_replacement_dictionary
  
  # ----------------------------------------------------------------
  # Canonicalise file name
  # ----------------------------------------------------------------
  
  # Convert Windows backslashes to forward slashes
  file_name = re.sub(r'\\', '/', file_name)
  
  # Remove current directory leading dot slash
  file_name = re.sub(r'^\./', '', file_name)
  
  # Remove trailing "." or ".cch" if provided
  file_name = re.sub(r'\.(cch)?$', '', file_name)
  
  # ----------------------------------------------------------------
  # Whether we are building the root index.html
  # ----------------------------------------------------------------
  
  is_root_index = file_name == 'index'
  
  # ----------------------------------------------------------------
  # Canonical URL for Cite this page
  # ----------------------------------------------------------------
  
  url = f'https://yawnoc.github.io/{file_name}.html'
  
  # Canonicalise /index.html as /
  url = re.sub(r'\/index.html', '/', url)
  
  # ----------------------------------------------------------------
  # Import contents (markup) of CCH file
  # ----------------------------------------------------------------
  
  with open(f'{file_name}.cch', 'r', encoding = 'utf-8') as cch_file:
    markup = cch_file.read()
  
  # ----------------------------------------------------------------
  # Temporary replacements
  # ----------------------------------------------------------------
  
  # To prevent unwanted replacements affecting portions {m} of markup
  # which must NOT be touched after they have been processed into strings {p}
  # (e.g. CCH display code elements),
  # we replace the portions {m} with temporary replacement strings {t},
  # and store the processed strings {p} inside a replacement dictionary,
  # using keys the temporary replacement strings {t}
  # and values the processed strings {p}.
  
  # Only after all the unwanted replacements have been completed
  # do we replace the temporary replacement strings {t}
  # with the processed strings {p}.
  
  # For this purpose we require temporary replacement strings {t} which
  # (1) do not appear in the original markup,
  # (2) will not appear in the markup as a result of any processing
  #     (unwanted replacements) unless deliberately inserted,
  # (3) can always be unambiguously picked out and not confused with adjacent
  #     characters,
  # (4) will not change as a result of any processing (unwanted replacements),
  #     and
  # (5) are unique.
  
  # To achieve this, we use temporary replacement strings of the form
  #   {U+E000 run}{temporary replacement counter}{U+E000}
  # where
  # (a) {U+E000} is the first "Private Use Area" code point in Unicode,
  # (b) {U+E000 run} is the run consisting of one more than
  #     the total number of occurrences of {U+E000} in markup (usually zero),
  #     and
  # (c) {temporary_replacement_counter} is an integer which is incremented.
  
  # By construction, this satisfies the requirements (1) through (5) above.
  
  # Constants
  E000 = '\uE000'
  E000_RUN = (markup.count(E000) + 1) * E000
  TEMPORARY_REPLACEMENT_REGEX = re.compile(f'{E000_RUN}[0-9]+{E000}')
  
  # Initialise global variables
  temporary_replacement_counter = 0
  temporary_replacement_dictionary = {}
  
  # ----------------------------------------------------------------
  # User-defined replacements
  # ----------------------------------------------------------------
  
  # Initialise global variable
  user_defined_replacement_dictionary = {}
  
  ################################################################
  # START of processing markup
  ################################################################
  
  # ----------------------------------------------------------------
  # Replace all Supreme elements
  # ----------------------------------------------------------------
  
  markup = replace_all_display_code(markup)
  markup = replace_all_inline_code(markup)
  markup = remove_all_html_comments(markup)
  markup = replace_all_html_scripts(markup)
  markup = store_all_user_defined_definitions(markup)
  markup = apply_all_user_defined_replacements(markup)
  markup = replace_all_display_maths(markup)
  markup = replace_all_inline_maths(markup)
  markup = replace_all_inline_maths_definitions(markup)
  
  # ----------------------------------------------------------------
  # Replace all Zero-argument elements
  # ----------------------------------------------------------------
  
  markup = replace_all_item_anchor_abbreviations(markup)
  markup = replace_assisting_romanisation_radio(markup)
  markup = replace_all_svg_style_abbreviations(markup)
  
  # ----------------------------------------------------------------
  # Replace all Multiple-argument elements
  # ----------------------------------------------------------------
  
  markup = replace_all_dialogue_images(markup)
  markup = replace_all_images(markup)
  markup = replace_all_assisting_romanisations(markup)
  markup = replace_all_cantonese_mandarin_romanisations(markup)
  markup = replace_all_directed_triangle_anchors(markup)
  markup = replace_all_item_anchors(markup)
  markup = replace_all_heading_self_link_anchors(markup)
  markup = replace_all_anchors(markup)
  markup = replace_all_boxed_translations(markup)
  markup = replace_all_sun_tzu_headings(markup)
  markup = replace_all_sun_tzu_link_divisions(markup)
  markup = replace_preamble(markup)
  markup = replace_page_properties(markup)
  markup = replace_cite_this_page(markup)
  markup = replace_footer(markup)
  
  # ----------------------------------------------------------------
  # Replace all Multiple-argument elements which require a second pass
  # ----------------------------------------------------------------
  
  markup = replace_all_directed_triangle_anchors(markup)
  markup = replace_all_heading_self_link_anchors(markup)
  markup = replace_all_anchors(markup)
  
  # ----------------------------------------------------------------
  # Replace all Single-argument elements
  # ----------------------------------------------------------------
  
  markup = replace_all_html_noscripts(markup)
  markup = replace_all_assisting_numerals(markup)
  markup = replace_all_formatted_spans(markup)
  markup = replace_all_boxed_divisions(markup)
  markup = replace_all_dialogue_divisions(markup)
  markup = replace_all_dialogue_paragraphs(markup)
  markup = replace_all_link_divisions(markup)
  markup = replace_all_header_navigation_bars(markup)
  markup = replace_all_navigation_bars(markup)
  markup = replace_all_note_paragraphs(markup)
  markup = replace_all_overflowing_divisions(markup)
  markup = replace_all_svg_style_containers(markup)
  markup = replace_all_text_romanisations(markup)
  markup = replace_all_text_numerals(markup)
  
  # ----------------------------------------------------------------
  # Unescape all Conway escapes
  # ----------------------------------------------------------------
  
  markup = unescape_conway(markup)
  
  # ----------------------------------------------------------------
  # Apply Conway italics
  # ----------------------------------------------------------------
  
  markup = apply_conway_italics(markup)
  
  # ----------------------------------------------------------------
  # Remove unnecessary whitespace
  # ----------------------------------------------------------------
  
  markup = remove_unnecessary_whitespace(markup)
  
  # ----------------------------------------------------------------
  # Wrap Chinese runs in Language spans
  # ----------------------------------------------------------------
  
  markup = wrap_chinese_runs(markup)
  
  # ----------------------------------------------------------------
  # Replace all temporary replacements with processed strings
  # ----------------------------------------------------------------
  
  markup = replace_all_temporary_replacements(markup)
  
  # ----------------------------------------------------------------
  # Add newline at end of file
  # ----------------------------------------------------------------
  
  markup += '\n'
  
  ################################################################
  # END of processing markup
  ################################################################
  
  # ----------------------------------------------------------------
  # Write processed markup to HTML file
  # ----------------------------------------------------------------
  
  with open(f'{file_name}.html', 'w', encoding = 'utf-8') as html_file:
    html_file.write(markup)

################################################################
# Main
################################################################

def main(file_name):
  
  # ----------------------------------------------------------------
  # If file name is given as * then convert all CCH files
  # ----------------------------------------------------------------
  
  if file_name == '*':
    
    for path, _, files in os.walk('.'):
      
      for name in files:
        
        if name.endswith('.cch'):
          
          file_name = os.path.join(path, os.path.splitext(name)[0])
          cch_to_html(file_name)
  
  # ----------------------------------------------------------------
  # Otherwise convert given file only
  # ----------------------------------------------------------------
  
  else:
    
    cch_to_html(file_name)

################################################################
# Argument parsing
################################################################

if __name__ == '__main__':
  
  # Description
  parser = argparse.ArgumentParser(description = 'Converts CCH to HTML')
  
  # Argument
  parser.add_argument(
    'file_name',
    help = (
      'File name of CCH file to be converted, without the .cch extension '
      '(omit or use * to convert all CCH files)'
    ),
    nargs = '?',
    default = '*'
  )
  
  args = parser.parse_args()
  file_name = args.file_name
  
  # Run
  main(file_name)
