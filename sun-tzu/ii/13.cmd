{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P13
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P13](\/ You are viewing \P13)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P13. Area of a circle
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P12 : ["ii 12"]
    \nav-curr: \P13
    \nav-next: \P14 : ["ii 14"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of computing the __area of a circle__.
----
----
The relevant unit conversion between area and length is
----
$$
  1 \unit{acre~(畝)} = 240 \unit{paces~(步)}^2.
$$
----
See [Vol.~I \P1 (Units of length)] ["i 1"].
----


##{#translation}
  Translation
##

----
Chinese source text: \a[34], \b[155], \c[52166], \d[48]. \+
\d-default
----

<<
  今有圓田，周三百步，徑一百步。問得田幾何？
||
  Now there be .[a] circular field,
  of circumference three hundred paces,
  .[and] diameter one hundred paces.
  .[We] ask, how much field resulteth?
>>
----
* Here $\pi \approx 3$, see [Vol.~I \P5] ["i 5"].
----

<<
  答曰：三十一畝奇六十步。
||
  Answer saith: thirty-one acres, remainder sixty paces.
>>
====
* 奇： remainder \+
  奇，音羈， \C kei1, \M j(i-) \+
  To convert area from square paces to acres, mu ((畝)),
  one divides by the conversion factor $240 \unit{paces}^2 / \unit{acre}$,
  called the "acre divisor" below.
  This is why the text refers to a "remainder".

* In modern notation, the area is $31 \unit{acres} + 60 \unit{paces}^2$.
====

<<
  術曰：先置周三百步，半之，得一百五十步。又置徑一百步，半之，得五十步。\
  相乘，得七千五百步。
||
  Method saith:
  first put .[down the] circumference, three hundred paces;
  halving it, resulteth in one hundred .[and] fifty paces.
  Also put .[down the] diameter, one hundred paces;
  halving it, resulteth in fifty paces.
  .[These], multiplied with each other,
  result in seven thousand five hundred paces.
>>

<<
  以畝法二百四十步除之，即得。
||
  Dividing it by .[the] acre divisor,
    two hundred .[and] forty paces,
  .[we] are done.
>>

<<
  又術：周自相乘，得九萬步。以一十二除之，得七千五百步。
||
  Also .[a] method:
  .[the] circumference, multiplied with itself, resulteth in nine myriad paces.
  Dividing it by twelve, resulteth in seven thousand five hundred paces.
>>
====
* \b[155] has 又術曰 for 又術, both here and below.
====

<<
  以畝法除之，得畝數。
||
  Dividing it by .[the] acre divisor,
  resulteth in .[the] number of acres.
>>

<<
  又術：徑自乘，得一萬。以三乘之，得三萬步。四除之，得七千五百步。
||
  Also .[a] method:
  .[the] diameter, multiplied .[with] itself, resulteth in one myriad.
  Multiplying it by three, resulteth in three myriad paces.
  Dividing it .[by] four, resulteth in seven thousand five hundred paces.
>>

<<
  以畝法除之，得畝數。
||
  Dividing it by .[the] acre divisor, resulteth in .[the] number of acres.
>>
====
* In modern notation,
  a circle with circumference $C$ and diameter $d$ has area
  $$
    \frac{C}{2} \cdot \frac{d}{2}
    \approx \frac{C^2}{12}
    \approx \frac{3d^2}{4}.
  $$
  Here $\pi \approx 3$, see [Vol.~I \P5] ["i 5"].
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P12 : ["ii 12"]
    \nav-curr: \P13
    \nav-next: \P14 : ["ii 14"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P13"
][
  sun-tzu-ii-13
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P13}''~~
]

%footer-element
