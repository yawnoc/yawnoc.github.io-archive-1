{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P9
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P9](\/ You are viewing \P9)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P9. Area of a rectangle
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P8 : ["ii 8"]
    \nav-curr: \P9
    \nav-next: \P10 : ["ii 10"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing the __area of a rectangle__.
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
Chinese source text: \a[32], \b[154], \c[52154], \d[44]. \+
\d-default
----

<<
  今有屋基，南北三丈，東西六丈，欲以甎砌之。凡積二尺，用甎五枚。問計幾何？
||
  Now there be .[an] house foundation,
  three rods north-.[to]-south, .[and] six rods east-.[to]-west,
  .[and we] wish to build it with bricks.
  Every two rules of area, useth five bricks.
  .[We] ask, how many amounteth .[this] to?
>>
====
* 南北： north-.[to]-south; \lit south-.[to]-north

* \c[52154] erroneously has ●~`U+25CF` for both instances of 甎.

* 枚 \+
  Classifier for bricks, omitted in the English.
====

<<
  答曰：四千五百枚。
||
  Answer saith: four thousand five hundred .[bricks].
>>

<<
  術曰：置東西六丈，以南北三丈乘之，得一千八百尺。\
  以五乘之，得九千尺。以二除之，即得。
||
  Method saith: put .[down the] six rods east-.[to]-west.
  Multiplying it by .[the] three rods north-.[to]-south,
  resulteth in one thousand eight hundred rules.
  Multiplying it by five, resulteth in nine thousand rules.
  Dividing it by two, .[we] are done.
>>
====
* 九千尺： nine thousand rules \+
  This is area, but square units were simply referred to as units.

* In modern notation, the number of bricks required to fill
  a rectangle of length $L = 3 \unit{rods}$
  and width $W = 6 \unit{rods}$
  at number density $\rho = 5 / (2 \unit{rules}^2)$ is
  $$
    \begin{aligned}
      N
      &= L W \rho \\
      &=
        3 \unit{rods}
        \times 6 \unit{rods}
        \times \frac{5}{2 \unit{rules}^2}
          \\
      &= 4500.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P8 : ["ii 8"]
    \nav-curr: \P9
    \nav-next: \P10 : ["ii 10"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P9"
][
  sun-tzu-ii-9
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P9}''~~
]

%footer-element
