{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P17
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P17](\/ You are viewing \P17)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P17. Volume of a trapezoidal prism
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P16 : ["ii 16"]
    \nav-curr: \P17
    \nav-next: \P18 : ["ii 18"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __volume of a trapezoidal prism__.
----
----
The relevant unit conversion for length is
----
$$
  1 \unit{rod~(丈)} = 10 \unit{rules~(尺)}.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[38], \b[155], \c[52180], \d[51]. \+
\d-default
----

<<
  今有隄，下廣五丈，上廣三丈，高二丈，長六十尺，欲以一千尺作一方。問計幾何？
||
  Now there be .[an] embankment, of
    lower width five rods,
    upper width three rods,
    height two rods, .[and]
    length sixty rules,
  .[and we] wish to consider one thousand rules as one block.
  .[We] ask, how many amounteth .[this] to?
>>
====
* 一千尺： one thousand rules \+
  In modern language these are **cubic** rules.
====

<<
  答曰：四十八方。
||
  Answer saith: forty-eight blocks.
>>

<<
  法曰：置隄上廣三丈、下廣五丈。并之，得八丈。半之，得四丈。
||
  Method saith:
  put .[down the] embankment's upper width, three rods,
  .[and the] lower width, five rods.
  Combining them, resulteth in eight rods.
  Halving it, resulteth in four rods.
>>
====
* 法： method \+
  \b[155] and \c[52180] have the usual 術 for 法.
====

<<
  以高二丈乘之，得八百尺。以長六十尺乘之，得四萬八千。
||
  Multiplying it by .[the] height, two rods,
  resulteth in eight hundred rules.
  Multiplying it by .[the] length, sixty rules,
  resulteth in four myriad .[and] eight thousand.
>>
====
* \b[155] has 以二丈 for 以高二丈.
====

<<
  以一千尺除之，即得。
||
  Dividing it by one thousand rules, .[we] are done.
>>
====
* In modern notation, the volume of a trapezoidal prism of
    upper width $A = 3 \unit{rods}$,
    lower width $B = 5 \unit{rods}$,
    height $H = 2 \unit{rods}$, and
    length $L = 60 \unit{rules}$
  is
  $$
    \begin{aligned}
      V
      &= \frac{A + B}{2} \cdot H L \\[\tallspace]
      &=
        \frac{30 \unit{rules} + 50 \unit{rules}}{2}
          \times
        20 \unit{rules} \times 60 \unit{rules}
          \div
        \frac{1000 \unit{rules}^3}{\unit{block}}
          \\[\tallspace]
      &= 48 \unit{blocks}.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P16 : ["ii 16"]
    \nav-curr: \P17
    \nav-next: \P18 : ["ii 18"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P17"
][
  sun-tzu-ii-17
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P17}''~~
]

%footer-element
