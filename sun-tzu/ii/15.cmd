{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P15
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P15](\/ You are viewing \P15)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P15. Dividing a cube into smaller cubes
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P14 : ["ii 14"]
    \nav-curr: \P15
    \nav-next: \P16 : ["ii 16"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __number of smaller cubes which make up a bigger cube__.
----
----
The relevant unit conversion for length is
----
$$
  1 \unit{rule~(尺)} = 10 \unit{inches~(寸)}.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[36], \b[155], \c[52174], \d[49]. \+
\d-default
----

<<
  今有木方三尺，欲方五寸作枕一枚。問得幾何？
||
  Now there be .[a] wooden cube .[of edge] three rules,
  .[and we] wish .[that each] cube .[of edge] five inches .[thereof be]
  made into one pillow.
  .[We] ask, how many result?
>>
====
* \b[155] and \c[52174] have 高三尺 after 木方三尺.

* 枚 \+
  Classifier, omitted in the English.
====

<<
  答曰：二百一十六枚。
||
  Answer saith: two hundred .[and] sixteen .[pillows].
>>

<<
  術曰：置方三尺，自相乘，得九尺。以高三尺乘之，得二十七尺。
||
  Method saith:
  put .[down the] cube's .[edge], three rules,
  .[which], multiplied with itself, resulteth in nine rules.
  Multiplying it by .[the] height, three rules,
  resulteth in twenty-seven rules.
>>

<<
  以一尺木八枕乘之，即得。
||
  Multiplying it by eight pillows .[for each] one rule of wood,
  .[we] are done.
>>
====
* 一尺： one rule \+
  This is a **cubic** rule, as are the 27~rules above.

* In modern notation, the number of pillows is
  $$
    (3 \unit{rules})^3 \times \frac{8}{1 \unit{rule}^3} = 216,
  $$
  where we have used the fact that
  $1 \unit{rule} = 2 \times 5 \unit{inches}$,
  and that $2^3 = 8$.
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P14 : ["ii 14"]
    \nav-curr: \P15
    \nav-next: \P16 : ["ii 16"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P15"
][
  sun-tzu-ii-15
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P15}''~~
]

%footer-element
