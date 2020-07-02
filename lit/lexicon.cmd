{+ resources/inclusions/syntax/general.cmd +}

{+ resources/inclusions/syntax/chinese-lang.cmd +}

%%
  %title Conway's Lexicon for Literary Chinese
  %date-created 2020-0x-xx
  %date-modified 2020-0x-xx
  %resources
    {+ resources/inclusions/preamble/main.cmd +}
    {+ resources/inclusions/preamble/rendering.cmd +}
  %description
    Conway's Lexicon for translating Literary Chinese into English.
  %css a~~
    h3 {
      margin-bottom: 0;
    }
    .character {
      border: 2px solid black;
      font-size: 1.17em;
      padding: 0.13em 0.2em;
    }
    .code-point {
      font-family: Consolas, "Lucida Sans Typewriter", monospace;
    }
    .tone {
      background: #666;
      color: white;
      padding: 0.13em;
    }
  ~~
%%


[[====
* \header-link:home
* \header-link:top
* \header-link:cite
====]]


# %title #


[||||
||||]



<## Radical index ##>

[====

<## 1 stroke ##>
* [⼀](#one)

<## 2 strokes ##>
* [⼈](#man)

<## 3 strokes ##>
* [⼞](#enclosure)

<## 4 strokes ##>
* [⼽](#halberd)
* [⽝](#dog)

<## 6 strokes ##>
* [⽵](#bamboo)

====]



<##
  Anchor id for...
  * Radical  : {Unicode English radical name}
  * Character: {Chinese character}
##>

<## Radical heading \rad {character} {unicode-name} ##>

l{%
  \\rad
    [ ] (?P<radical> \S )
    [ ] (?P<unicode_name> [a-z]+ )
%
  ##\g<unicode_name>
    \g<radical> (\g<unicode_name>)
  ##
%}

<## Character entry heading  \char {character} {code point} ##>

l{%
  \\char
    [ ] (?P<character> \S )
    [ ] (?P<code_point> [0-9A-F]+ )
%
  ###\g<character>
    <span class="character">\g<character></span>
    <span class="code-point">U+\g<code_point></span>
  ###
  @@[\g<character>]
    #\g<character>
  @@
%}

<## Tone spans  [tone]  ##>

{%
  \[
    (?P<tone> [陰陽平上去入聲]{2} )
  \]
%
  <span class="tone">\g<tone></span>
%}



----
This lexicon is meant to be a quick reference
for Literary Chinese words and phrases
which I have rendered into English somewhere amidst my translations.
----

----
Compiling a dictionary takes a lot of work.
This lexicon is not a dictionary,
for I have not put any effort into an exhaustive listing of
meanings, parts of speech, or pronunciations;
neither is this lexicon a concordance,
for the entries are not indexed to my translations.
----

----
Sorting Chinese characters is a nightmare.
[K'ang-hi's dictionary][康熙] uses radical-stroke,
but amongst characters with the *same* radical \& number of strokes
the ordering appears to be completely arbitrary.
Here I use [Unicode's sorting algorithm][sorting-algorithm],
which assigns each character a collation key by
Radical \> Strokes \> First residual stroke \> Simplified \
  \> Block \> Code point.
----

@@[康熙]
  https://en.wikipedia.org/wiki/Kangxi_Dictionary
@@
@@[sorting-algorithm]
  https://www.unicode.org/reports/tr38/#SortingAlgorithm
@@

----
See also: [Unihan Radical-Stroke Index][unihan]
----
@@[unihan]
  https://www.unicode.org/charts/unihanrsindex.html
@@



<##
  ----------------------------------------------------------------
  Radicals with 1 stroke
  ----------------------------------------------------------------
##>

\rad ⼀ one

\char 一 4E00
====
* one; unity; first
* same
====


<##
  ----------------------------------------------------------------
  Radicals with 2 strokes
  ----------------------------------------------------------------
##>

\rad ⼈ man

\char 假 5047
======
* [上聲]
  ====
  * fake; false
  * borrow; feign; falsely assume
  * suppose; if
  ====
* [去聲]
  ====
  * rest; holiday
  ====
======



<##
  ----------------------------------------------------------------
  Radicals with 3 strokes
  ----------------------------------------------------------------
##>

\rad ⼞ enclosure

\char 國 570B
====
* nation; country; state
====


<##
  ----------------------------------------------------------------
  Radicals with 4 strokes
  ----------------------------------------------------------------
##>

\rad ⼽ halberd

\char 戰 6230
====
* battle; war
====


\rad ⽝ dog

\char 狐 72D0
====
* fox
====


<##
  ----------------------------------------------------------------
  Radicals with 6 strokes
  ----------------------------------------------------------------
##>

\rad ⽵ bamboo

\char 策 7B56
====
* strategy; scheme
====



\cite-this-page[
  %title
][
  lexicon
][
  {Conway's} {Lexicon} for {Literary} {Chinese}
]

%footer-element
