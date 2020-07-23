{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/coloured-spans.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P4
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P4](\/ You are viewing \P4)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P4. Redistributing fractions for equality
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P3 : ["ii 3"]
    \nav-curr: \P4
    \nav-next: \P5 : ["ii 5"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives a worked example of
__redistributing__ three __fractions for equality__.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[28], \b[153], \c[52139], \d[41]. \+
\d-default
----

<<
  今有三分之一、三分之二、四分之三。問減多益少，幾何而平？
||
  Now there be one of three shares,
  two of three shares .[and] three of four shares.
  .[We] ask, .[in] diminishing .[the] greater .[to] benefit .[the] lesser,
  how much that .[they be] level?
>>
====
* <span lang="zh-Hant">$b$ ~~分之~~ $a$</span>:
    \lit $a$ of $b$ shares \+
  I have rendered fractions literally, since there are references to
  the numerator <span lang="zh-Hant">~~「之~~ $a$~~」~~</span>, "$a$ of", and
  the denominator <span lang="zh-Hant">~~「~~$b$ ~~分」~~</span>, "$b$ shares",
  in the lines to follow.

* 而平： that .[they be] level; \or that .[it be] fair
====

<<
  答曰：減四分之三者[r/二/]，三分之二者[v/一/]，\
  [g/并/]以益三分之一，而各[b/平於一十二分之七/]。
||
  Answer saith:
  that diminished of .[the] three of four shares, .[is] [r/ two /];
  that of .[the] two of three shares, [v/ one /];
  [g/ combined /] to benefit .[the] one of three shares,
  that each .[be] [b/ level at seven of twelve shares /].
>>
====
* In modern notation:
  $$
    \frac{3}{4} - \colr{\frac{2}{12}}
    = \frac{2}{3} - \colv{\frac{1}{12}}
    = \frac{1}{3} + \roundbr{\colg{\frac{2}{12} + \frac{1}{12}}}
    = \colb{\frac{7}{12}}.
  $$

* To see why \sun-tzu's algorithm works,
  it is helpful to first work through the problem once ourselves.
  More generally, consider redistributing the fractions
  $a/A$, $b/B$ and $c/C$ for equality.
  Their mean is
  $$
    m = \frac{L}{3 ABC},
  $$
  where
  $$
    L = aBC + bCA + cAB,
  $$
  so the fractions must be changed by the quantities
  $$
    m - \left( \frac{a}{A}, \frac{b}{B}, \frac{c}{C} \right)
    = \frac{L - (3 aBC, 3 bCA, 3 cAB)}{3 ABC}
  $$
  respectively.
  Of course \sun-tzu did not have the luxury of modern mathematical notation:
====

<<
  術曰：置三分、三分、四分在右方，之一、之二、之三在左方。\
  母互乘子，副并得六十三，置右為平實。
||
  Method saith: put
  .[the] three shares, .[the] three shares .[and the] four shares
    on .[the] right;
  .[the] one of, .[the] two of .[and the] three of, on .[the] left.
  .[The] denominators, mutually multiplied with .[the] numerators,
  combined subsidiarily, result in sixty-three,
  put to .[the] right as .[the] level dividend.
>>
====
* \c[52139] erroneously has 母互乘于 for 母互乘子.

* 平實： level dividend \+
  $L = aBC + bCA + cAB = 63$.

* Altogether:
  $$
    \begin{alignedat}{3.5}
      a &= 1 \qquad & A &= 3 \qquad & aBC &= 12 \\
      b &= 2 \qquad & B &= 3 \qquad & bCA &= 24 \\
      c &= 3 \qquad & C &= 4 \qquad & cAB &= 27 \\ \hline
        &           &   &           &   L &= 63.
    \end{alignedat}
  $$
====

<<
  母相乘，得三十六為法。
||
  .[The] denominators multiplied with each other,
  result in thirty-six as .[the] divisor.
>>
====
* In modern notation:
  $$
    ABC = 3 \times 3 \times 4 = 36.
  $$
====

<<
  以列數三乘未并者及法。
||
  Multiply those not yet combined, and .[the] divisor,
  by .[the] number of rows, three.
>>
====
* 未并者： those not yet combined \+
  These are the individual terms $aBC$, $bCA$ and $cAB$,
  before they were combined subsidiarily to make the level dividend $L$.
  We then obtain
  $$
    \begin{aligned}
      3 aBC &= 36 \\
      3 bCA &= 72 \\
      3 cAB &= 81 \\
      3 ABC &= 108.
    \end{aligned}
  $$
====

<<
  等數得九，約訖。
||
  .[For their] equal quantity .[there] resulteth nine;
  finish reducing .[them].
>>
====
* 等數： equal quantity \+
  Greatest common divisor (GCD) is called an "equal quantity"
  because it is determined by repeated subtraction
  until an equal quantity is obtained (see [\P1] ["ii 1"]).
  In the current example, we have
  $$
    \gcd (L, 3 aBC, 3 bCA, 3 cAB, 3 ABC) = 9,
  $$
  and therefore
  $$
    \begin{aligned}
      \frac{L - (3 aBC, 3 bCA, 3 cAB)}{3 ABC}
      &= \frac{63 \div 9 - (36, 72, 81) \div 9}{108 \div 9} \\[\tallspace]
      &= \frac{7 - (4, 8, 9)}{12} \\[\tallspace]
      &= \frac{(+3, -1, -2)}{12}.
    \end{aligned}
  $$
====

<<
  減四分之三者二，減三分之二者一，并以益三分之一，各平於一十二分之七。
||
  That diminished of .[the] three of four shares,
  .[is] two;
  that diminished of .[the] two of three shares, one;
  combined to benefit .[the] one of three shares,
  each level at seven of twelve shares.
>>


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P3 : ["ii 3"]
    \nav-curr: \P4
    \nav-next: \P5 : ["ii 5"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P4"
][
  sun-tzu-ii-4
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P4}''~~
]

%footer-element
