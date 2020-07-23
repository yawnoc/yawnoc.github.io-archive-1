{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P9
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P9](\/ You are viewing \P9)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P9. Rod calculus: division algorithm
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P8 : ["i 8"]
    \nav-curr: \P9
    \nav-next: \P10 : ["i 10"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph describes the algorithm for __dividing two integers__
represented using rod numerals.
For a brief description of rod numerals,
see [\P7 commentary](/sun-tzu/i/7#commentary).
----


##{#translation}
  Translation
##

----
Chinese source text: \a[8], \b[147], \c[52065], \d[15]. \+
\d-default
----

<<
  凡除之法，與乘正異。 \+
  乘得在中央，除得在上方。
||
  .[The] method of all division, .[is] directly opposite to multiplication. \+
  .[The] result of multiplication .[is put] in .[the] middle;
  .[the] result of division, in .[the] above.
>>
====
* 異： opposite; \lit different
====

<<
  假令六為法，百為實。
||
  Suppose .[we] make six be .[the] divisor,
  .[and an] hundred be .[the] dividend.
>>
====
* 實 and 法 are jargon terms for dividend and divisor:
  $$
    \frac{\text{實}}{\text{法}} = \frac{\textq{dividend}}{\textq{divisor}}.
  $$
====

<<
  以六除百，當進之二等，令在正百下； \+
  以六除一，則法多而實少，不可除，故當退就十位。
||
  .[To] divide .[an] hundred by six,
  .[we] ought to advance it two ranks,
  making .[it] be directly below .[the] hundred; \+
  .[now] dividing one by six,
  .[the] divisor .[is] more and .[the] dividend less:
  .[it] cannot divide;
  therefore .[we] ought to retreat .[and] assume .[the] tens place.
>>
====
* 在正 \+
  Like Cantonese 喺正, hai2 cheng3.

* 不可除 \+
  The primary meaning of 除, here "divide", is "remove".
  Division is thought of as repeated removal of the divisor
  (in analogy to multiplication being repeated addition).
  Therefore 則法多而實少，不可除 can be rendered
  ".[the] divisor .[is] more and .[the] dividend less:
  .[it] cannot .[be] removed".

* 進, "advance", means move to the left,
  while 退, "retreat", means move to the right.
  Here the first step of the division $100 \div 6$ is described,
  but a full example of the division algorithm does not appear
  until [\P14] ["i 14"].
  Since it would be instructive to see the full algorithm,
  I provide an animation here ([link to source code]):
  
  ||||{.centred-block}
    ![Animation for \sun-tzu division: 100 divided by 6](
      /sun-tzu/code/divide-100-6.gif
    )
  ||||
  
  @@[link to source code]
    /sun-tzu/code/animations
  @@
====

<<
  以法除實，言一六而折百為四十，故可除。
||
  .[Now] dividing .[the] dividend by .[the] divisor:
  one six .[is six] and reduceth .[the] hundred .[to] become forty;
  therefore .[it] can divide.
>>
====
* \c[52065] erroneously has 四十七 for 四十.
====

<<
  若實多法少，自當百之，不當復退。
||
  If .[the] dividend .[be] more .[and the] divisor less,
  .[we] naturally ought to centuple it,
  .[and] ought not retreat back.
>>
====
* In other words, if a three-digit number is being divided
  by six and the first digit is greater than six,
  then keep the six advanced to the hundreds;
  don't retreat to the tens.
====

<<
  故或步法十者置於十位，百者置於百位。
||
  Therefore if .[we have] stepped .[the] divisor .[unto the]
  tens, put .[the result]
  in .[the] tens place;
  .[if], .[unto the] hundreds,
  put .[the result] in .[the] hundreds place.
>>

<<
  （上位有空絕者，法退二位。）
||
  (.[If among the] upper places there be .[an] empty,
  disconnected one, .[the] divisor .[shall be] retreated two places.)
>>
====
* This line I have bracketed for it is an inline annotation
  by Li Ch'un-f(e^)ng ((李淳風))~_et~al._,
  written in two columns of smaller characters which take up
  half the width of the normal characters;
  see \d[15].

* \b[147] has 頭位 for 上位.

* \a[8] erroneously has 二法 for 二位.
====

<<
  餘法皆如乘時。
||
  All .[the] remainder of .[the] method .[is] as when multiplying.
>>

<<
  實有餘者，以法命之，以法為母，實餘為子。
||
  .[If the] dividend hath .[a] remainder,
  name it .[for a fraction] using .[the] divisor:
  use .[the] divisor as .[the] denominator,
  .[and the] dividend remainder as .[the] numerator.
>>
====
* 命： name; \or designate

* In other words, if you get a remainder $r$ after dividing by $d$,
  "name $r$ .[for a fraction] using $d$",
  i.e.~form the fraction $\dfrac{r}{d}$.
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P8 : ["i 8"]
    \nav-curr: \P9
    \nav-next: \P10 : ["i 10"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P9"
][
  sun-tzu-i-9
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P9}''~~
]

%footer-element
