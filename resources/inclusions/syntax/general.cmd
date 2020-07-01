<!--
  ================================================================
  Load
    BEFORE romanisations.cmd
  ================================================================
-->



<!--
  ----------------------------------------------------------------
  Preamble defaults
  ----------------------------------------------------------------
-->

p{%%
  ^
  (?P<percent_signs> [%]{2,} )
    \n
    (?P<content> [\s\S]*? )
  ^
  (?P=percent_signs)
%%
  \g<percent_signs>
    %author Conway
    %title-suffix \\ | Conway's site
    \g<content>
  \g<percent_signs>
%%}



<!--
  ----------------------------------------------------------------
  Noscript for maths equations rendering
  ----------------------------------------------------------------
-->

Z{:: \noscript:maths ::
  a~~
    <noscript>Enable JavaScript for equation rendering to work.</noscript>
  ~~
::}



<!--
  ----------------------------------------------------------------
  Cite this page section  \cite-this-page[text title][tex key][tex title]
  ----------------------------------------------------------------
-->

<!-- Default [text title] to [%title] -->

p{%
  \\cite[-]this[-]page
  \[ \]
%
  \\cite-this-page[%title]
%}

p{%
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
    \\<https://yawnoc.github.io/%clean-url\\>
    Accessed~<span class="js-date">yyyy-mm-dd</span>.
    ----
  
  * BibTeX:
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{https://yawnoc.github.io/%clean-url}},
      \/  note = {Accessed\\~<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  * BibLaTeX:
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {https://yawnoc.github.io/%clean-url},
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

p{%
  ^
  \[
  (?P<pipes> [|]{4} )
    \n
  (?P=pipes)
  \]
%
  \g<pipes>{page-properties}
    \\page-property-dates
  \g<pipes>
%}

<!-- Non-empty content (requires line break) -->

p{%
  ^
  \[
  (?P<pipes> [|]{4} )
    (?P<content> [\s\S]*? )
  ^
  (?P=pipes)
  \]
%
  \g<pipes>{page-properties}
    \\page-property-dates \\+
    \g<content>
  \g<pipes>
%}

<!-- Dates -->

p{: \page-property-dates :
  First created: %date-created \\+
  Last modified: %date-modified
:}



<!--
  ----------------------------------------------------------------
  Heading permalinks (<h2> through <h6>)
  ----------------------------------------------------------------
-->

s{%
  <h[2-6]
    [ ]
    id = " (?P<id_> [^"]+? ) "
  >
%
  \g<0><a class="permalink" href="#\g<id_>" aria-label="Permalink"></a>
%}


<!--
  ----------------------------------------------------------------
  Header navigation bar links
  ----------------------------------------------------------------
-->

A{:: \header-link-here:home :: [Home](\/ You are on the Home page) ::}
A{:: \header-link:home :: [Home](/ Home page) ::}
A{:: \header-link:top :: [Top](# Jump back to top) ::}
A{:: \header-link:translation :: [Translation](#translation Translation) ::}
A{:: \header-link:result :: [Result](#result Jump to result) ::}
A{:: \header-link:cite :: [Cite](#cite Cite this page) ::}
A{:: \header-link:cynicism :: [More cynicism](/cynics-730/ A cynic's 7.30) ::}
A{:: \header-link:sun-tzu ::
  [\\sun-tzu] ["" \\sun-tzu's Computational Classic]
::}


<!--
  ----------------------------------------------------------------
  Navigation bars  [==== ====]
  ----------------------------------------------------------------
-->

<!-- Inside header [[==== ====]] -->

b{%
  ^
  \[{2}
  (?P<equals_signs> [=]{4} )
    (?P<content> [\s\S]*? )
  ^
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

b{%
  ^
  \[
  (?P<equals_signs> [=]{4} )
    (?P<content> [\s\S]*? )
  ^
  (?P=equals_signs)
  \]
%
  <nav>
    \g<equals_signs>
      \g<content>
    \g<equals_signs>
  </nav>
%}


