<!-- URL -->

{: \url-full : https://yawnoc.github.io/%url :}

<!-- Cite this page section -->

{%
  \\cite-this-page
  \[
    (?P<tex_key> [^]]*? )
  \]
  \[
    (?P<tex_title> [^]]*? )
  \]
%
  ##cite Cite this page ##
  ====
  * Text:
    ----
    Conway~(%year-modified).
    %title.
    \\<\\url\\>.
    Accessed <span class="js-date">yyyy-mm-dd</span>.
    ----
  
  * BibTex:
    <pre><code>\\
      \/@misc{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  howpublished = {\\url{\\url-full}},
      \/  note = {Accessed <span class="js-date">yyyy-mm-dd</span>},
      \/}
    </code></pre>
  
  * BibLaTex:
    <pre><code>\\
      \/@online{conway-\g<tex_key>,
      \/  author = {Conway},
      \/  year = {%year-modified},
      \/  title = {\g<tex_title>},
      \/  url = {\\url-full},
      \/  urldate = <span class="js-date">yyyy-mm-dd</span>,
      \/}
    </code></pre>
  ====
%}


<!-- Heading self-link anchors (<h2> through <h6>) -->

{%
  ^ [^\S\n]*
  (?P<hashes> [#]{2,6} (?![#]) )
    (?P<id_> [\S]*? )
  [\s]+
    (?P<content> [\s\S]*? )
  (?P=hashes)
%
  \g<hashes>\g<id_>
    [][\\self-link:\g<id_>]\\
    \g<content>
  \g<hashes>
  @@[\\self-link:\g<id_>][self-link]
    \\#\g<id_>
  @@
%}


<!-- Header navigation bar [==== ====] -->

{%
  ^ [^\S\n]*
  \[
  (?P<equals_signs> [=]{4,} )
%
  <header>
    <nav>
      \g<equals_signs>
%}

{%
  ^ [^\S\n]*
  (?P<equals_signs> [=]{4,} )
  \]
%
      \g<equals_signs>
    </nav>
  </header>
%}


<!-- Header navigation bar links -->

{:: \link-here:home :: [Home](\/ You are on the home page) ::}
{:: \link:home :: [Home](/ Home page) ::}
{:: \link:top :: [Top](# Top) ::}
{:: \link:cite :: [Cite](#cite Cite this page) ::}

