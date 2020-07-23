{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P8
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P8](\/ You are viewing \P8)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P8. Volume conversions for grain~(4)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P7 : ["ii 7"]
    \nav-curr: \P8
    \nav-next: \P9 : ["ii 9"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of a volume conversion for trading grain
using __cross-multiplication__.
----
----
The relevant unit conversions for capacity are
----
$$
  \begin{aligned}
    1 \unit{peck~(斗)} &= 10 \unit{quarts~(升)} \\
    1 \unit{quart~(升)} &= 10 \unit{gills~(合)} \\
    1 \unit{gill~(合)} &= 10 \unit{ladles~(勺)}.
  \end{aligned}
$$
----
See [Vol.~I \P3 (Units of capacity)] ["i 3"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[30], \b[154], \c[52151], \d[44]. \+
\d-default
----

<<
  今有粟七斗九升。問為御米幾何？ \+
  答曰：三斗三升一合八勺。
||
  Now there be grain, seven pecks .[and] nine quarts.
  .[We] ask, how much be .[this in] poppy seed? \+
  Answer saith: three pecks, three quarts, one gill, .[and] eight ladles.
>>
====
* \c[52148] erroneously has 栗 for 粟.

* 御米： poppy seed; \lit imperial grain; \or royal grain
====

<<
  術曰：置七斗九升。\
  以御米率二十一乘之，得一千六百五十九升為實。以粟率五十除之，即得。
||
  Method saith: put .[down the] seven pecks .[and] nine quarts.
  Multiplying it by .[the] poppy seed rate, twenty-one,
  resulteth in one thousand, six hundred .[and] fifty-nine quarts
  as .[the] dividend.
  Dividing it by .[the] grain rate, fifty, .[we] are done.
>>
====
* In modern notation:
  $$
    \begin{aligned}
      V(\text{poppy seed})
      &=
        \frac{
          V(\text{grain}) \cdot r(\text{poppy seed})
        }{
          r(\text{grain})
        }
          \\[\tallspace]
      &= \frac{79 \unit{quarts} \times 21}{50} \\[\tallspace]
      &= 33.18 \unit{quarts}.
    \end{aligned}
  $$
  The rates 21~for poppy seed and 50~for (regular) grain appear to come from
  《九章算術\.粟米》, "Nine Chapters .[on] Computational Methods: Grain".
  See [\P5 commentary](/sun-tzu/ii/5#commentary).
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P7 : ["ii 7"]
    \nav-curr: \P8
    \nav-next: \P9 : ["ii 9"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P8"
][
  sun-tzu-ii-8
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P8}''~~
]

%footer-element
