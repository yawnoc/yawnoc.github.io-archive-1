{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P14
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P14](\/ You are viewing \P14)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P14. Rod calculus division: $6561 \div 9$
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P13 : ["i 13"]
    \nav-curr: \P14
    \nav-next: \P15 : ["i 15"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a fully worked example
of the __rod calculus division__ algorithm described in [\P9] ["i 9"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[10], \b[148], \c[52074], \d[18]. \+
\d-default
----

<<
  六千五百六十一，九人分之，問人得幾何？ \+
  答曰：七百二十九。
||
  Six thousand, five hundred .[and] sixty-one:
  .[with] nine men sharing it,
  .[we] ask, how much receiveth .[each] man? \+
  Answer saith: seven hundred .[and] twenty-nine.
>>
====
* 人： (generic) man; \or person

* In modern notation:
  $$
    6561 \div 9 = 729.
  $$
====

<<
  術曰：先置六千五百六十一於中位為實，下列九人為法。
||
  Method saith:
  first put six thousand, five hundred .[and] sixty-one
  upon .[the] middle places as .[the] dividend,
  .[and] below display .[the] nine men as .[the] divisor.
>>

<<
  上位置七百，以上七呼下九，七九六十三，即除中位六千三百。
||
  .[In the] upper places put seven hundred,
  .[and] calling .[the] lower nine with .[the] upper seven:
  seven nines .[are] sixty-three,
  that is, remove from .[the] middle places six thousand three hundred.
>>
====
* \b[148] has 上頭位置七百 for 上位置七百.
====

<<
  退下位一等，即上位置二十，以上二呼下九，二九十八，即除中位一百八十。
||
  Retreat .[the] lower place .[by] one rank,
  then .[in the] upper places put twenty,
  .[and] calling .[the] lower nine with .[the] upper two:
  two nines .[are] eighteen,
  that is, remove from .[the] middle places one hundred .[and] eighty.
>>
====
* \b[148] has 二九一十八 for 二九十八.
====

<<
  又更退下位一等，即上位更置九，即以上九呼下九，九九八十一，即除中位八十一。
||
  And retreat again .[the] lower place .[by] one rank,
  then .[in the] upper places put further .[a] nine,
  then calling .[the] lower nine with .[the] upper nine:
  nine nines .[are] eighty-one,
  that is, remove from .[the] middle places eighty-one.
>>
====
* 更： again; also further \+
  更，去聲， \C kang3, \M g(e\)ng
====

<<
  中位並盡，收下位。上位所得即人之所得。
||
  .[The] middle places .[now] all exhausted, put away .[the] lower place.
  That which resulteth .[in the] upper places is that received of .[each] man.
>>
====
* \c[52074] erroneously has 邬 for 並, both here and in 並準此 below.

* 並：皆也； all

* \b[148] has 頭位所得 for 上位所得.

* In animated form ([link to source code]):
  
  ||||{.centred-block}
    ![Animation for \sun-tzu division: 6561 divided by 9](
      /sun-tzu/code/divide-6561-9.gif
    )
  ||||
  
  @@[link to source code]
    /sun-tzu/code/animations
  @@
====

<<
  自八八六十四至一一如一，並準此。
||
  From eight eights .[are] sixty-four unto one one .[is] as one:
  all according to this.
>>
====
* I think this is saying that the same procedures as above
  are used to compute
  $$
    \begin{alignedat}{3}
      8 \times 8 &= 64;
        & \quad 64 \times 64 &= 4096;
        & \quad 4096 \div 8 &= 512 \\
      7 \times 7 &= 49;
        & \quad 49 \times 49 &= 2401;
        & \quad 2401 \div 7 &= 343 \\
        & & & \text{etc.}
    \end{alignedat}
  $$
  in the paragraphs to follow.
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P13 : ["i 13"]
    \nav-curr: \P14
    \nav-next: \P15 : ["i 15"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P14"
][
  sun-tzu-i-14
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P14}''~~
]

%footer-element
