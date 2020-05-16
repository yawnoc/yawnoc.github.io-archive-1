<!--
  ================================================================
  Load
    BEFORE romanisations.cmd
  ================================================================
-->



<!--
  ----------------------------------------------------------------
  Title suffix
  ----------------------------------------------------------------
-->

{: \title-suffix : \\ | Conway's site :}



<!--
  ----------------------------------------------------------------
  Noscript for maths equations rendering
  ----------------------------------------------------------------
-->

{:: \noscript:maths ::
  <noscript>Enable JavaScript for equation rendering to work.</noscript>
::}



<!--
  ----------------------------------------------------------------
  Cite this page section  \cite-this-page[text title][tex key][tex title]
  ----------------------------------------------------------------
-->

<!-- Default [text title] to [%title] -->

{%
  \\cite[-]this[-]page
  \[ \]
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
    \\<https://yawnoc.github.io/%url\\>
    Accessed~<span class="js-date">yyyy-mm-dd</span>.
    ----
  
  * BibTeX:
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{https://yawnoc.github.io/%url}},
      \/  note = {Accessed\\~<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  * BibLaTeX:
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {https://yawnoc.github.io/%url},
      \/  urldate = {<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  ====
  a~~
    <script>\
      document.addEventListener("DOMContentLoaded",function(){renderDate()})\
    </script>
  ~~
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
  Header navigation bar links
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


