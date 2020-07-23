{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P7
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P7](\/ You are viewing \P7)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P7. Volume conversions for grain~(3)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P6 : ["ii 6"]
    \nav-curr: \P7
    \nav-next: \P8 : ["ii 8"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of a volume conversion for trading grain
using __cross-multiplication__.
----
----
The relevant unit conversion for capacity is
----
$$
  1 \unit{peck~(斗)} = 10 \unit{quarts~(升)}.
$$
----
See [Vol.~I \P3 (Units of capacity)] ["i 3"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[30], \b[154], \c[52148], \d[43]. \+
\d-default
----

<<
  今有粟四斗五升。問為糳米幾何？ \+
  答曰：二斗一升五分升之三。
||
  Now there be grain, four pecks .[and] five quarts.
  .[We] ask, how much be .[this in] intricate grain? \+
  Answer saith:
    two pecks, one quart, .[and] three fifths of .[a] quart.
>>
====
\c[52148] erroneously has 槃 for 糳, both here and below.
====

<<
  術曰：置粟四十五升。以二約糳米率二十四，得一十二，乘之，得五百四十升為實。
||
  Method saith: put .[down the] grain, forty-five quarts.
  Reducing .[the] intricate grain rate, twenty-four, by two,
  resulteth in twelve;
  multiplying them resulteth in five hundred .[and] forty quarts
  as .[the] dividend.
>>
====
* 以二約： reducing by two \+
  The intricate grain rate~24 here and the (regular) grain rate~50 below
  are reduced by their greatest common divisor, $\gcd (24, 50) = 2$.
====

<<
  以二約粟率五十，得二十五為法。
||
  Reducing .[the] grain rate, fifty, by two,
  resulteth in twenty-five as .[the] divisor.
>>

<<
  除之。不盡，以等數約之，而命分。
||
  Divide them.
  .[For the] remainder, reduce it by .[the] equal quantity,
  and name .[the] fraction.
>>
====
* 不盡，以等數約之：
  .[for the] remainder, reduce it by .[the] equal quantity \+
  The division $540 \div 25$ leaves remainder $15/25$.
  Their "equal quantity" (see [\P1] ["ii 1"])
  is $\gcd (15, 25) = 5$, so that the remainder is simplified to $3/5$.

* In modern notation:
  $$
    \begin{aligned}
      V(\text{intricate grain})
      &=
        \frac{
          V(\text{grain}) \cdot r(\text{intricate grain})
        }{
          r(\text{grain})
        }
          \\[\tallspace]
      &= \frac{45 \unit{quarts} \times 24 \div 2}{50 \div 2} \\[\tallspace]
      &= 21 \tfrac{3}{5} \unit{quarts}.
    \end{aligned}
  $$
  The rates 24~for intricate grain and 50~for (regular) grain
  appear to come from
  《九章算術\.粟米》, "Nine Chapters .[on] Computational Methods: Grain".
  See [\P5 commentary](/sun-tzu/ii/5#commentary).
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P6 : ["ii 6"]
    \nav-curr: \P7
    \nav-next: \P8 : ["ii 8"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P7"
][
  sun-tzu-ii-7
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P7}''~~
]

%footer-element
