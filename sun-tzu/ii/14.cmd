{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P14
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P14](\/ You are viewing \P14)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P14. Area of a square of given circumradius
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P13 : ["ii 13"]
    \nav-curr: \P14
    \nav-next: \P15 : ["ii 15"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing
the __area of square given its circumradius__.
----
----
The relevant unit conversions for area and length are
----
$$
  \begin{aligned}
    1 \unit{yardland~(頃)} &= 100 \unit{acres~(畝)} \\
    1 \unit{acre~(畝)} &= 240 \unit{paces~(步)}^2.
  \end{aligned}
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[36], \b[155], \c[52171], \d[49]. \+
\d-default
----

<<
  今有方田，桑生中央。從角至桑一百四十七步。問為田幾何？
||
  Now there be .[a] square field,
  .[with a] mulberry tree growing .[in the] centre.
  From .[a] corner unto .[the] mulberry tree:
    one hundred .[and] forty-seven paces.
  .[We] ask, how much field be .[this]?
>>

<<
  答曰：一頃八十三畝奇一百八十步。
||
  Answer saith:
    one yardland .[and] eighty-three acres,
    remainder one hundred .[and] eighty paces.
>>
====
* 頃： yardland \+
  K'ing ((頃)), equal to 100~mu ((畝)) or Chinese acres.
  Difficult to render,
  and I have chosen "yardland" because it sounds more natural,
  even though the [imperial oxgang] [oxgang]
  (which is only half an [imperial yardland or virgate] [yardland])
  is closer in size.
  
  @@[oxgang]
    https://en.wikipedia.org/wiki/Oxgang
  @@
  
  @@[yardland]
    https://en.wikipedia.org/wiki/Virgate
  @@
====

<<
  術曰：置角至桑一百四十七步，倍之，得二百九十四步。
||
  Method saith:
  put .[down the] corner unto .[the] mulberry tree,
    one hundred .[and] forty-seven paces.
  Doubling it, resulteth in
    two hundred .[and] ninety-four paces.
>>

<<
  以五乘之，得一千四百七十步。\
  以七除之，得二百一十步，自相乘，得四萬四千一百步。
||
  Multiplying it by five, resulteth in
    one thousand four hundred .[and] seventy paces.
  Dividing it by seven, resulteth in two hundred .[and] ten paces,
  .[which], multiplied with itself, resulteth in
    four myriad .[and] four thousand one hundred paces.
>>

<<
  以二百四十步除之，即得。
||
  Dividing it by two hundred .[and] forty paces, .[we] are done.
>>
====
* In modern notation,
  the area of a square with circumradius (or semi-diagonal)
  $s = 147 \unit{paces}$ is
  $$
    \begin{aligned}
      A
      &\approx \left( 2s \cdot \frac{5}{7} \right)^2 \\[\tallspace]
      &=
        \left( 2 \times 147 \unit{paces} \times \frac{5}{7} \right)^2
          \div
        \frac{240 \unit{paces}^2}{\unit{acre}}
          \\[\tallspace]
      &= 183 \unit{acres} + 180 \unit{paces}^2 \\
      &= 1 \unit{yardland} + 83 \unit{acres} + 180 \unit{paces}^2.
    \end{aligned}
  $$
  Here $\sqrt{2} \approx 7/5$, see [Vol.~I \P5] ["i 5"].
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P13 : ["ii 13"]
    \nav-curr: \P14
    \nav-next: \P15 : ["ii 15"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P14"
][
  sun-tzu-ii-14
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P14}''~~
]

%footer-element
