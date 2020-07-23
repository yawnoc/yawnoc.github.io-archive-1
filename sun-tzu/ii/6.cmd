{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P6
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P6](\/ You are viewing \P6)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P6. Volume conversions for grain~(2)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P5 : ["ii 5"]
    \nav-curr: \P6
    \nav-next: \P7 : ["ii 7"]
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
The relevant unit conversion for capacity is
----
$$
  1 \unit{peck~(斗)} = 10 \unit{quarts~(升)}.
$$
----
See [Vol.~I \P3 (Units of capacity)] ["i 3"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[30], \b[153], \c[52145], \d[42]. \+
\d-default
----

<<
  今有粟二斗一升。問為粺米幾何？ \+
  答曰：一斗一升五十分升之一十七。
||
  Now there be grain, two pecks .[and] one quart.
  .[We] ask, how much be .[this in] fine grain? \+
  Answer saith: one peck, one quart, .[and] seventeen fiftieths of .[a] quart.
>>
====
* \c[52145] erroneously has 稗 for 粺, both here and below.

* 粺： fine grain \+
  粺， \C 《分韻撮要》 p'ei4, 《正韻》薄邁切, paai6, \M b(a\)i

* 五十分升之一十七： \lit seventeen of fifty shares of .[a] quart
====

<<
  術曰：置粟二十一升。以粺米率二十七乘之，得五百六十七升為實。\
  以粟率五十為法，除之。不盡，以法而命分。
||
  Method saith: put .[down the] grain, twenty-one quarts.
  Multiplying it by .[the] fine grain rate, twenty-seven,
  resulteth in five hundred .[and] sixty-seven quarts as .[the] dividend.
  Use .[the] grain rate, fifty, as .[the] divisor, .[and] divide them.
  .[For the] remainder, use .[the] divisor to name .[the] fraction.
>>
====
* In modern notation:
  $$
    \begin{aligned}
      V(\text{fine grain})
      &=
        \frac{
          V(\text{grain}) \cdot r(\text{fine grain})
        }{
          r(\text{grain})
        }
          \\[\tallspace]
      &= \frac{21 \unit{quarts} \times 27}{50} \\[\tallspace]
      &= 11 \tfrac{17}{50} \unit{quarts}.
    \end{aligned}
  $$
  The rates 27~for fine grain and 50~for (regular) grain appear to come from
  《九章算術\.粟米》, "Nine Chapters .[on] Computational Methods: Grain".
  See [\P5 commentary](/sun-tzu/ii/5#commentary).
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P5 : ["ii 5"]
    \nav-curr: \P6
    \nav-next: \P7 : ["ii 7"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P6"
][
  sun-tzu-ii-6
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P6}''~~
]

%footer-element
