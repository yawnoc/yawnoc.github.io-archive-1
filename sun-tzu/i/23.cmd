{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P23
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P23](\/ You are viewing \P23)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P23. Results of multiplication \& division: multiples of~1,
        and all multiples of~9 through~1 combined
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P22 : ["i 22"]
    \nav-curr: \P23
    \nav-next: \P24 : ["i 24"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
\P15 through \P22 gave the results of multiplications and divisions
of the form
----
$$
  \begin{aligned}
    (m n) \times (m n) &= m^2 n^2 \\
    (m^2 n^2) \div m &= m n^2
  \end{aligned}
$$
----
along with the result of the division
----
$$
  \Bigl[ n \times n + (n - 1) \times n + \dots + 1 \times n \Bigr] ^ 2
    \div
  n.
$$
----
This paragraph gives the multiplication corresponding to $m = n = 1$,
before giving the sum of all single-digit products of the form $m \times n$,
the result of which is used in its own example of multiplication and division.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[20], \b[151], \c[52117], \d[32]. \+
\d-default
----

<<
  一一如一，自相乘，得一。一乘不長。
||
  One one .[is] as one, .[which], multiplied with itself, resulteth in one.
  Multiplying .[by] one augmenteth not.
>>
====
* 長： augmenteth \+
  長，上聲， \C ch(oe)ng2, \M zh(av)ng
====

<<
  右從九九至一一，總成一千一百五十五，自相乘，得一百三十三萬四千二十五。\
  九人分之，人得一十四萬八千二百二十五。
||
  From nine nines unto one one above:
  .[the] total becometh one thousand, one hundred .[and] fifty-five,
  .[which], multiplied with itself,
  resulteth in
    one hundred .[and] thirty-three myriad, four thousand .[and] twenty-five.
  .[With] nine men sharing it,
  .[each] man receiveth
    fourteen myriad, eight thousand, two hundred .[and] twenty-five.
>>
====
* \c[52117] erroneously has 一百十三萬 for 一百三十三萬.

* In modern notation:
  $$
    \begin{gathered}
      \begin{alignedat}{2}
        9 \times 9 & + 8 \times 9 +{} & \dots & + 1 \times 9 \\
                   & + 8 \times 8 +{} & \dots & + 1 \times 8 \\[1ex]
                   &                  & \ddots \\
                   &                  &       & + 1 \times 1
        = 1155
      \end{alignedat} \\
      \begin{aligned}
        1155 \times 1155 &= 1334025 \\
        \quad 1334025 \div 9 &= 148225.
      \end{aligned}
    \end{gathered}
  $$
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P22 : ["i 22"]
    \nav-curr: \P23
    \nav-next: \P24 : ["i 24"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P23"
][
  sun-tzu-i-23
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P23}''~~
]

%footer-element
