{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P12
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P12](\/ You are viewing \P12)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P12. Volume of a cylinder~(2)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P11 : ["ii 11"]
    \nav-curr: \P12
    \nav-next: \P13 : ["ii 13"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __volume of a cylinder__.
----
----
The relevant unit conversions for length are
----
$$
  \begin{aligned}
    1 \unit{rod~(丈)} &= 10 \unit{rules~(尺)} \\
    1 \unit{rule~(尺)} &= 10 \unit{inches~(寸)} \\
    1 \unit{inch~(寸)} &= 10 \unit{tenths~(分)}.
  \end{aligned}
$$
----
The conversion between capacity units and volume units is given by
----
$$
  1 \unit{barrel~(斛)} = 1.62 \unit{rules~(尺)}^3.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"]
and [Vol.~II \P10 Extended commentary (capacity--volume conversion)] [斛法].
----

@@[斛法]
  /sun-tzu/ii/10#commentary
@@


##{#translation}
  Translation
##

----
Chinese source text: \a[34], \b[154], \c[52163], \d[47]. \+
\d-default
----

<<
  今有圓窖，周五丈四尺，深一丈八尺。問受粟幾何？
||
  Now there be .[a] circular cellar,
  of circumference five rods .[and] four rules,
  .[and] depth one rod .[and] eight rules.
  .[We] ask, how much grain beareth .[it]?
>>

<<
  答曰：二千七百斛。
||
  Answer saith:
  two thousand seven hundred barrels.
>>

<<
  術曰：先置周五丈四尺，自相乘，得二千九百一十六尺。
||
  Method saith:
  First put .[down the] circumference, five rods .[and] four rules,
  .[which], multiplied with itself,
  resulteth in two thousand, nine hundred .[and] sixteen rules.
>>
====
* \a[34], \b[154], and \d[47] are erroneously missing 自 in 自相乘.
====

<<
  以深一丈八尺乘之，得五萬二千四百八十八尺。
||
  Multiplying it by .[the] depth, one rod .[and] eight rules,
  resulteth in
    five myriad, two thousand, four hundred .[and] eighty-eight rules.
>>

<<
  以一十二除之，得四千三百七十四尺。
||
  Dividing it by twelve,
  resulteth in four thousand, three hundred .[and] seventy-four rules.
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

* In modern notation, the volume (or capacity) of a cylinder
  of circumference $C = 54 \unit{rules}$ and depth $H = 18 \unit{rules}$
  is
  $$
    \begin{aligned}
      V
      &\approx \frac{C^2 H}{12} \\[\tallspace]
      &=
        \frac{(54 \unit{rules})^2 \cdot (18 \unit{rules})}{12}
          \div
        \frac{1.62 \unit{rules}^3}{\unit{barrel}}
          \\[\tallspace]
      &= 2700 \unit{barrels}.
    \end{aligned}
  $$
  Here $\pi \approx 3$ (so that $4\pi \approx 12$),
  see [Vol.~I \P5] ["i 5"].
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P11 : ["ii 11"]
    \nav-curr: \P12
    \nav-next: \P13 : ["ii 13"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P12"
][
  sun-tzu-ii-12
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P12}''~~
]

%footer-element
