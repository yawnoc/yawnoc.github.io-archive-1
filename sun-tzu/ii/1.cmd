{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P1
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P1](\/ You are viewing \P1)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P1. Reducing fractions
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: Vol.~II : ["ii"]
    \nav-curr: \P1
    \nav-next: \P2 : ["ii 2"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of simplifying a fraction
using the __subtraction-only__ version of the __Euclidean algorithm__.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[26], \b[153], \c[52130], \d[39]. \+
\d-default
----

<<
  今有一十八分之一十二。問約之得幾何？ \+
  答曰：三分之二。
||
  Now there be twelve eighteenths.
  .[We] ask, reducing it resulteth in how much? \+
  Answer saith: two thirds.
>>
====
* 一十八分之一十二： twelve eighteenths;
    \lit twelve of eighteen shares;
    \or twelve of eighteen portions
====

<<
  術曰：置十八分在下，一十二分在上。\
  副置二位，以少減多，等數得六為法，約之，即得。
||
  Method saith:
  put .[the] eighteen shares below,
  .[and the] twelve shares above.
  Put subsidiarily .[the] two places,
  .[and] diminish .[the] greater by .[the] lesser;
  .[for the] equal quantity .[there] resulteth six as .[the] divisor,
  .[and] reducing them, .[we] are done.
>>
====
* 副： subsidiarily

* 位： places

* 以少減多，等數得六：
    diminish .[the] greater by .[the] lesser;
    .[for the] equal quantity .[there] resulteth six \+
  Here we have the subtraction-only version of the Euclidean algorithm
  for greatest common divisor (GCD):
  $$
    \begin{aligned}
      18 - 12 &= 6 \\
      12 - 6  &= 6.
    \end{aligned}
  $$
  Therefore $\gcd (12, 18) = 6$, and we have
  $$
    \frac{12}{18} = \frac{12 \div 6}{18 \div 6} = \frac{2}{3}.
  $$
====


##{#commentary}
  Extended commentary
##

----
In my opinion, this paragraph's description
of the __subtraction-only Euclidean algorithm__
is rather lacking in clarity.
In particular, there is no explicit instruction
to **repeat** the subtraction **until** you get the equal quantity~6.
----

----
A much better description of 約分術, ".[the] Method of Reducing Fractions",
is found in the separate text 《九章算術》,
"Nine Chapters .[on] Computational Methods",
in the chapter 〈方田〉, 'Rectangular Fields',
which has the same problem of [simplifying 12/18]
as well as another, [simplifying 49/91].
I think it is informative to include a translation of an excerpt here.
----

@@[simplifying 12/18]
  https://ctext.org/nine-chapters/fang-tian#n51071
@@
@@[simplifying 49/91]
  https://ctext.org/nine-chapters/fang-tian#n51073
@@

----
The source text for this excerpt is from
[《四部叢刊初編》 (ctext.org library)] [四部叢刊初編],
and the bracketed portions are
inline two-column annotations by [Liu Huei ((劉徽))] [劉徽].
The inserted punctuation is my own.
----

@@[四部叢刊初編]
  https://ctext.org/library.pl?if=en&file=77747&page=13
@@
@@[劉徽]
  https://en.wikipedia.org/wiki/Liu_Hui
@@

----
Note that this excerpt is **not** a part
of \sun-tzu's Computational Classic:
----

<<
  今有十八分之十二。問約之得幾何？ \+
  答曰：三分之二。
||
  Now there be twelve eighteenths.
  .[We] ask, reducing it resulteth in how much? \+
  Answer saith: two thirds.
>>

<<
  又有九十一分之四十九。問約之得幾何？ \+
  答曰：十三分之七。
||
  Also there be forty-nine ninety-firsts.
  .[We] ask, reducing it resulteth in how much? \+
  Answer saith: seven thirteenths.
>>

<<
  約分\
    （按：約分者，物之數量不可悉全，必以分言之。分之為數，繁則難用。\
    設有四分之二者。繁而言之，亦可為八分之四；約而言之，則二分之一也。\
    雖則異辭，至於為數，亦同歸爾。\
    法實相推，動有參差，故為術者，先治諸分。）\
  術曰：
||
  .[The] Method of Reducing Fractions
    (Note: Reducing Fractions---
    .[when a] number of objects cannot .[be] completely whole,
    .[we] must speak of them using fractions.
    .[A] fraction being .[a] quantity, .[if] complicated,
    .[is] difficult .[to] utilise.
    Suppose there be two fourths.
    Complicating .[it] in speaking of it, .[it] may also be four eighths;
    reducing .[it] in speaking of it, one half.
    Although different .[in their] terms,
    as to .[the] quantities .[they] are,
    .[these do] return .[the] same .[value].
    Divisors .[and] dividends .[in] calculation with each other,
    have unevenness .[in their] motions;
    therefore .[we] perform .[the] method,
    first administering it unto .[the] fractions.)
  saith:
>>
====
* 約： reducing; \or simplifying

* 全： whole; \or intact

* 動有參差： have unevenness .[in their] motions \+
  This is a literal rendering.
  I think Liu Huei ((劉徽)) is trying to say that
  different representations of fractions lead to inconsistencies,
  so first reduce them before doing any other calculations.

* 諸 \+
  Contraction of 之於 (I think).
====

<<
  可半者半之。
||
  Those which can .[be] halved: halve them.
>>

<<
  不可半者，副置分母、子之數，以少減多，更相減損，求其等也。
||
  Those which cannot .[be] halved:
  put subsidiarily .[the] quantities of
    .[the] denominator .[and the] numerator
  of .[the] fraction.
  Diminish .[the] greater by .[the] lesser, .[and]
  further subtract .[them] from each other,
  seeking their .[being] equal.
>>

<<
  以等數約之。
  （等數約之，即除也。其所以相減者，皆等數之重疊。故以等數約之。）
||
  Reduce them using .[the] equal quantity.
  (.[To] reduce them .[with the] equal quantity, is .[to] divide .[them].
  Those of them which .[have been] mutually subtracted,
  .[are] all repeated pilings of .[the] equal quantity.
  Therefore .[we] use .[the] equal quantity .[to] reduce them.)
>>
====
* 重疊： \lit repeated pilings; \or overlappings \+
  I think this means "multiples".
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: Vol.~II : ["ii"]
    \nav-curr: \P1
    \nav-next: \P2 : ["ii 2"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P1"
][
  sun-tzu-ii-1
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P1}''~~
]

%footer-element
