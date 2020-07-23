{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P11
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P11](\/ You are viewing \P11)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P11. Volume of a rectangular prism~(1)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P10 : ["ii 10"]
    \nav-curr: \P11
    \nav-next: \P12 : ["ii 12"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __volume of a rectangular prism__.
----
----
The relevant unit conversions for length are
----
$$
  \begin{aligned}
    1 \unit{rod~(丈)} &= 10 \unit{rules~(尺)} \\
    1 \unit{rule~(尺)} &= 10 \unit{inches~(寸)} \\
    1 \unit{inch~(寸)} &= 10 \unit{tenths~(分)},
  \end{aligned}
$$
----
and, for capacity,
----
$$
  \begin{aligned}
    1 \unit{barrel~(斛)} &= 10 \unit{pecks~(斗)} \\
    1 \unit{peck~(斗)} &= 10 \unit{quarts~(升)}.
  \end{aligned}
$$
----
The conversion between capacity units and volume units is given by
----
$$
  1 \unit{barrel~(斛)} = 1.62 \unit{rules~(尺)}^3.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"],
[Vol.~I \P3 (Units of capacity)] ["i 3"],
and [Vol.~II \P10 Extended commentary (capacity--volume conversion)] [斛法].
----

@@[斛法]
  /sun-tzu/ii/10#commentary
@@


##{#translation}
  Translation
##

----
Chinese source text: \a[34], \b[154], \c[52160], \d[46]. \+
\d-default
----

<<
  今有方窖，廣四丈六尺，長五丈四尺，深三丈五尺。問受粟幾何？
||
  Now there be .[a] rectangular cellar,
  of width four rods .[and] six rules,
  length five rods .[and] four rules,
  .[and] depth three rods .[and] five rules.
  .[We] ask, how much grain beareth .[it]?
>>

<<
  答曰：五萬三千六百六十六斛六斗六升三分升之二。
||
  Answer saith:
    five myriad, three thousand, six hundred .[and] sixty-six barrels,
    six pecks, six quarts, .[and] two thirds of .[a] quart.
>>
====
* \a[34] and \d[46] erroneously have 三分升之一 for 三分升之二.
====

<<
  術曰：置廣四丈六尺、長五丈四尺，相乘，得二千四百八十四尺。
||
  Method saith:
  put .[down the] width, four rods .[and] six rules,
  .[and the] length, five rods .[and] four rules,
  .[which], multiplied with each other,
  result in two thousand, four hundred .[and] eighty-four rules.
>>

<<
  以深三丈五尺乘之，得八萬六千九百四十尺。
||
  Multiplying it by .[the] depth, three rods .[and] five rules,
  resulteth in
    eight myriad, six thousand, nine hundred .[and] forty rules.
>>

<<
  以斛法一尺六寸二分除之，即得。
||
  Dividing it by .[the] barrel divisor,
    one rule, six inches, .[and] two tenths,
  .[we] are done.
>>
====
* 斛法： .[the] barrel divisor \+
  This is the conversion between the capacity unit "barrel", hu ((斛)),
  and the volume unit "cubic rule", ch'ih ((尺));
  see [\P10 Extended commentary] [斛法].

* In modern notation, the volume (or capacity) of a rectangular prism of
  width $W = 46 \unit{rules}$,
  length $L = 54 \unit{rules}$, and
  depth $H = 35 \unit{rules}$ is
  $$
    \begin{aligned}
      V
      &= W L H \\
      &=
        46 \unit{rules} \times 54 \unit{rules} \times 35 \unit{rules}
          \div
        \frac{1.62 \unit{rules}^3}{\unit{barrel}}
          \\[\tallspace]
      &= 53666 \tfrac{2}{3} \unit{barrels} \\
      &= 53666 \unit{barrels} + 6 \unit{pecks} + 6 \tfrac{2}{3} \unit{quarts}.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P10 : ["ii 10"]
    \nav-curr: \P11
    \nav-next: \P12 : ["ii 12"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P11"
][
  sun-tzu-ii-11
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P11}''~~
]

%footer-element
