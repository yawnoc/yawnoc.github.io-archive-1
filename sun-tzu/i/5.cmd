{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P5
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P5](\/ You are viewing \P5)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P5. $\pi \approx 3$, $\sqrt{2} \approx 7/5$
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P4 : ["i 4"]
    \nav-curr: \P5
    \nav-next: \P6 : ["i 6"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives the __approximate values__ $3$ for $\pi$
and $7/5$ for $\sqrt{2}$.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[6], \b[147], \c[52061], \d[13]. \+
\d-default
----

<<
  周三徑一；方五邪七。 \+
  見邪求方，五之，七而一； \+
  見方求邪，七之，五而一。
||
  .[The] circumference three: .[the] diameter one.
  .[The] square's .[edge] five: .[the] diagonal seven. \+
  Seeing .[the] diagonal .[and] seeking .[the] square's .[edge],
    quintuple it, .[and take] seven .[as] one. \+
  Seeing .[the] square's .[edge] .[and] seeking .[the] diagonal,
    septuple it, .[and take] five .[as] one.
>>
====
* 邪： diagonal; \lit incline \+
  Here, 邪 is interchangeable with 斜.

* 五之： [quintuple] it \+
  Multiply by five.
  
  @@[quintuple]
    https://en.wiktionary.org/wiki/quintuple#Verb
    Verb
  @@

* 七而一： .[take] seven .[as] one \+
  Divide by seven.
====


[svg-styles/
  text {
    \svg-style:text-declarations
  }
  \svg-style:maths-font-rulesets
  circle, line {
    \svg-style:stroke-declarations
    fill: none;
  }
/]


##{#commentary}
  Extended commentary
##

----
Here, 3 and 7/5 are used as approximations of $\pi$ and $\sqrt{2}$,
which arise in the geometry of the circle and square respectively.
----

----
For a circle of circumference $C$ and diameter $d$ we have
----
$$
  \frac{C}{d} = \pi \approx \frac{3}{1}.
$$

<##
                     Circumference and diameter
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    d           diameter                                2
    xleft       left x pos                             -1.1
    xright      right x pos                             1.1
    w           total width                             2.2
    ytop        top y pos                              -1.5
    ybottom     bottom y pos                            1.1
    h           total height                            2.6
  ***********************************************************************
##>

{: \maths-italic : class="maths-italic" :}
{: \font-size : font-size="0.4" :}

||||{.centred-block}
<svg width="120px" height="100%" viewBox="-1.1 -1.5 2.2 2.6"
  \accessible-svg-attributes[circle-diagram-title]\
>
  [accessible-svg-title/circle-diagram-title
    Diagram of a circle of circumference C and diameter d.
  /]
  [accessible-svg-content/
    <## Circumference ##>
    <circle r = "1"/>
    <text \maths-italic x="0" y="-1" \font-size dy="-0.25em">C</text>
    <## Diameter ##>
    <line x1="-1" y1="0" x2="1" y2="0"/>
    <text \maths-italic x="0" y="0" \font-size dy="-0.25em">d</text>
  /]
</svg>
||||

----
For a square of side length $L$ and diagonal $D$ we have
----
$$
  \frac{D}{L} = \sqrt{2} \approx \frac{7}{5},
$$
----
so
----
$$
  \begin{aligned}
    L & \approx \frac{5D}{7} \\[\tallspace]
    D & \approx \frac{7L}{5}.
  \end{aligned}
$$

<##
                     Square's edge and diagonal
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    l           square's edge                           2
    xleft       left x pos                             -1.1
    xright      right x pos                             1.1
    w           total width                             2.2
    ytop        top y pos                              -1.1
    ybottom     bottom y pos                            1.5
    h           total height                            2.6
  ***********************************************************************
##>

||||{.centred-block}
<svg width="120px" height="100%" viewBox="-1.1 -1.1 2.2 2.6"
  \accessible-svg-attributes[square-diagram-title]\
>
  [accessible-svg-title/square-diagram-title
    Diagram of a square of side length L and diagonal D.
  /]
  [accessible-svg-content/
    <## Square ##>
    <line x1="-1" y1="-1" x2="1" y2="-1"/>
    <line x1="1" y1="-1" x2="1" y2="1"/>
    <line x1="1" y1="1" x2="-1" y2="1"/>
    <line x1="-1" y1="1" x2="-1" y2="-1"/>
    <## Square's edge ##>
    <text \maths-italic x="0" y="1" \font-size dy="0.9em">L</text>
    <## Diagonal ##>
    <line x1="-1" y1="1" x2="1" y2="-1"/>
    <text \maths-italic x="0" y="0" \font-size dx="-0.5em">D</text>
  /]
</svg>
||||



{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P4 : ["i 4"]
    \nav-curr: \P5
    \nav-next: \P6 : ["i 6"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P5"
][
  sun-tzu-i-5
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P5}''~~
]

%footer-element
