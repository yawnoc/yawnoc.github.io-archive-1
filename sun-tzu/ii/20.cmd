{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/coloured-spans.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P20
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P20](\/ You are viewing \P20)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P20. Rod calculus square root: $\sqrt{420000}$
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P19 : ["ii 19"]
    \nav-curr: \P20
    ||||{.next}
    ||||
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example
of the __rod calculus square root__ algorithm.
----
----
For a fully annotated and diagrammed walkthrough
of \sun-tzu's square root algorithm,
see the [previous paragraph (\P19)] ["ii 19"],
whose level of detail I will not be repeating here.
----


##{#translation}
  Translation
##


----
Chinese source text: \a[42], \b[156], \c[52189], \d[54]. \+
\d-default
----

<<
  今有積三萬五千步。問為圓幾何？
||
  Now there be area, three myriad .[and] five thousand paces.
  .[We] ask, how much .[by circumference] be .[this a] circle?
>>

<<
  答曰：六百四十八步一千二百九十六分步之九十六。
||
  Answer saith:
    six hundred .[and] forty-eight paces
    .[and] ninety-six
    one thousand, two hundred .[and] ninety-sixths
    of .[a] pace.
>>

<<
  術曰：置積三萬五千步。以一十二乘之，得四十二萬為[b/實/]。
||
  Method saith:
  put .[down the] area, three myriad .[and] five thousand paces.
  Multiplying it by twelve,
  resulteth in forty-two myriad as [b/ .[the] dividend /].
>>
====
* \c[52189] has 四十二萬步 for 四十二萬.

* In modern notation,
  but taking $\pi \approx 3$ (so that $4\pi \approx 12$)
  as per [Vol.~I \P5] ["i 5"],
  the circumference of a circle of area $A = 35000 \unit{paces}^2$ is
  $$
    \begin{aligned}
      C &\approx \sqrt{12 A} \\
        &= \sqrt{420000} \unit{paces}.
    \end{aligned}
  $$
  The balance of this paragraph involves extracting the square root of~420000.
  For a fully annotated and diagrammed walkthrough
  of \sun-tzu's square root algorithm,
  see the [previous paragraph (\P19)] ["ii 19"],
  whose level of detail I will not be repeating here.
====

<<
  次[r/借一算為下法/]。[r/步之，超一位，至百而止/]。
||
  Next [r/ borrow one rod .[to] be .[the] lower divisor /].
  [r/
    Step it .[forth], jumping over one place,
    unto .[the] hundreds and stop
  /].
>>

<<
  [g/上商置六百/]於實之上。
||
  [g/ .[For the] upper quotient, put six hundred/] above .[the] dividend.
>>
====
* \a[42] erroneously has 餘於 for 於.
====

<<
  副[v/置六萬/]於實之下，下法之上，名為[v/方法/]。
||
  Subsidiarily [v/ put six myriad /] below .[the] dividend,
  .[and] above .[the] lower divisor;
  .[its] name be [v/ .[the] upright divisor /].
>>

<<
  [g/命上商六百/][b/除實/]。
||
  [g/ Name .[the] upper quotient's six hundred /],
  [b/ .[and] remove .[this] from .[the] dividend /].
>>

<<
  除訖，[v/倍方法/]。
||
  .[The] removal finished, [v/ double .[the] upright divisor /].
>>

<<
  [v/方法一退/]，[r/下法再退/]。
||
  [v/ .[The] upright divisor retreateth once /];
  [r/ .[the] lower divisor retreateth again /].
>>

<<
  復[g/置上商四十/]，以次前商。
||
  [g/ Put /] again [g/ .[for the] upper quotient forty /],
  to be next .[after the] quotient .[digit] before.
>>

<<
  副[v/置四百/]於方法之下，下法之上，名為[v/廉法/]。
||
  Subsidiarily [v/ put four hundred /] below .[the] upright divisor,
  .[and] above .[the] lower divisor;
  .[its] name be [v/ .[the] incorrupt divisor /].
>>

<<
  [v/方、廉各命/][g/上商四十/]，以[b/除實/]。
||
  [v/ Each of .[the] upright .[and the] incorrupt nameth /]
  [g/ .[the] upper quotient's forty /],
  to be [b/ removed from .[the] dividend /].
>>
====
* \a[42] and \c[52189] are missing 四十 after 上商.
====

<<
  除訖，[v/倍廉法/]，從方法。
||
  .[The] removal finished, [v/ double .[the] incorrupt divisor /],
  .[which] followeth .[the] upright divisor.
>>

<<
  [v/方法一退/]，[r/下法再退/]。
||
  [v/ .[The] upright divisor retreateth once /];
  [r/ .[the] lower divisor retreateth again /].
>>

<<
  復[g/置上商八/]，次前商。
||
  [g/ Put /] again [g/ .[for the] upper quotient eight /],
  next .[after the] quotient .[digit] before.
>>

<<
  副[v/置八/]於方法之下，下法之上，名為[v/隅法/]。
||
  Subsidiarily [v/ put eight /] below .[the] upright divisor,
  .[and] above .[the] lower divisor;
  .[its] name be [v/ .[the] honest divisor /].
>>

<<
  [v/方、廉、隅各命/][g/上商八/]，以[b/除實/]。
||
  [v/ Each of .[the] upright, .[the] incorrupt .[and the] honest nameth /]
  [g/ .[the] upper quotient's eight /],
  to be [b/ removed from .[the] dividend /].
>>
====
* \c[52189] erroneously has 上前 for 上商八.
====

<<
  除訖，[v/倍隅法/]，從方法。
||
  .[The] removal finished, [v/ double .[the] honest divisor /],
  .[which] followeth .[the] upright divisor.
>>

<<
  [g/上商得六百四十八/]，\
  [v/下法得一千二百九十六/]，\
  [b/不盡九十六/]。
||
  [g/ .[The] upper quotient resulteth in six hundred .[and] forty-eight /],
  [v/
    .[and the] lower divisors result in
    one thousand, two hundred .[and] ninety-six
  /],
  [b/ .[with] remainder ninety-six /].
>>
====
* \a[42] is missing 得 after 上商,
  and erroneously has 一千二百九十七 for 一千二百九十六 both here
  and in the line to follow.
====

<<
  是為方[g/六百四十八/]步[v/一千二百九十六分/]步之[b/九十六/]。
||
  This be .[a] circumference of
    [g/ six hundred .[and] forty-eight /] paces .[and]
      [b/ ninety-six /]
      [v/ one thousand, two hundred .[and] ninety-sixths /]
    of .[a] pace.
>>


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P19 : ["ii 19"]
    \nav-curr: \P20
    ||||{.next}
    ||||
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P20"
][
  sun-tzu-ii-20
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P20}''~~
]

%footer-element
