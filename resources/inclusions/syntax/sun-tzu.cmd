<##
  ----------------------------------------------------------------
  Sun Tzu navigation-bar breadcrumb link list item  *>
  ----------------------------------------------------------------
##>

b{: *> : *{.breadcrumb} :}



<##
  ----------------------------------------------------------------
  Sun Tzu surrounds navigation  {{{{| |}}}}
  ----------------------------------------------------------------
  Arrows used:
  * ← U+2190 LEFTWARDS ARROW
  * ↑ U+2191 UPWARDS ARROW
  * → U+2192 RIGHTWARDS ARROW
##>

<## Surrounds navigation {{{{| |}}}}  ##>

b{%
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

<## Adjacent row  {{| |}}  ##>

b{%
  \{{2}
    [|]
    (?P<content> [\s\S]*? )
    [|]
  \}{2}
%
  ||||||{.adjacent}
    \g<content>
  ||||||
%}

<## Current location in container  \nav-curr: {text} ##>

b{%
  \\nav[-]curr: [ ] (?P<text> [^\n]* )
%
  ||||{.current}
    \g<text>
  ||||
%}

<## Up link in container  \nav-up: {text} : {href_spec}  ##>

b{%
  \\nav[-]up:
    [ ]
      (?P<text> [\s\S]*? )
    [ ]
      :
    [ ]
      (?P<href_spec> [^\n]* )
%
  ||||{.up}
    [↑ \g<text>]\g<href_spec>
  ||||
%}

<## Previous link in container  \nav-prev: {text} : {href_spec}  ##>

b{%
  \\nav[-]prev:
    [ ]
      (?P<text> [\s\S]*? )
    [ ]
      :
    [ ]
      (?P<href_spec> [^\n]* )
%
  ||||{.previous}
    [← \g<text>]\g<href_spec>
  ||||
%}

<## Next link in container  \nav-next: {text} : {href_spec}  ##>

b{%
  \\nav[-]next:
    [ ]
      (?P<text> [\s\S]*? )
    [ ]
      :
    [ ]
      (?P<href_spec> [^\n]* )
%
  ||||{.next}
    [\g<text> →]\g<href_spec>
  ||||
%}



<##
  ----------------------------------------------------------------
  Sun Tzu source text links
  ----------------------------------------------------------------
##>

<## Version A  \a[p] ##>

e{%
  \\a \[ (?P<p> [0-9]+ ) \]
%
  [Version~A](https://archive.org/details/02094034.cn/page/n\g<p>)
%}

<## Version B  \b[p] ##>

e{%
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

<## Version C  \c[p] ##>

e{%
  \\c \[ (?P<p> [0-9]+ ) \]
%
  [Version~C](https://ctext.org/sunzi-suan-jing#n\g<p>)
%}

<## Version D  \d[p] ##>

e{%
  \\d \[ (?P<p> [0-9]+ ) \]
%
  [Version~D](https://ctext.org/library.pl?if=en&file=86926&page=\g<p>)
%}

<## Default to Version D \d-default ##>

e{:
  \d-default
:
  Unless noted otherwise, I follow the text from Version~D, 《知不足齋叢書》本.
:}



<##
  ----------------------------------------------------------------
  Sun Tzu URLs in round brackets
  ----------------------------------------------------------------
##>


<## Index  [""] ##>

l{%
  [ ]?
  \[
    ""
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/ \g<title>)
%}


<## Volume v  ["v"] ##>

l{%
  [ ]?
  \[
    "p"
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/preface/ \g<title>)
%}

l{%
  [ ]?
  \[
    " (?P<volume> [i] {1,3} ) "
    (?P<title> [\s\S]*? )
  \]
%
  (/sun-tzu/\g<volume>/ \g<title>)
%}


<## Volume v Paragraph p  ["v p"] ##>

l{%
  [ ]?
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


