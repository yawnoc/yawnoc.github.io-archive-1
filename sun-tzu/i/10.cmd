{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/coloured-spans.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P10
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P10](\/ You are viewing \P10)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P10. Volume conversion rates for grain \& rice
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P9 : ["i 9"]
    \nav-curr: \P10
    \nav-next: \P11 : ["i 11"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives __conversion rates__
for trading various types of grain and rice.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[8], \b[147], \c[52066], \d[16]. \+
\d-default
----

<<
  以粟求[r/糲/][b/米/]，\
    三之，五而一。 \+
  以[r/糲/][b/米/]求粟，\
    五之，三而一。 \+
  以[r/糲/][b/米/]求[v/飯/]，\
    五之，二而一。 \+
  以粟[b/米/]求[r/糲/][v/飯/]，\
    六之，四而一。 \+
  以[r/糲/][v/飯/]求[r/糲/][b/米/]，\
    二之，五而一。 \+
  以[g/糳/][b/米/]求[v/飯/]，\
    八之，四而一。
||
  Seeking [r/ coarse /] [b/ grain /] with grain:
    triple it, .[and take] five .[as] one. \+
  Seeking grain with [r/ coarse /] [b/ grain /]:
    quintuple it, .[and take] three .[as] one. \+
  Seeking [r/ .[coarse] /] [v/ rice /] with [r/ coarse /] [b/ grain /]:
    quintuple it, .[and take] two .[as] one. \+
  Seeking [r/ coarse /] [v/ rice /] with [b/ grain /]:
    sextuple it, .[and take] four .[as] one. \+
  Seeking [r/ coarse /] [b/ grain /] with [r/ coarse /] [v/ rice /]:
    double it, .[and take] five .[as] one. \+
  Seeking [g/ .[intricate] /] [v/ rice /] with [g/ intricate /] [b/ grain /]:
    octuple it, .[and take] four .[as] one.
>>
====
* \a[8] erroneously has 米粟求糲米 for 以粟求糲米.

* 粟： grain \+
  As opposed to 
    [r/糲/], [r/"coarse grain"/], or
    [g/糳/], [g/"intricate grain"/],
  to follow.

* [r/糲/]：米不精也； [r/ coarse grain /] \+
  糲，力制切，音勵， \C lai6, \M l(i\)

* 粟[b/米/]： [b/grain /] \+
  This is not a nice paragraph to render into English (hence the colours).
  I am overloading the word "grain" with both
  粟, "grain" (in contrast to
  [r/糲/], [r/"coarse grain"/], and
  [g/糳/], [g/"intricate grain"/])
  and [b/米/], [b/"grain"/],
  i.e.~[b/"uncooked rice"/] (in contrast to
  [v/飯/], [v/"cooked rice"/],
  which I am just calling [v/"rice"/] for brevity).

* \c[52066] erroneously has 绺 for 糳.

* [g/糳/]：精細米也； [g/ intricate grain /] \+
  糳， \C [^ts]ok9 (\pm [_ch]ok9), \M zu(o\) \+

* These are volume conversion rates to be used when trading grain and rice;
  I'm not sure why $6/4$ and $8/4$ haven't been simplified.
  In modern notation:
  $$
    \gdef\vol#1{V(\text{#1})}
    \begin{aligned}
      \vol{coarse grain}  &= \frac{3}{5} \cdot \vol{grain}
        \\[\tallspace]
      \vol{grain} &= \frac{5}{3} \cdot \vol{coarse grain}
        \\[\tallspace]
      \vol{coarse rice} &= \frac{5}{2} \cdot \vol{coarse grain}
        \\[\tallspace]
      \vol{coarse rice} &= \frac{6}{4} \cdot \vol{grain}
        \\[\tallspace]
      \vol{coarse grain} &= \frac{2}{5} \cdot \vol{coarse rice}
        \\[\tallspace]
      \vol{intricate rice} &= \frac{8}{4} \cdot \vol{intricate grain}.
    \end{aligned}
  $$
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P9 : ["i 9"]
    \nav-curr: \P10
    \nav-next: \P11 : ["i 11"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P10"
][
  sun-tzu-i-10
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P10}''~~
]

%footer-element
