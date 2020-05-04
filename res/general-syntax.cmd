<!--
  ----------------------------------------------------------------
  Sections
  ----------------------------------------------------------------
  Title suffix
  URL
  Noscript  \noscript[feature]
  Cite this page section
  Page properties with dates  [|||| ||||]
  Heading permalinks (<h2> through <h6>)
  Links
  Navigation bars  [==== ====]
  Translation (parallel text)  <<{[class]}↵ || >>
  Translator-supplied italics  .[ ]
  Translation-alternative markers  \or  \lit
  Sic erat scriptum
  Sun Tzu
  Romanisation indicators  \C  \pm  \M  \gr
  Romanisation spans  [^ ]  [_ ]
  Romanisation special characters
  Automatic language declarations for Chinese
  Middle dot \.
  Bracketed original Chinese for romanisations  (( ))
  Coloured spans  [c/ /]
  SVG embedded styles
  Accessible inline SVGs
  
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
  Noscript  \noscript[feature]
  ----------------------------------------------------------------
-->

<!-- Default feature "equation rendering" -->

{%
  \\noscript \[ \]
%
  \\noscript[equation rendering]
%}

<!-- General -->

{%
  \\noscript
  \[
    (?P<feature> [^]]*? )
  \]
%
  <noscript>Enable JavaScript for \g<feature> to work.</noscript>
%}



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
    Accessed~\\yyyy-mm-dd.
    ----
  
  * BibTeX:
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{\\url-full}},
      \/  note = {Accessed \\yyyy-mm-dd},
      \/}
    </code></pre>
  
  * BibLaTeX:
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {\\url-full},
      \/  urldate = {\\yyyy-mm-dd},
      \/}
    </code></pre>
  ====
  a(!
    <script>\
      document.addEventListener("DOMContentLoaded",function(){renderDate()})\
    </script>
  !)
%}

