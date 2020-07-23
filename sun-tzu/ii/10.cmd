{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P10
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P10](\/ You are viewing \P10)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P10. Volume of a cylinder~(1)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P9 : ["ii 9"]
    \nav-curr: \P10
    \nav-next: \P11 : ["ii 11"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __volume of a cylinder__,
and contains the first mention of
the __conversion between the capacity unit "barrel"__, hu ((斛)),
__and the volume unit "cubic rule"__, ch'ih ((尺)):
----
$$
  1 \unit{barrel~(斛)} = 1.62 \unit{rules~(尺)}^3.
$$
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
  1 \unit{barrel~(斛)} = 100 \unit{quarts~(升)}.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"]
and [Vol.~I \P3 (Units of capacity)] ["i 3"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[32], \b[154], \c[52157], \d[45]. \+
\d-default
----

<<
  今有圓窖，下周二百八十六尺，深三丈六尺。問受粟幾何？
||
  Now there be .[a] circular cellar,
  of lower circumference two hundred .[and] eighty-six rules,
  .[and] depth three rods .[and] six rules.
  .[We] ask, how much grain beareth .[it]?
>>
====
* 窖：地藏也； cellar \+
  窖，居效切， \C kaau3, \M ji(a\)o
====

<<
  答曰：一十五萬一千四百七十四斛七升二十七分升之一十一。
||
  Answer saith:
    fifteen myriad, one thousand, four hundred .[and] seventy-four barrels,
    seven quarts, .[and] eleven twenty-sevenths of .[a] quart.
>>

<<
  術曰：置周二百八十六尺，自相乘，得八萬一千七百九十六尺。
||
  Method saith:
  put .[down the] circumference, two hundred .[and] eighty-six rules,
  .[which], multiplied with itself,
  resulteth in
    eight myriad, one thousand, seven hundred .[and] ninety-six rules.
>>

<<
  以深三丈六尺乘之，得二百九十四萬四千六百五十六尺。
||
  Multiplying it by .[the] depth, three rods .[and] six rules,
  resulteth in
    two hundred .[and] ninety-four myriad,
    four thousand, six hundred .[and] fifty-six rules.
>>
====
* \c[52157] has 尺 at the end of this sentence.
====

<<
  以一十二除之，得二十四萬五千三百八十八尺。
||
  Dividing it by twelve,
  resulteth in
    twenty-four myriad,
    five thousand, three hundred .[and] eighty-eight rules.
>>

<<
  以斛法一尺六寸二分除之，即得。
||
  Dividing it by .[the] barrel divisor,
    one rule, six inches, .[and] two tenths,
  .[we] are done.
>>
====
* 斛法一尺六寸二分：
    .[the] barrel divisor, one rule, six inches, .[and] two tenths \+
  This is the conversion between the capacity unit "barrel", hu ((斛)),
  and the volume unit "cubic rule", ch'ih ((尺)).
  Rules, inches, and tenths are units of length,
  so at face value 一尺六寸二分 represents the length 1.62~rules.
  However, it is intended to represent the volume 1.62~**cubic** rules;
  see [Extended commentary](#commentary).

* In modern notation, the volume (or capacity) of a cylinder
  of circumference $C = 286 \unit{rules}$ and depth $H = 36 \unit{rules}$
  is
  $$
  \begin{aligned}
    V
    &\approx \frac{C^2 H}{12} \\[\tallspace]
    &=
      \frac{(286 \unit{rules})^2 \cdot (36 \unit{rules})}{12}
        \div
      \frac{1.62 \unit{rules}^3}{\unit{barrel}}
        \\[\tallspace]
    &= 151474 \tfrac{2}{27} \unit{barrels} \\
    &= 151474 \unit{barrels} + 7 \tfrac{11}{27} \unit{quarts}.
  \end{aligned}
  $$
  Here $\pi \approx 3$ (so that $4\pi \approx 12$),
  see [Vol.~I \P5] ["i 5"].
====


##{#commentary}
  Extended commentary
##

----
The 斛法, "barrel divisor",
gives the conversion between the capacity unit "barrel", hu ((斛)),
and the volume unit "cubic rule", ch'ih ((尺)).
----
----
If we parse the barrel divisor 一尺六寸二分 literally,
it is the length
----
$$
  1 \unit{rule~(尺)} + 6 \unit{inches~(寸)} + 2 \unit{tenths~(分)}
  = 1.62 \unit{rules~(尺)}.
$$
----
Now Chinese mathematics not have
a fully developed notion of dimensional analysis,
so square units and cubic units were simply referred to as units.
In the case of the barrel divisor,
一尺六寸二分 is actually *intended* to represent the volume
----
$$
  \begin{aligned}
    1.62 \unit{rules}^3
    &=
      (1 \unit{rule} + 6 \unit{inches} + 2 \unit{tenths})
        \cdot
      1 \unit{rule}^2 \\
    &= 1 \unit{rule}^3 + 600 \unit{inches}^3 + 20000 \unit{tenths}^3 \\
    &\ne 1 \unit{rule}^3 + 6 \unit{inches}^3 + 2 \unit{tenths}^3.
  \end{aligned}
$$
----
Evidently Chinese mathematicians knew that
a cubic inch wasn't equal to a tenth of a cubic rule,
but they had no means of expressing this in words.
----
----
In modern (dimensionally consistent) notation,
----
$$
  1 \unit{barrel} = 1.62 \unit{rules}^3,
$$
----
so that the barrel divisor is
----
$$
  1 = \frac{1.62 \unit{rules}^3}{\unit{barrel}}.
$$


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P9 : ["ii 9"]
    \nav-curr: \P10
    \nav-next: \P11 : ["ii 11"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P10"
][
  sun-tzu-ii-10
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P10}''~~
]

%footer-element
