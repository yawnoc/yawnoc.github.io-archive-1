{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P18
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P18](\/ You are viewing \P18)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P18. Volume of a rectangular prism~(2)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P17 : ["ii 17"]
    \nav-curr: \P18
    \nav-next: \P19 : ["ii 19"]
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
Chinese source text: \a[38], \b[155], \c[52183], \d[51]. \+
\d-default
----

<<
  今有溝，廣十丈，深五丈，長二十丈，欲以千尺作一方。問得幾何？
||
  Now there be .[a] ditch, of
    width ten rods,
    depth five rods, .[and]
    length twenty rods,
  .[and we] wish to consider .[a] thousand rules as one block.
  .[We] ask, how many result?
>>

<<
  答曰：一千方。
||
  Answer saith: one thousand blocks.
>>

<<
  術曰：置廣一十丈。以深五丈乘之，得五千尺。又以長二十丈乘之，得一百萬尺。
||
  Method saith: put .[down the] width, ten rods.
  Multiplying it by .[the] depth, five rods,
  resulteth in five thousand rules.
  Also multiplying it by .[the] length, twenty rods,
  resulteth in one hundred myriad rules.
>>

<<
  以一千除之，即得。
||
  Dividing it by one thousand, .[we] are done.
>>
====
* In modern notation, the volume of a rectangular prism of
    width $W = 10 \unit{rods}$,
    depth $H = 5 \unit{rods}$, and
    length $L = 20 \unit{rods}$
  is
  $$
    \begin{aligned}
      V
      &= W H L \\
      &=
        100 \unit{rules} \times 50 \unit{rules} \times 200 \unit{rules}
          \div
        \frac{1000 \unit{rules}^3}{\unit{block}}
          \\[\tallspace]
      &= 1000 \unit{blocks}.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P17 : ["ii 17"]
    \nav-curr: \P18
    \nav-next: \P19 : ["ii 19"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P18"
][
  sun-tzu-ii-18
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P18}''~~
]

%footer-element
