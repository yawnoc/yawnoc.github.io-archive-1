<##
  ----------------------------------------------------------------
  Preamble defaults
  ----------------------------------------------------------------
##>

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



<##
  ----------------------------------------------------------------
  Preamble resources
  ----------------------------------------------------------------
  There are three tiers, each depending on those before:
  1. \resources
  2. \resources:rendering
  3. \resources:maths
##>


<## Tier 3: Maths equations CSS and JS ##>

p{::
  \resources:maths
::
  \\resources:rendering
  a~~
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.css"
      integrity="sha384-\
        AfEj0r4/OFrOo5t7NnNe46zW/tFgW6x/bCJG8FqQCEo3+Aro6EYUG4+cU+KJWu/X\
      " \
      crossorigin \
      onerror="\
        this.removeAttribute('integrity');\
        this.removeAttribute('onerror');\
        this.setAttribute('href','/resources/katex/katex.min.css')\
      ">
  ~~
  a~~
    <script defer
      src="https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/katex.min.js"
      integrity="sha384-\
        g7c+Jr9ZivxKLnZTDUhnkOnsh30B4H0rpLUpJ4jAIKs4fnJI+sEnkvrMWph2EDg4\
      " \
      crossorigin \
      onerror="\
        let a=document.createElement('script');\
        a.setAttribute('src','/resources/katex/katex.min.js');\
        a.setAttribute('onload', 'renderMaths()');\
        document.head.appendChild(a);
        this.remove()\
      "
      onload="renderMaths()"></script>
  ~~
::}


<## Tier 2: Rendering JS (Cite this page and or maths equations) ##>

p{::
  \resources:rendering
::
  \\resources
    a~~
      <script defer src="/resources/scripts/rendering.min.js"></script>
    ~~
::}


<## Tier 1: Favicon and main CSS ##>

p{: \resources :
  %resources
  a~~
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#00aba9">
    <meta name="theme-color" content="#ffffff">
  ~~
  a~~
    <link rel="stylesheet" href="/resources/styles/main.min.css">
  ~~
:}



<##
  ----------------------------------------------------------------
  Noscript for maths equations rendering
  ----------------------------------------------------------------
##>

Z{:: \noscript:maths ::
  a~~
    <noscript>Enable JavaScript for equation rendering to work.</noscript>
  ~~
::}



<##
  ----------------------------------------------------------------
  Cite this page section  \cite-this-page[text title][tex key][tex title]
  ----------------------------------------------------------------
##>

<## Default [text title] to [%title] ##>

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
  ##{#cite} Cite this page ##
  
  ### Text ###
    ----
    Conway~(%year-modified).
    \g<text_title>.
    \\<https://yawnoc.github.io/%clean-url\\>
    Accessed~<span class="js-date">yyyy-mm-dd</span>.
    ----
  
  ### BibTeX ###
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{https://yawnoc.github.io/%clean-url}},
      \/  note = {Accessed\\~<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  ### BibLaTeX ###
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {https://yawnoc.github.io/%clean-url},
      \/  urldate = {<span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  a~~
    <script>\
      document.addEventListener("DOMContentLoaded",function(){renderDate()})\
    </script>
  ~~
%}



<##
  ----------------------------------------------------------------
  Page properties with dates  [|||| ||||]
  ----------------------------------------------------------------
##>

<## Empty content ##>

p{%
  ^
  \[
  (?P<pipes> [|]{4} )
    \n
  (?P=pipes)
  \]
%
  \g<pipes>{.page-properties}
    \\page-property-dates
  \g<pipes>
%}

<## Non-empty content (requires line break) ##>

p{%
  ^
  \[
  (?P<pipes> [|]{4} )
    (?P<content> [\s\S]*? )
  ^
  (?P=pipes)
  \]
%
  \g<pipes>{.page-properties}
    \\page-property-dates \\+
    \g<content>
  \g<pipes>
%}

<## Dates ##>

p{: \page-property-dates :
  First created: %date-created \\+
  Last modified: %date-modified
:}



<##
  ----------------------------------------------------------------
  Heading permalinks (<h2> through <h6>)
  ----------------------------------------------------------------
##>

s{%
  <h[2-6]
    [ ]
    id = " (?P<id_> [^"]+? ) "
  >
%
  \g<0><a class="permalink" href="#\g<id_>" aria-label="Permalink"></a>
%}


<##
  ----------------------------------------------------------------
  Header navigation bar links
  ----------------------------------------------------------------
##>

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


<##
  ----------------------------------------------------------------
  Navigation bars  [==== ====]
  ----------------------------------------------------------------
##>

<## Inside header [[==== ====]] ##>

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

<## Not inside header [==== ====] ##>

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


