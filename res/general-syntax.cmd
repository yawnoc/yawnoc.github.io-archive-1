<!--
  ----------------------------------------------------------------
  Sections
  ----------------------------------------------------------------
  Title suffix
  URL
  Cite this page section
  Page properties with dates  [|||| ||||]
  Heading self-link anchors (<h2> through <h6>)
  Links
  Navigation bars  [==== ====]
  Translation (parallel text)  [..{[class]}↵ .. ..]
  Translator-supplied italics  _. _
  Translation-alternative markers  \or  \lit
  Sic erat scriptum
  Sun Tzu
  Romanisation spans  [^ ]  [_ ]
  Romanisation special characters
  Automatic language declarations for Chinese
  SVG embedded styles
  
-->



<!--
  ----------------------------------------------------------------
  Title suffix
  ----------------------------------------------------------------
-->

{: \title-suffix : \\ | Conway's site :}



<!--
  ----------------------------------------------------------------
  URL
  ----------------------------------------------------------------
-->

{: \url-full : https://yawnoc.github.io/%url :}



<!--
  ----------------------------------------------------------------
  Cite this page section
  ----------------------------------------------------------------
-->

{%
  \\cite[-]this[-]page
  \[
    [\s]*
  \]
%
  \\cite-this-page[%title]
%}

{%
  \\cite[-]this[-]page
  \[
    [\s]*
    (?P<text_title> [^]]*? )
    [\s]*?
  \]
  \[
    [\s]*
    (?P<tex_key> [^]]*? )
    [\s]*?
  \]
  \[
    [\s]*
    (?P<tex_title> [^]]*? )
    [\s]*?
  \]
