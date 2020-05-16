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
  Sun Tzu surrounds navigation  {{{{| |}}}}
  Sun Tzu source text links
  Links
  Navigation bars  [==== ====]
  
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
  a~~
    <script>\
      document.addEventListener("DOMContentLoaded",function(){renderDate()})\
    </script>
  ~~
%}

{: \yyyy-mm-dd : a~~ <span class="js-date">yyyy-mm-dd</span> ~~ :}


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
  Sun Tzu surrounds navigation  {{{{| |}}}}
  ----------------------------------------------------------------
  Arrows used:
  * ← U+2190 LEFTWARDS ARROW
  * ↑ U+2191 UPWARDS ARROW
  * → U+2192 RIGHTWARDS ARROW
-->

<!-- Surrounds navigation {{{{| |}}}}  -->
{%
  \{{4}
    [|]
    (?P<content> [\s\S]*? )
    [|]
  \}{4}
%
  <nav class="surrounds">
    \g<content>
  </nav>
%}

<!-- Adjacent row  {{| |}}  -->
{%
  \{{2}
    [|]
    (?P<content> [\s\S]*? )
    [|]
  \}{2}
%
  ||||||{adjacent}
    \g<content>
  ||||||
%}

<!-- Current location in container  \nav-curr: {text} -->
{%
  \\nav[-]curr:
    [\s]*
      (?P<text> [^\n]* )
%
  ||||{current}
    \g<text>
  ||||
%}

<!-- Up link in container  \nav-up: {text} : {href_spec}  -->
{%
  \\nav[-]up:
    [\s]*
      (?P<text> [\s\S]*? )
    [\s]*
      :
    [\s]*
      (?P<href_spec> [^\n]* )
%
  ||||{up}
    [↑ \g<text>]\g<href_spec>
  ||||
%}

<!-- Previous link in container  \nav-prev: {text} : {href_spec}  -->
{%
  \\nav[-]prev:
    [\s]*
      (?P<text> [\s\S]*? )
    [\s]*
      :
    [\s]*
      (?P<href_spec> [^\n]* )
%
  ||||{previous}
    [← \g<text>]\g<href_spec>
  ||||
%}

<!-- Next link in container  \nav-next: {text} : {href_spec}  -->
{%
  \\nav[-]next:
    [\s]*
      (?P<text> [\s\S]*? )
    [\s]*
      :
    [\s]*
      (?P<href_spec> [^\n]* )
%
  ||||{next}
    [\g<text> →]\g<href_spec>
  ||||
%}



<!--
  ----------------------------------------------------------------
  Sun Tzu source text links
  ----------------------------------------------------------------
-->

<!-- Version A  \a[p] -->
{%
  \\a \[ (?P<p> [0-9]+ ) \]
%
  [Version~A](https://archive.org/details/02094034.cn/page/n\g<p>)
%}

<!-- Version B  \b[p] -->
{%
  \\b \[ (?P<p> [0-9]+ ) \]
%
  [Version~B](
    https://commons.wikimedia.org/w/index.php\
    ?title=\
      File%3A%E6%96%87%E6%B7%B5%E9%96%A3%E5%9B%9B%E5%BA%AB%E5%85%A8%E6%9B%B8\
      _0797%E5%86%8A.djvu\
    &page=\g<p>
  )
%}

<!-- Version C  \c[p] -->
{%
  \\c \[ (?P<p> [0-9]+ ) \]
%
  [Version~C](https://ctext.org/sunzi-suan-jing#n\g<p>)
%}

<!-- Version D  \d[p] -->
{%
  \\d \[ (?P<p> [0-9]+ ) \]
%
  [Version~D](https://ctext.org/library.pl?if=en&file=86926&page=\g<p>)
%}

<!-- Default to Version D \d-default -->
{:
  \d-default
:
  Unless noted otherwise, I follow the text from Version~D, 《知不足齋叢書》本.
:}


<!--
  ----------------------------------------------------------------
  Links
  ----------------------------------------------------------------
-->

{:: \header-link-here:home :: [Home](\/ You are on the Home page) ::}
{:: \header-link:home :: [Home](/ Home page) ::}
{:: \header-link:top :: [Top](# Jump back to top) ::}
{:: \header-link:translation :: [Translation](#translation Translation) ::}
{:: \header-link:result :: [Result](#result Jump to result) ::}
{:: \header-link:cite :: [Cite](#cite Cite this page) ::}
{:: \header-link:cynicism :: [More cynicism](/cynics-730/ A cynic's 7.30) ::}
{:: \header-link:sun-tzu ::
  [\\sun-tzu] ["" \\sun-tzu's Computational Classic]
::}

<!-- Sun Tzu URL in round brackets  [""] -->
{%
  [\s]*
  \[
    ""
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/ \g<title>)
%}

<!-- Sun Tzu Volume v URL in round brackets  ["v"] -->
{%
  [\s]*
  \[
    "p"
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/preface/ \g<title>)
%}
{%
  [\s]*
  \[
    " (?P<volume> [i] {1,3} ) "
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/\g<volume>/ \g<title>)
%}

<!-- Sun Tzu Volume v Paragraph p URL in round brackets  ["v p"] -->
{%
  [\s]*
  \[
    "
      (?P<volume> [i] {1,3} )
      [ ]
      (?P<paragraph> [0-9] + )
    "
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/\g<volume>/\g<paragraph> \g<title>)
%}

<!-- Sun Tzu manuscript URL in round brackets  [m"v p"] -->
{%
  [\s]* \[m"p"\]
%
  (/manuscripts/sun-tzu-preface.pdf)
%}
{%
  [\s]* \[m"(?P<volume> [i] {1,3} ) [ ] (?P<paragraph> [0-9] + )"\]
%
  (/manuscripts/sun-tzu-\g<volume>-\g<paragraph>.pdf)
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

<!-- Sun Tzu navigation-bar breadcrumb link list item  *> -->

{: *> : *{breadcrumb} :}

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


