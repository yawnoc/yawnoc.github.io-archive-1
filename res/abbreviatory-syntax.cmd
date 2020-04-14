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

{: \nav-link-home-here : * [Home](\/ You are on the home page) :}
{: \nav-link-home : * [Home](/ Home page) :}
{: \nav-link-top : * [Top](# Top) :}
{: \nav-link-cite : * [Cite](#cite Cite this page) :}