%
  ##cite Cite this page ##
  ====
  * Text:
    ----
    Conway~(%year-modified).
    \g<text_title>.
    \\<\\url-full\\>
    Accessed <span class="js-date">yyyy-mm-dd</span>.
    ----
  
  * BibTeX:
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{\\url-full}},
      \/  note = {Accessed <span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  * BibLaTeX:
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {\\url-full},
      \/  urldate = {<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  ====
  <script>(!
    document.addEventListener("DOMContentLoaded",function(){renderDate()})
  !)</script>
%}



<!--
  ----------------------------------------------------------------
  Page properties with dates  [|||| ||||]
  ----------------------------------------------------------------
-->

<!-- Empty content -->

{%
  ^ [^\S\n]*
  \[
  (?P<pipes> [|]{4,} )
    [\s]*?
  ^ [^\S\n]*
  (?P=pipes)
  \]
%
  \g<pipes>{page-properties}
    \\page-property-dates
  \g<pipes>
%}

<!-- Non-empty content (requires line break) -->

{%
  ^ [^\S\n]*
  \[
  (?P<pipes> [|]{4,} )
    (?P<content> [\s\S]*? )
  ^ [^\S\n]*
  (?P=pipes)
  \]
%
  \g<pipes>{page-properties}
    \\page-property-dates \\+
    \g<content>
  \g<pipes>
%}

<!-- Dates -->

{: \page-property-dates :
  First created: %date-created \\+
  Last modified: %date-modified
:}



<!--
  ----------------------------------------------------------------
  Heading self-link anchors (<h2> through <h6>)
  ----------------------------------------------------------------
-->

{%
  ^ [^\S\n]*
  (?P<hashes> [#]{2,6} (?![#]) )
    (?P<id_> [\S]+? )
  [\s]+
    (?P<content> [\s\S]*? )
  (?P=hashes)
%
  \g<hashes>\g<id_>
    [][\\self-link:\g<id_>]\\
    \g<content>
  \g<hashes>
  @@[\\self-link:\g<id_>]{self-link}
    \\#\g<id_>
  @@
%}



<!--
  ----------------------------------------------------------------
  Links
  ----------------------------------------------------------------
-->

{:: \link-here:home :: [Home](#) ::}
{:: \link:home :: [Home](/ Home page) ::}
{:: \link:top :: [Top](# Jump back to top) ::}
{:: \link:translation :: [Translation](#translation Translation) ::}
{:: \link:cite :: [Cite](#cite Cite this page) ::}
{:: \link:cynicism :: [More cynicism](/cynics-730/ A cynic's 7.30) ::}

{:: \link:sun-tzu/preface ::
  [《序》 "Preface"](/sun-tzu/preface.html)
::}

{:: \link:sun-tzu/iii ::
  《卷下》 "Volume~III" (haven't started)
::}

{:: \link:sun-tzu/ii ::
  [《卷中》 "Volume~II"](/sun-tzu/ii.html) (incomplete)
::}

{:: \link:sun-tzu/i ::
  [《卷上》 "Volume~I"](/sun-tzu/i.html)
::}

{:: \link:sun-tzu ::
  [
    《孫子算經》 \+
    "\\sun-tzu's Computational Classic"
  ](/sun-tzu)
::}


<!--
  ----------------------------------------------------------------
  Navigation bars  [==== ====]
  ----------------------------------------------------------------
-->

<!-- Inside header [[==== ====]] -->

{%
  ^ [^\S\n]*
  \[{2}
  (?P<equals_signs> [=]{4,} )
    (?P<content> [\s\S]*? )
  ^ [^\S\n]*
  (?P=equals_signs)
  \]{2}
%
  <header>
    <nav>
      \g<equals_signs>
        \g<content>
      \g<equals_signs>
    </nav>
  </header>
%}

<!-- Not inside header [==== ====] -->

{%
  ^ [^\S\n]*
  \[
  (?P<equals_signs> [=]{4,} )
    (?P<content> [\s\S]*? )
  ^ [^\S\n]*
  (?P=equals_signs)
  \]
%
  <nav>
    \g<equals_signs>
      \g<content>
    \g<equals_signs>
  </nav>
%}


<!--
  ----------------------------------------------------------------
  Translation (parallel text)  [..{[class]}↵ .. ..]
  ----------------------------------------------------------------
-->


{%
  ^ [^\S\n]*
  \[
  (?P<full_stops> [.]{2,} )
  (
    \{
      (?P<class> [^}]*? )
    \}
  )?
  \n
    (?P<chinese_content> [\s\S]*? )
  (?P=full_stops)
    (?P<english_content> [\s\S]*? )
  ^ [^\S\n]*
  (?P=full_stops)
  \]
%
  ||||||{translation parallel-text \g<class>}
  ||||{chinese}
    \g<chinese_content>
  ||||
  ||||{english}
    \g<english_content>
  ||||
  ||||||
%}


<!--
  ----------------------------------------------------------------
  Translator-supplied italics  _. _
  ----------------------------------------------------------------
-->

{%
  [_][.](?= [\S] )
    (?P<content> [^_] *? )
  [_]
%
  _{translator-supplied}\g<content>_
%}


<!--
  ----------------------------------------------------------------
  Translation-alternative markers  \or  \lit
  ----------------------------------------------------------------
-->

{: \or : <span class="alternative-marker">or</span> :}
{: \lit : <span class="alternative-marker">lit.</span> :}


<!--
  ----------------------------------------------------------------
  Sic erat scriptum  \sic
  ----------------------------------------------------------------
-->

{: \sic : _sic_ :}


<!--
  ----------------------------------------------------------------
  Sun Tzu
  ----------------------------------------------------------------
-->

{: \sun-tzu : Sun Tz(uu) :}



<!--
  ----------------------------------------------------------------
  Romanisation spans  [^ ]  [_ ]
  ----------------------------------------------------------------
-->

<!-- Pre-merger initials [^ ] -->

{%
  \[
  [\^]
  [\s]*
    (?P<content> [\s\S]*? )
  [\s]*?
  \]
%
  <span class="pre-merger initial">\g<content></span>
%}

<!-- Post-merger initials [_ ] -->

{%
  \[
  [_]
  [\s]*
    (?P<content> [\s\S]*? )
  [\s]*?
  \]
%
  <span class="post-merger initial">\g<content></span>
%}



<!--
  ----------------------------------------------------------------
  Romanisation special characters
  ----------------------------------------------------------------
-->

<!-- Common -->
{: (u")  : ü :}  <!-- U+00FC LATIN SMALL LETTER U WITH DIAERESIS -->

<!-- Conway only -->
{: (oe)  : œ :}  <!-- U+0153 LATIN SMALL LIGATURE OE -->

<!-- Wade--Giles only -->
{: (e^)  : ê :}  <!-- U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX -->
{: (uu)  : ŭ :}  <!-- U+016D LATIN SMALL LETTER U WITH BREVE -->

<!-- Pinyin tone 1 (陰平 dark level) only -->
{: (a-)  : ā :}  <!-- U+0101 LATIN SMALL LETTER A WITH MACRON -->
{: (e-)  : ē :}  <!-- U+0113 LATIN SMALL LETTER E WITH MACRON -->
{: (i-)  : ī :}  <!-- U+012B LATIN SMALL LETTER I WITH MACRON -->
{: (o-)  : ō :}  <!-- U+014D LATIN SMALL LETTER O WITH MACRON -->
{: (u-)  : ū :}  <!-- U+016B LATIN SMALL LETTER U WITH MACRON -->
{: (u"-) : ǖ :}  <!-- U+01D6 LATIN SMALL LETTER U WITH DIAERESIS AND MACRON -->

<!-- Pinyin tone 2 (陽平 light level) only -->
{: (a/)  : á :}  <!-- U+00E1 LATIN SMALL LETTER A WITH ACUTE -->
{: (e/)  : é :}  <!-- U+00E9 LATIN SMALL LETTER E WITH ACUTE -->
{: (i/)  : í :}  <!-- U+00ED LATIN SMALL LETTER I WITH ACUTE -->
{: (o/)  : ó :}  <!-- U+00F3 LATIN SMALL LETTER O WITH ACUTE -->
{: (u/)  : ú :}  <!-- U+00FA LATIN SMALL LETTER U WITH ACUTE -->
{: (u"/) : ǘ :}  <!-- U+01D8 LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE -->

<!-- Pinyin tone 3 (上 rising) only -->
{: (av)  : ǎ :}  <!-- U+01CE LATIN SMALL LETTER A WITH CARON -->
{: (ev)  : ě :}  <!-- U+011B LATIN SMALL LETTER E WITH CARON -->
{: (iv)  : ǐ :}  <!-- U+01D0 LATIN SMALL LETTER I WITH CARON -->
{: (ov)  : ǒ :}  <!-- U+01D2 LATIN SMALL LETTER O WITH CARON -->
{: (uv)  : ǔ :}  <!-- U+01D4 LATIN SMALL LETTER U WITH CARON -->
{: (u"v) : ǚ :}  <!-- U+01DA LATIN SMALL LETTER U WITH DIAERESIS AND CARON -->

<!-- Pinyin tone 4 (去 departing) only -->
{: (a\)  : à :}  <!-- U+00E0 LATIN SMALL LETTER A WITH GRAVE -->
{: (e\)  : è :}  <!-- U+00E8 LATIN SMALL LETTER E WITH GRAVE -->
{: (i\)  : ì :}  <!-- U+00EC LATIN SMALL LETTER I WITH GRAVE -->
{: (o\)  : ò :}  <!-- U+00F2 LATIN SMALL LETTER O WITH GRAVE -->
{: (u\)  : ù :}  <!-- U+00F9 LATIN SMALL LETTER U WITH GRAVE -->
{: (u"\) : ǜ :}  <!-- U+01DC LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE -->



<!--
  ----------------------------------------------------------------
  Automatic language declarations for Chinese
  ----------------------------------------------------------------
  This is a pretty liberal definition of "Chinese".
  See <https://en.wiktionary.org/wiki/Appendix:Unicode>
  and <https://en.wikipedia.org/wiki/Template:CJK_ideographs_in_Unicode>.
  
  * U+2E80 through U+2EFF (CJK Radicals Supplement)
  * U+2F00 through U+2FDF (Kangxi Radicals)
  * U+2FF0 through U+2FFF (Ideographic Description Characters)
  * U+3000 through U+303F (CJK Symbols and Punctuation)
    [⺀-〿]
  
  * U+31C0 through U+31EF (CJK Strokes)
    [㇀-㇣]
    Stop early at U+31E3 (U+31E4 onwards not assigned).
  
  * U+3400 through U+4DBF (CJK Unified Ideographs Extension A)
  * U+4DC0 through U+4DFF (Yijing Hexagram Symbols)
  * U+4E00 through U+9FFF (CJK Unified Ideographs)
    [㐀-鿼]
    Stop early at U+9FFC (U+9FFD onwards not assigned).
  
  * U+F900 through U+FAFF (CJK Compatibility Ideographs)
    [豈-龎]
    Stop early at U+FAD9 (U+FADA onwards not assigned).
  
  * U+FF00 through U+FFEF (Halfwidth and Fullwidth Forms)
    [！-｠]
    Start late at U+FF01 (U+FF00 not assigned).
    Stop early at U+FF60 (U+FF61 onwards are halfwidth or currency etc.).
  
  * U+20000 through U+2A6DF (CJK Unified Ideographs Extension B)
  * U+2A700 through U+2B73F (CJK Unified Ideographs Extension C)
  * U+2B740 through U+2B81F (CJK Unified Ideographs Extension D)
  * U+2B820 through U+2CEAF (CJK Unified Ideographs Extension E)
  * U+2CEB0 through U+2EBEF (CJK Unified Ideographs Extension F)
  * U+2F800 through U+2FA1F (CJK Compatibility Ideographs Supplement)
  * U+30000 through U+3134F (CJK Unified Ideographs Extension G)
    [𠀀-𱍊]
    Stop early at U+3134A (U+3134B onwards not assigned).
  
  Also allowed are the following:
  
  * Simple delimiters
      [: :]
  * Double U+2014 EM DASH
      ——
  * Double U+2026 HORIZONTAL ELLIPSIS
      ……
  * Line continuation
      \↵
  
-->

{%
  (
    ( \[: ) ?
    [⺀-〿㇀-㇣㐀-鿼豈-龎！-｠𠀀-𱍊] +
    ( —{2} ) ?
    ( …{2} ) ?
    ( :\] ) ?
    (
      \\
      \n
      [^\S\n] *
    ) ?
  )+
%
  <span lang="zh-Hant">\g<0></span>
%}



<!--
  ----------------------------------------------------------------
  SVG embedded styles
  ----------------------------------------------------------------
-->

{:: \svg-style:stroke-declarations ::
  stroke: black;
  vector-effect: non-scaling-stroke;
::}

{:: \svg-style:text-declarations ::
  font-family: sans-serif;
  text-anchor: middle;
::}

<!-- Container [svg-styles/ /] -->

{%
  \[
  svg[-]styles/
    (?P<content> [\s\S]*? )
  /
  \]
%
  <svg class="embedded-styles"><style>\g<content></style></svg>
%}
