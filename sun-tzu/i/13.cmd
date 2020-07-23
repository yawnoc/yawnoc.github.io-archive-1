{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P13
  %date-created 2019-06-09
  %date-modified 2020-05-28
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P13](\/ You are viewing \P13)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P13. Rod calculus multiplication: $81 \times 81$
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P12 : ["i 12"]
    \nav-curr: \P13
    \nav-next: \P14 : ["i 14"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a fully worked example
of the __rod calculus multiplication__ algorithm described in [\P8] ["i 8"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[10], \b[148], \c[52073], \d[17]. \+
\d-default
----

<<
  九九八十一，自相乘，得幾何？ \+
  答曰：六千五百六十一。
||
  Nine nines .[are] eighty-one, .[which],
  multiplied with itself, resulteth in how much? \+
  Answer saith: six thousand, five hundred .[and] sixty-one.
>>
====
* In modern notation:
  $$
    \begin{aligned}
      9 \times 9 &= 81 \\
      81 \times 81 &= 6561.
    \end{aligned}
  $$
====

<<
  術曰：重置其位。
||
  Method saith: put into .[a] stack .[the] places.
>>
====
* 重置其位 \+
  See [\P8] ["i 8"].
====

<<
  以上八呼下八，八八六十四，即下六千四百於中位。
||
  Calling .[the] lower eight with .[the] upper eight:
  eight eights .[are] sixty-four, that is,
  put down six thousand four hundred upon .[the] middle places.
>>

<<
  以上八呼下一，一八如八，即於中位下八十。
||
  Calling .[the] lower one with .[the] upper eight:
  one eight .[is] as eight, that is,
  upon .[the] middle places, put down eighty.
>>

<<
  退下位一等，收上位八十。
||
  Retreat .[the] lower places .[by] one rank, .[and]
  put away eighty .[the] upper place.
>>
====
* \b[148] has 收上頭位 for 收上位.
====

<<
  以上位一呼下八，一八如八，即於中位下八十。
||
  Calling .[the] lower eight with one .[the] upper place:
  one eight .[is] as eight, that is,
  upon .[the] middle places, put down eighty.
>>

<<
  以上一呼下一，一一如一，即於中位下一。
||
  Calling .[the] lower one with .[the] upper one:
  one one .[is] as one, that is,
  upon .[the] middle places, put down one.
>>

<<
  上下位俱收，中位即得六千五百六十一。
||
  .[The] upper .[and] lower places .[now] all put away,
  .[the] middle places do result in
  six thousand, five hundred .[and] sixty-one.
>>

====
* In animated form ([link to source code]):
  
  ||||{.centred-block}
    ![Animation for \sun-tzu multiplication: 81 multiplied by 81](
      /sun-tzu/code/multiply-81-81.gif
    )
  ||||
  
  @@[link to source code]
    /sun-tzu/code/animations
  @@
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P12 : ["i 12"]
    \nav-curr: \P13
    \nav-next: \P14 : ["i 14"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P13"
][
  sun-tzu-i-13
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P13}''~~
]

%footer-element
