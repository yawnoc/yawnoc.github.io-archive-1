{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P16
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P16](\/ You are viewing \P16)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P16. Side length of a square of given perimeter
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P15 : ["ii 15"]
    \nav-curr: \P16
    \nav-next: \P17 : ["ii 17"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __side length of a square given its perimeter__.
----
----
The relevant unit conversion for length is
----
$$
  1 \unit{pace~(步)} = 6 \unit{rules~(尺)}.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[38], \b[155], \c[52177], \d[50]. \+
\d-default
----

<<
  今有索長五千七百九十四步，欲使作方。問幾何？ \+
  答曰：一千四百四十八步三尺。
||
  Now there be rope,
  of length five thousand, seven hundred .[and] ninety-four paces,
  .[and we] wish to make .[it] be .[a] square.
  .[We] ask, how much .[be its edge]? \+
  Answer saith:
    one thousand, four hundred .[and] forty-eight paces .[and] three rules.
>>

<<
  術曰：置索長五千七百九十四步。以四除之，得一千四百四十八步，餘二步。
||
  Method saith:
  put .[down the] rope's length,
    five thousand, seven hundred .[and] ninety-four paces.
  Dividing it by four, resulteth in
    one thousand, four hundred .[and] forty-eight paces,
    remainder two paces.
>>

<<
  以六因之，得一丈二尺。以四除之，得三尺。
||
  Multiplying it by six, resulteth in one rod .[and] two rules.
  Dividing it by four, resulteth in three rules.
>>
====
* 因： multiplying \+
  As in times tables, 九因歌, ".[the] Song of Nine Multiples".
====

<<
  通計，即得。
||
  Computing .[the] total, .[we] are done.
>>
====
* 通：總也； total

* In modern notation, the side length of the square is
  $$
    \begin{aligned}
      \frac{5794 \unit{paces}}{4}
      &=
        1448 \unit{paces}
          +
        \frac{2 \unit{paces}}{4}
          \times
        \frac{6 \unit{rules}}{\unit{pace}} \\[\tallspace]
      &= 1448 \unit{paces} + 3 \unit{rules}.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P15 : ["ii 15"]
    \nav-curr: \P16
    \nav-next: \P17 : ["ii 17"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P16"
][
  sun-tzu-ii-16
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P16}''~~
]

%footer-element
