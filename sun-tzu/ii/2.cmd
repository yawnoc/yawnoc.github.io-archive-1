{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P2
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P2](\/ You are viewing \P2)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P2. Adding fractions
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P1 : ["ii 1"]
    \nav-curr: \P2
    \nav-next: \P3 : ["ii 3"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of adding fractions.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[26], \b[153], \c[52133], \d[39]. \+
\d-default
----

<<
  今有三分之一、五分之二。問合之二得幾何？ \+
  答曰：一十五分之一十一。
||
  Now there be one of three shares .[and] two of five shares.
  .[We] ask, joining them two resulteth in how much? \+
  Answer saith: eleven of fifteen shares.
>>
====
* \c[52133] has only 合之 for 合之二.

* \b[153] has 十一 for 一十一.

* <span lang="zh-Hant">$b$ ~~分之~~ $a$</span>:
    \lit $a$ of $b$ shares \+
  I have rendered fractions literally, since there are references to
  the numerator <span lang="zh-Hant">~~「之~~ $a$~~」~~</span>, "$a$ of", and
  the denominator <span lang="zh-Hant">~~「~~$b$ ~~分」~~</span>, "$b$ shares",
  in the lines to follow.
====

<<
  術曰：置三分、五分在右方，之一、之二在左方。
||
  Method saith:
  put .[the] three shares .[and the] five shares on .[the] right;
  .[the] one of .[and the] two of, on .[the] left.
>>

<<
  母互乘子，五分之二得六，三分之一得五，并之，得一十一為實。\
  右方二母相乘，得一十五為法。
||
  .[The] denominators .[are] mutually multiplied with .[the] numerators:
  .[for the] two of five shares .[there] resulteth six,
  .[and for the] one of three shares .[there] resulteth five;
  combining them, resulteth in eleven as .[the] dividend.
  .[The] two denominators .[to the] right, multiplied with each other,
  result in fifteen as .[the] divisor.
>>
====
* In modern notation:
  $$
    \frac{1}{3} + \frac{2}{5}
    = \frac{1 \times 5 + 2 \times 3}{3 \times 5}
    = \frac{11}{15}.
  $$
====

<<
  不滿法，以法命之，即得。
||
  .[The dividend] reacheth not .[the] divisor;
  naming it .[for a fraction] using .[the] divisor, .[we] are done.
>>
====
* 不滿法： .[The dividend] reacheth not .[the] divisor \+
  This is saying that $11 < 15$, i.e.~the fraction $11/15$ is proper
  (so no further division is necessary).
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P1 : ["ii 1"]
    \nav-curr: \P2
    \nav-next: \P3 : ["ii 3"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P2"
][
  sun-tzu-ii-2
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P2}''~~
]

%footer-element
