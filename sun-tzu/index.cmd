{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title "\sun-tzu's Computational Classic" 《孫子算經》
  %date-created 2019-05-04
  %date-modified 2020-05-13
  \resources:rendering
  %description
    An annotated English translation of Sunzi Suanjing, \
    《孫子算經》, "\sun-tzu's Computational Classic".
  %css
    .manuscript-links > li > a {
      display: inline-block;
      margin-right: 0.3em;
      margin-bottom: 0.2em;
    }
    .volumes {
      font-size: large;
    }
    .variant-characters {
      border: 2px solid grey;
      margin: 0 0.5em;
      padding: 0.4em;
    }
%%

[[====
* \header-link:home
* \header-link:top
* [\sun-tzu](\/ You are viewing "\sun-tzu's Computational Classic")
*> [Pref.] ["p" Preface]
* [I] ["i" Volume~I]
* [II] ["ii" Volume~II]
<## * [III] ["iii" Volume~III] ##>
* \header-link:cite
====]]


#
  《孫子算經》 \+
  "\sun-tzu's Computational Classic"
#


[||||
Also known as _Sunzi Suanjing_.
||||]



##{#translation-links}
  Translation (links to volumes)
##


<<
  《孫子算經》
||
  "\sun-tzu's Computational Classic"
>>

===={.volumes}
* [《序》 "Preface"] ["p"]
* [《卷上》 "Volume~I"] ["i"]
* [《卷中》 "Volume~II"] ["ii"] (incomplete)
* 《卷下》 "Volume~III" (haven't started)
====



##{#conways-preface}
  Conway's Preface
##


----
《孫子算經》, ["\sun-tzu's Computational Classic"][算經],
like the [Sea Island Computational Classic][sea island],
is one of the [ten canon classics] of Chinese mathematics.
Probably written in the 3rd to 5th centuries AD,
the reputed author \sun-tzu ((孫子)), "Master~Sun",
is not the same [\sun-tzu] [孫子] who wrote [ _The Art of War_ ][兵法]
(though the characters are the same).
----

@@[算經]
  https://en.wikipedia.org/wiki/Sunzi_Suanjing
@@
@@[sea island]
  /lit/sea-island
@@
@@[ten canon classics]
  https://en.wikipedia.org/wiki/Ten_Computational_Canons
@@
@@[孫子]
  https://en.wikipedia.org/wiki/Sun_Tzu
@@
@@[兵法]
  https://en.wikipedia.org/wiki/The_Art_of_War
@@

----
In late April~2019, I set myself the task of translating
the entire "\sun-tzu's Computational Classic" into English.
Apparently this has been done before by Ang \&~Lam
(see [ _Fleeting Footsteps_ ][ang lam]),
but I have **not** read that translation,
and I probably never will because it is behind a paywall.
----

@@[ang lam]
  https://books.google.com.au/books/about/Fleeting_Footsteps.html\
    ?id=fGYmpWE5UZgC
@@

----
As of 23 November 2019,
I have finished a [manuscript] for the entire translation,
but it will probably take until the end of~2020
to revise and type up all of it up in web (HTML) format.
----

@@[manuscript]
  #translation-manuscript
@@


###{#versions}
  Versions
###

----
There are four versions which I refer to,
with slight differences in wording between them:
----
====
* [Version~A: 02094034.cn at archive.org][a]
* [Version~B: 《文淵閣四庫全書》第0797冊 at Wikimedia Commons][b]
* [Version~C: ctext.org database page][c]
* [Version~D: 《知不足齋叢書》本 at ctext.org library][d]
====
----
**Unless noted otherwise, I follow the text from [Version~D][d].**
The punctuation is based on [Version~C][c], but with changes to my liking.
----

@@[a]
  https://archive.org/details/02094034.cn
@@
@@[b]
  https://commons.wikimedia.org/w/index.php\
    ?title=\
      File%3A%E6%96%87%E6%B7%B5%E9%96%A3%E5%9B%9B%E5%BA%AB%E5%85%A8%E6%9B%B8\
      _0797%E5%86%8A.djvu\
    &page=144
@@
@@[c]
  https://ctext.org/sunzi-suan-jing
@@
@@[d]
  https://ctext.org/library.pl?if=en&res=80226
@@

----
**The historic versions, A, B, and~D, have no paragraphing**, only line breaks.
The splitting of each volume into paragraphs is an entirely modern practice,
and I have only done it to have smaller HTML pages (which load faster)
and to make it easier to refer to specific parts of the text.
----


###{#variant-characters}
  Canonical variant-character substitutions
###

----
The following variant-character substitutions have been used
(in each pair the character on the right is preferred):
----
||||{.variant-characters}
  羣群
  氂釐
  歴歷
  卽即
  爲為
  㵎澗
  乗乘
  荅答
  竝並
  幷并
||||


###{#weight}
  A note on mass and weight
###

----
Classical Chinese does not distinguish between mass and weight;
nor is this a physics text in which the distinction is important.
Therefore I will be using the two terms interchangeably.
----


###{#translation-manuscript}
  Conway's translation manuscript
###

----
These are PDF scans of my handwritten translation scribblings.
They are drafts, and as such, do not contain
edits and corrections I have made since they were scanned.
----

<##
  URL for "Manuscript for Volume v Paragraph p" in round brackets [m"v p"]
##>
{%
  [ ]* \[m"(?P<volume> [i] {1,3} ) [ ] (?P<paragraph> [0-9] + )"\]
%
  (
    https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\\
      manuscripts/sun-tzu-\g<volume>-\g<paragraph>.pdf
  )
%}

===={.manuscript-links}
* [Version referencing system](
    https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
      manuscripts/sun-tzu-versions.pdf
  )
* [__Preface__](
    https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
      manuscripts/sun-tzu-preface.pdf
  )
* __Volume~I:__
    [\P1] [m"i 1"]
    [\P2] [m"i 2"]
    [\P3] [m"i 3"]
    [\P4] [m"i 4"]
    [\P5] [m"i 5"]
    [\P6] [m"i 6"]
    [\P7] [m"i 7"]
    [\P8] [m"i 8"]
    [\P9] [m"i 9"]
    [\P10] [m"i 10"]
    [\P11] [m"i 11"]
    [\P12] [m"i 12"]
    [\P13] [m"i 13"]
    [\P14] [m"i 14"]
    [\P15] [m"i 15"]
    [\P16] [m"i 16"]
    [\P17] [m"i 17"]
    [\P18] [m"i 18"]
    [\P19] [m"i 19"]
    [\P20] [m"i 20"]
    [\P21] [m"i 21"]
    [\P22] [m"i 22"]
    [\P23] [m"i 23"]
    [\P24] [m"i 24"]
* __Volume~II:__
    [\P1] [m"ii 1"]
    [\P2] [m"ii 2"]
    [\P3] [m"ii 3"]
    [\P4] [m"ii 4"]
    [\P5] [m"ii 5"]
    [\P6] [m"ii 6"]
    [\P7] [m"ii 7"]
    [\P8] [m"ii 8"]
    [\P9] [m"ii 9"]
    [\P10] [m"ii 10"]
    [\P11] [m"ii 11"]
    [\P12] [m"ii 12"]
    [\P13] [m"ii 13"]
    [\P14] [m"ii 14"]
    [\P15] [m"ii 15"]
    [\P16] [m"ii 16"]
    [\P17] [m"ii 17"]
    [\P18] [m"ii 18"]
    [\P19] [m"ii 19"]
    [\P20] [m"ii 20"]
    [\P21] [m"ii 21"]
    [\P22] [m"ii 22"]
    [\P23] [m"ii 23"]
    [\P24] [m"ii 24"]
    [\P25] [m"ii 25"]
    [\P26] [m"ii 26"]
    [\P27] [m"ii 27"]
    [\P28] [m"ii 28"]
* __Volume~III:__
    [\P1] [m"iii 1"]
    [\P2] [m"iii 2"]
    [\P3] [m"iii 3"]
    [\P4] [m"iii 4"]
    [\P5] [m"iii 5"]
    [\P6] [m"iii 6"]
    [\P7] [m"iii 7"]
    [\P8] [m"iii 8"]
    [\P9] [m"iii 9"]
    [\P10] [m"iii 10"]
    [\P11] [m"iii 11"]
    [\P12] [m"iii 12"]
    [\P13] [m"iii 13"]
    [\P14] [m"iii 14"]
    [\P15] [m"iii 15"]
    [\P16] [m"iii 16"]
    [\P17] [m"iii 17"]
    [\P18] [m"iii 18"]
    [\P19] [m"iii 19"]
    [\P20] [m"iii 20"]
    [\P21] [m"iii 21"]
    [\P22] [m"iii 22"]
    [\P23] [m"iii 23"]
    [\P24] [m"iii 24"]
    [\P25] [m"iii 25"]
    [\P26] [m"iii 26"]
    [\P27] [m"iii 27"]
    [\P28] [m"iii 28"]
    [\P29] [m"iii 29"]
    [\P30] [m"iii 30"]
    [\P31] [m"iii 31"]
    [\P32] [m"iii 32"]
    [\P33] [m"iii 33"]
    [\P34] [m"iii 34"]
    [\P35] [m"iii 35"]
    [\P36] [m"iii 36"]
====



##{#translation-links-2}
  Translation (links to volumes)
##


<<
  《孫子算經》
||
  "\sun-tzu's Computational Classic"
>>

===={.volumes}
* [《序》 "Preface"] ["p"]
* [《卷上》 "Volume~I"] ["i"]
* [《卷中》 "Volume~II"] ["ii"] (incomplete)
* 《卷下》 "Volume~III" (haven't started)
====


\cite-this-page[
  "\sun-tzu's Computational Classic"
][
  sun-tzu
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}''~~
]

%footer-element
