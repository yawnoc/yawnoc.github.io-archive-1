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
    .tone {
      background: black;
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
* [⼈](#man)
* [⽝](#dog)
====]


<##
  Anchor id for...
  * Radical         : {Unicode English radical name}
  * Radical-stroke  : {Unicode English radical name}-{number of strokes}
  * Character       : {Chinese character}
##>


<## Character entry heading  \char {character} {code point} ##>

h{%
  \\char
    [ ] (?P<character> \S )
    [ ] (?P<code_point> [0-9A-F]+ )
%
  ####\g<character>
    \g<character> <code>U+\g<code_point></code>
  ####
%}


<## Tone spans  [tone]  ##>

{%
  \[
    (?P<tone> [陰陽平上去入聲]+ )
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


##man
  ⼈ (man)
##

###man-9        ⼈ + 9           ###

\char 假 5047
======
* [上聲]
  ====
  * fake; false
  * borrow; feign; falsely assume
  * if; suppose
  ====
* [去聲]
  ====
  * rest; holiday
  ====
======


##dog
  ⽝ (dog)
##

###dog-5        ⽝ + 5           ###

\char 狐 72D0
====
* fox
====


\cite-this-page[
  %title
][
  lexicon
][
  {Conway's} {Lexicon} for {Literary} {Chinese}
]

%footer-element