{: \yyyy-mm-dd : a(! <span class="js-date">yyyy-mm-dd</span> !) :}


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
  Heading permalinks (<h2> through <h6>)
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
    <a class="permalink" href="#\g<id_>" aria-label="Permalink"></a>\\
    \g<content>
  \g<hashes>
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
{:: \link:result :: [Result](#result Jump to result) ::}
{:: \link:cite :: [Cite](#cite Cite this page) ::}
{:: \link:cynicism :: [More cynicism](/cynics-730/ A cynic's 7.30) ::}

{:: \link:sun-tzu/preface ::
  [《序》 "Preface"] ["p"]
::}

{:: \link:sun-tzu/iii ::
  《卷下》 "Volume~III" (haven't started)
::}

{:: \link:sun-tzu/ii ::
  [《卷中》 "Volume~II"] ["ii"] (incomplete)
::}

{:: \link:sun-tzu/i ::
  [《卷上》 "Volume~I"] ["i"]
::}

{:: \link:sun-tzu ::
  [
    《孫子算經》 \+
    "\\sun-tzu's Computational Classic"
  ]
  [""]
::}

<!-- Sun Tzu URL in round brackets  [""] -->
{%
  [\s]*
  \[""\]
%
  (/sun-tzu/)
%}

<!-- Sun Tzu Volume v URL in round brackets  ["v"] -->
{%
  [\s]*
  \["p"\]
%
  (/sun-tzu/preface)
%}
{%
  [\s]*
  \[ "
    (?P<volume> [i] {1,3} )
  " \]
%
  (/sun-tzu/\g<volume>)
%}

<!-- Sun Tzu Volume v Paragraph p URL in round brackets  ["v p"] -->
{%
  [\s]*
  \[ "
    (?P<volume> [i] {1,3} )
    [ ]
    (?P<paragraph> [0-9] + )
  " \]
%
  (/sun-tzu/\g<volume>#\g<paragraph>)
%}


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
  Translation (parallel text)  <<{[class]}↵ || >>
  ----------------------------------------------------------------
-->


{%
  ^ (?P<leading_whitespace> [^\S\n]* )
  [<]{2,}
  (
    \{
      (?P<class> [^}]*? )
    \}
  )?
  \n
    
    (?P<chinese_content> [\s\S]*? )
    
  ^ (?P=leading_whitespace)
  (?P<pipes> [|]{2,} )
    
    (?P<english_content> [\s\S]*? )
    
  ^ (?P=leading_whitespace)
  [>]{2,}
%
  \g<pipes>||||{translation parallel-text \g<class>}
  
  \g<pipes>||{chinese}
    \g<chinese_content>
  \g<pipes>||
  
  \g<pipes>||{english}
    \g<english_content>
  \g<pipes>||
  
  \g<pipes>||||
%}


<!--
  ----------------------------------------------------------------
  Translator-supplied italics  .[ ]
  ----------------------------------------------------------------
-->

{%
  [.]
  \[
    (?P<content> [^]] *? )
  \]
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
  Romanisation indicators  \C  \pm  \M  \gr
  ----------------------------------------------------------------
-->

{% \\C [\s]* %
  [Cantonese](
    /cantonese/conway-romanisation
    Conway's Romanisation for Cantonese
  ):~
%}
{% \\pm [\s]* %
  [post-merger](
    /cantonese/conway-romanisation#ts-vs-ch
    {ts vs ch}, {ts' vs ch'}, and {s vs sh}
  ):~
%}

{% \\M [\s]* % Mandarin:~ %}
{% \\gr [\s]* % Government-regulated 統讀:~ %}
{% \\nc [\s]* % Nominally-Communist 統讀:~ %}



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
      [type/ /]
      [: :]
  * Double U+2014 EM DASH
      ——
  * Double U+2026 HORIZONTAL ELLIPSIS
      ……
  * Middle dot generated by \.
      \.
  * Line continuation
      \↵
  
-->

{%
  (
    ( \[ [a-z-]*? / [\s]* ) ?
    ( \[: ) ?
    [⺀-〿㇀-㇣㐀-鿼豈-龎！-｠𠀀-𱍊] +
    ( —{2} ) ?
    ( …{2} ) ?
    ( \\[.] ) ?
    ( :\] ) ?
    ( [\s]* /\] ) ?
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
  Middle dot \.
  ----------------------------------------------------------------
-->


<!-- U+30FB KATAKANA MIDDLE DOT -->
{: \. : ・ :}



<!--
  ----------------------------------------------------------------
  Bracketed original Chinese after romanisations  (( ))
  ----------------------------------------------------------------
  See "Automatic language declarations for Chinese" above
  for what is regarded as a Chinese character.
  Note that the brackets are not a part of the HTML,
  but are added cosmetically via CSS and are therefore not selectable.
  Replaces
    {leading whitespace} ((<span lang="zh-Hant">{content}</span>))
  with
    ~<span lang="zh-Hant" class="original-chinese">{content}</span>
  so that the match must be split before the first >.
-->

{%
  [\s] *
  \(\(
    (?P<match_portion_1>
      <span[ ]lang="zh-Hant"
    )
    (?P<match_portion_2>
      >
        [\s\S]*?
      </span>
    )
  \)\)
%
  ~\g<match_portion_1> class="original-chinese"\g<match_portion_2>
%}



<!--
  ----------------------------------------------------------------
  Coloured spans  [c/ /]
  ----------------------------------------------------------------
  c is the colour letter, one of r, g, b, v.
-->


{%
  \[ (?P<colour_letter> [rgbv] )
    /
      [\s]*
      (?P<content> [\s\S] *? )
      [\s]*
    /
  \]
%
  <span class="colour-\g<colour_letter>">\g<content></span>
%}



<!--
  ----------------------------------------------------------------
  SVG embedded styles
  ----------------------------------------------------------------
-->

{:: \svg-style:stroke-declarations ::
  a(!
    stroke: black;
    vector-effect: non-scaling-stroke;
  !)
::}

{:: \svg-style:text-declarations ::
  a(!
    font-family: sans-serif;
    text-anchor: middle;
  !)
::}

{:: \svg-style:maths-font-rulesets ::
  a(!
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
    .maths-regular {
      font-family: "KaTeX_Main-Regular";
    }
  !)
::}

{:: \svg-style:stroke-colour-rulesets ::
  a(!
    line.colour-r {
      stroke: red;
    }
    line.colour-g {
      stroke: green;
    }
    line.colour-b {
      stroke: blue;
    }
    line.colour-v {
      stroke: darkviolet;
    }
    line[class^='colour-'] {
      stroke-width: 3;
    }
  !)
::}

{:: \svg-style:text-colour-rulesets ::
  a(!
    text.colour-r {
      fill: red;
    }
    text.colour-g {
      fill: green;
    }
    text.colour-b {
      fill: blue;
    }
    text.colour-v {
      fill: darkviolet;
    }
  !)
::}

<!-- Container [svg-styles/ /] -->

{%
  \[
  svg[-]styles/
    (?P<content> [\s\S]*? )
  /
  \]
%
  <svg class="embedded-styles" aria-hidden="true">\\
    <style>\g<content></style>\\
  </svg>
%}



<!--
  ----------------------------------------------------------------
  Accessible inline SVGs
  ----------------------------------------------------------------
  Inline SVGs do not have an equivalent of <img>'s alt attribute,
  which is really dumb.
  
  Basically how a screenreader treats an SVG
  will depend on the screenreader and the browser.
  
  Reading:
  
  * Heather Migliorisi (2016) for CSS-Tricks
    "Accessible SVGs"
    https://css-tricks.com/accessible-svgs/
  
  * Scott O'Hara (2019)
    "Contextually Marking up accessible images and SVGs"
    https://www.scottohara.me/blog/2019/05/22/\
      contextual-images-svgs-and-a11y.html
  
  * Scott O'Hara (2019)
    "SVG and Image markup tests"
    https://scottaohara.github.io/testing/img-svg-acc-name/img-svg-tests.html
    https://web.archive.org/web/20200426173932/{ibid}
  
  From Heather's article:
    """"
    According to the W3C specification,
    we shouldn’t have to do anything extra for SVGs
    beyond providing the `<title>` and possibly a `<desc>`
    because they should be available to the Accessibility API.
    Unfortunately, browser support is not quite there yet
    (bugs reported for: Chrome and Firefox).
    
    [...] Add the appropriate ID’s to the `<title>` and `<desc>` [...]
    
    [...] On the `<svg>` tag, add:
      `aria-labelledby="uniqueTitleID uniqueDescID"` [...]
    
    [...] On the `<svg>` tag, add:
      `role="img"` [...]
    """"
  Note that that article was last updated in 2016.
  
  From Scott's "SVG and Image markup tests",
  written in 2019 and accessed 2020-04-27,
  Test 11 is the most robust in terms of accessibility for inline SVGs
  (all tests pass but three exceptions for JAWS on IE11).
  
  The pattern for Test 11 is thus:
  ````
  <svg viewBox="..." height="..." width="..."
    role="img"
    focusable="false"
    aria-labelledby="id"
  >
    <title id="id">Accessible Name</title>
    <path aria-hidden="true" d="..."></path>
  </svg>
  ````
  
  Therefore I shall define the following:
  
  * \accessible-svg-attributes[{id}]
    role="img" focusable="false" aria-labelledby="{id}"
  
  * [accessible-svg-title/{id}  {content}  /]
    <title id="{id}">{content}</title>
  
  * [accessible-svg-content/  {content}  /]
    <g aria-hidden="true">{content}</g>
  
  If the labelling by id ever becomes unnecessary,
  then I will remove the {id} bits.
  
-->

<!-- \accessible-svg-attributes[{id}] -->
{%
  \\accessible[-]svg[-]attributes
  \[
    (?P<id_> [\S]+? )
  \]
%
  role="img" focusable="false" aria-labelledby="\g<id_>"
%}

<!-- [accessible-svg-title/{id}  {content}  /] -->
{%
  \[
  accessible[-]svg[-]title/
    (?P<id_> [\S]+ )
    [\s]*
    (?P<content> [\s\S]*? )
    [\s]*
  /
  \]
%
  <title id="\g<id_>">\g<content></title>
%}

<!-- [accessible-svg-content/  {content}  /] -->
{%
  \[
  accessible[-]svg[-]content/
    (?P<content> [\s\S]*? )
  /
  \]
%
  <g aria-hidden="true">\g<content></g>
%}

