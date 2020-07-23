{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P5
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P5](\/ You are viewing \P5)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P5. Volume conversions for grain~(1)
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P4 : ["ii 4"]
    \nav-curr: \P5
    \nav-next: \P6 : ["ii 6"]
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
Chinese source text: \a[30], \b[153], \c[52142], \d[42]. \+
\d-default
----

<<
  今有粟一斗。問為糲米幾何？ \+
  答曰：六升。
||
  Now there be grain, one peck.
  .[We] ask, how much be .[this in] coarse grain? \+
  Answer saith: six quarts.
>>
====
* \c[52142] erroneously has 糯米 for 糲米.
====

<<
  術曰：置粟一斗，十升。\
  以糲米率三十乘之，得三百升為實。以粟率五十為法，除之，即得。
||
  Method saith: put .[down the] grain, one peck, .[or] ten quarts.
  Multiplying it by .[the] coarse grain rate, thirty,
  resulteth in three hundred quarts as .[the] dividend.
  Use .[the] grain rate, fifty, as .[the] divisor,
  .[and] dividing them, .[we] are done.
>>
====
* In modern notation, with $V$ for volume and $r$ for rate:
  $$
    \begin{aligned}
      V(\text{coarse grain})
      &=
        \frac{
          V(\text{grain}) \cdot r(\text{coarse grain})
        }{
          r(\text{grain})
        }
          \\[\tallspace]
      &= \frac{10 \unit{quarts} \times 30}{50} \\[\tallspace]
      &= 6 \unit{quarts}.
    \end{aligned}
  $$
====


##{#commentary}
  Extended commentary
##

----
Here we have cross-multiplication.
[Vol.~I \P10] ["i 10"] already gave
a grain-to-coarse-grain conversion rate of $3/5$,
so it appears strange that here \sun-tzu uses $30/50$.
----

----
I believe the rates~30 and~50 come from a separate text,
the chapter [〈粟米〉, 'Grain'] [粟米],
of 《九章算術》, "Nine Chapters .[on] Computational Methods".
In this text, cross-multiplication is called 今有術,
the "Method of Now There Be",
after the incipit "now there be" in all grain conversion problems.
I think it is informative to include a translation of an excerpt here.
----

@@[粟米]
  https://ctext.org/nine-chapters/su-mi
@@

----
The source text for this excerpt is from
[《四部叢刊初編》 (ctext.org library)] [四部叢刊初編].
Note that this excerpt is **not** a part of \sun-tzu's Computational Classic: 
----

@@[四部叢刊初編]
  https://ctext.org/library.pl?if=en&file=77747&page=54
@@

<<
  粟米之法：\
  粟率五十；\
  糲米三十；\
  粺米二十七；\
  糳米二十四；\
  御米二十一；……
||
  .[The] Method of Grain:
  .[the] grain rate .[be] fifty;
  coarse grain, thirty;
  fine grain, twenty-seven;
  intricate grain, twenty-four;
  poppy seed, twenty-one; ...
>>
<<
  今有術曰：以所有數乘所求率為實，以所有率為法，實如法而一。
||
  .[The] Method of Now There Be saith:
  use .[the] quantity of that there be
    times .[the] rate of that sought
    as .[the] dividend,
  .[and] use .[the] rate of that there be
    as .[the] divisor.
  .[Take the] dividend, as .[if the] divisor .[were] one.
>>
====
* In modern notation, with $V$ for volume and $r$ for rate:
  $$
    V(\text{sought}) =
      \frac{
        V(\text{there be}) \cdot r(\text{sought})
      }{
        r(\text{there be})
      }.
  $$
====


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P4 : ["ii 4"]
    \nav-curr: \P5
    \nav-next: \P6 : ["ii 6"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P5"
][
  sun-tzu-ii-5
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P5}''~~
]

%footer-element
