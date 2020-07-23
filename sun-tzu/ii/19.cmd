{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/coloured-spans.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~II" 《孫子算經\.卷中》 \P19
  %date-created 2019-06-09
  %date-modified 2020-07-19
  \resources:maths
  %css
    li > ul {
      margin: 0.3em 0;
    }
    ol > li {
      margin-top: 1em;
    }
    .centred-block {
      margin: -1em 0 3.5em;
    }
    .keyword {
      display: inline-block;
      font-size: large;
      font-variant: small-caps;
      margin: 0.2em;
      margin-left: 0;
    }
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [II] ["ii" Volume~II]
*> [\P19](\/ You are viewing \P19)
* \header-link:cite
====]]


#
  《孫子算經\.卷中》 \+
  "\sun-tzu's Computational Classic: Volume~II" \+
  \P19. Rod calculus square root: $\sqrt{234567}$
#

{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P18 : ["ii 18"]
    \nav-curr: \P19
    \nav-next: \P20 : ["ii 20"]
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
In my opinion this is the most sophisticated piece of mathematics
in the entirety of \sun-tzu's Computational Classic,
which is why I have provided a fully annotated and diagrammed walkthrough,
along with a pseudocode summary in the [Extended commentary](#commentary).
----


[svg-styles/
  text {
    \svg-style:text-declarations
  }
  \svg-style:text-colour-rulesets
  \svg-style:maths-font-rulesets
  path.step {
    \svg-style:stroke-declarations
    fill: none;
  }
  rect.border {
    \svg-style:stroke-declarations
    fill: none;
    stroke: grey;
  }
  \svg-style:stroke-colour-rulesets
/]

s{: \step : class="step" :}
s{: \border : class="border" :}

w{%
  \\maths
    [-](?P<type> italic | regular)
    [-](?P<colour_letter> [rgbv] )
%
  class="maths-\g<type> colour-\g<colour_letter>"
%}

w{%
  \\(?P<colour_letter> [rgbv] )
%
  class="colour-\g<colour_letter>"
%}

w{: \maths-italic : class="maths-italic" :}

w{:: \font-size:subscript :: font-size="0.5" ::}
w{:: \font-size:normal :: font-size="0.8" ::}

w{: \arrowhead : marker-end="url(#arrowhead)" :}

<##
  For the square root algorithm SVGs:
    Roman variable names shall be at x = -3;
    Chinese names shall be at x = -1;
    Digits shall at x = 1, 2, 3, ..., 6.
##>


##{#translation}
  Translation
##


----
Chinese source text: \a[40], \b[156], \c[52186], \d[52]. \+
\d-default
----


<<
  今有積二十三萬四千五百六十七步。問為方幾何？
||
  Now there be area,
  twenty-three myriad, four thousand, five hundred .[and] sixty-seven paces.
  .[We] ask, how much .[by edge] be .[this a] square?
>>


<<
  答曰：四百八十四步九百六十八分步之三百一十一。
||
  Answer saith:
    four hundred .[and] eighty-four paces
    .[and] three hundred .[and] eleven
    nine hundred .[and] sixty-eighths
    of .[a] pace.
>>
====
* Here we have an algorithm for computing the square root,
  in this instance giving
  $$
    \sqrt{234567 \unit{paces}^2} \approx 484 \tfrac{311}{968} \unit{paces}.
  $$
====


<<
  術曰：[b/置積/]二十三萬四千五百六十七步為[b/實/]。
||
  Method saith: [b/ put .[down the] area /],
  twenty-three myriad, four thousand, five hundred .[and] sixty-seven paces,
  as [b/ .[the] dividend /].
>>
====
* The radicand is called the [b/ __dividend__~(實) /],
  $$
    \colb{d} := \colb{234567}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -0.25 10.5 2"
    \accessible-svg-attributes[put-down-the-area-title]\
  >
    [accessible-svg-title/put-down-the-area-title
      "Put down the area" diagram.
      Put down the dividend 234567.
    /]
    [accessible-svg-content/
      <## d ##>
      <text \maths-italic-b x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text \b x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 234567 ##>
      <text \b x="1" y="1" \font-size:normal>2</text>
      <text \b x="2" y="1" \font-size:normal>3</text>
      <text \b x="3" y="1" \font-size:normal>4</text>
      <text \b x="4" y="1" \font-size:normal>5</text>
      <text \b x="5" y="1" \font-size:normal>6</text>
      <text \b x="6" y="1" \font-size:normal>7</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="0" width="9" height="1.5"/>
    /]
  </svg>
  ||||
  
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
====
* 超：跳也； jumping over; \or skipping \+
  Taking double steps, so that 100 is in fact 10000.

* Since the number of digits of the radicand is
  $$
    N := \lfloor \log_{10} d \rfloor + 1 = 6,
  $$
  the number of digits of the integer part of its square root is
  $$
    n := \left\lceil \frac{N}{2} \right\rceil = 3.
  $$
  We then take $n - 1 = 2$ double steps
  for the [r/ __lower divisor__~(下法) /]
  $$
    \colr{L} := (10 ^ {n - 1}) ^ 2 = \colr{10^4}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -0.25 10.5 3"
    \accessible-svg-attributes[next-borrow-one-rod-title]\
  >
    [accessible-svg-title/next-borrow-one-rod-title
      "Next borrow one rod" diagram.
      Put a 1 below the dividend 234567, \
      and move it by two double steps to the left, \
      to become the lower divisor 10000.
      There are now two rows: \
        the dividend 234567 and \
        the lower divisor 10000.
    /]
    [accessible-svg-content/
      <## Marker definitions ##>
      <defs>
        <## Arrowhead ##>
        <marker id="arrowhead" viewBox="0 -0.15 0.7 0.3"
          refX="0.5" refY="0"
          markerUnits="userSpaceOnUse"
          markerWidth="0.7" markerHeight="0.15"
          orient="auto-start-reverse">
          <path d="M 0,-0.15 L 0,0.15 L 0.7,0 z"/>
        </marker>
      </defs>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 234567 ##>
      <text x="1" y="1" \font-size:normal>2</text>
      <text x="2" y="1" \font-size:normal>3</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## L ##>
      <text \maths-italic-r x="-3" y="2" \font-size:normal>L</text>
      <## 下法 ##>
      <text \r x="-1" y="2" \font-size:normal>~~下法~~</text>
      <## 10000 ##>
      <text \r x="2" y="2" \font-size:normal>1</text>
      <## 步之，超一位，至百而止。 ##>
      <path \step d="M 6 2 m -0.1 -0.3 a 2 2 0 0 0 -1.7 0" \arrowhead/>
      <path \step d="M 4 2 m -0.1 -0.3 a 2 2 0 0 0 -1.5 0" \arrowhead/>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="0" width="9" height="2.5"/>
    /]
  </svg>
  ||||
  
====


<<
  [g/上商置四百/]於實之上。
||
  [g/ .[For the] upper quotient, put four hundred /] above .[the] dividend.
>>
====
* \a[40] and \c[52186] have just 商 for 上商.

* 上商： upper quotient \+
  The integer part of the square root to be computed.

* The [g/ __hundreds digit of the upper quotient__~(上商) /]
  is the largest $\colg{a_1}$ such that $\colg{a_1}^2 \colr{L} \le \colb{d}$,
  or
  $$
    \colr{10000} \colg{a_1}^2 \le \colb{234567},
  $$
  i.e.
  $$
    \colg{a_1} := \colg{4}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 5"
    \accessible-svg-attributes[for-the-upper-quotient-put-400-title]\
  >
    [accessible-svg-title/for-the-upper-quotient-put-400-title
      "For the upper quotient put four hundred" diagram.
      Insert the upper quotient 400 above the dividend 234567.
      There are now three rows: \
        the upper quotient 400, \
        the dividend 234567, and \
        the lower divisor 10000.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text \g x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic-g x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text \g x="4" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 234567 ##>
      <text x="1" y="1" \font-size:normal>2</text>
      <text x="2" y="1" \font-size:normal>3</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## L ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="2" \font-size:normal>~~下法~~</text>
      <## 10000 ##>
      <text x="2" y="2" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="3.5"/>
    /]
  </svg>
  ||||
  
====


<<
  副[v/置四萬/]於實之下，下法之上，名為[v/方法/]。
||
  Subsidiarily [v/ put four myriad /] below .[the] dividend,
  .[and] above .[the] lower divisor;
  .[its] name be [v/ .[the] upright divisor /].
>>
======
* 方： (morally) upright \+
  方法 is one of three named divisors whose names relate to integrity:
  ====
  * 方法： upright divisor ($s_1$)
  * 廉法： incorrupt divisor ($s_2$)
  * 隅法： honest divisor ($s_3$)
  ====
  These shall henceforth be referred to as the __straight divisors__
  (straight as in 'straight copper' vs 'bent copper').

* The first straight divisor is the [v/ __upright divisor__~(方法) /]
  $$
    \colv{s_1}
    := \colg{a_1} \colr{L}
    = \colg{4} \times \colr{10000}
    = \colv{40000}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 6"
    \accessible-svg-attributes[subsidiarily-put-40000-title]\
  >
    [accessible-svg-title/subsidiarily-put-40000-title
      "Subsidiarily put four myriad" diagram.
      Insert the upright divisor 40000 \
      between the dividend 234567 and the lower divisor 10000.
      There are now four rows: \
        the upper quotient 400, \
        the dividend 234567, \
        the upright divisor 40000, and \
        the lower divisor 10000.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 234567 ##>
      <text x="1" y="1" \font-size:normal>2</text>
      <text x="2" y="1" \font-size:normal>3</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic-v x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 方法 ##>
      <text \v x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 40000 ##>
      <text \v x="2" y="2" \font-size:normal>4</text>
      <## L ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="3" \font-size:normal>~~下法~~</text>
      <## 10000 ##>
      <text x="2" y="3" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="4.5"/>
    /]
  </svg>
  ||||
  
======


<<
  [g/命上商四百/][b/除實/]。
||
  [g/ Name .[the] upper quotient's four hundred /],
  [b/ .[and] remove .[this] from .[the] dividend /].
>>
====
* 除： remove .[this] from \+
  This is also the word for division.
  Division is thought of as repeated removal of the divisor
  (in analogy to multiplication being repeated addition).

* As written, the text says $\colb{d} := \colb{d} - \colg{400^2}$,
  but for the purpose of understanding how this step fits in with the others,
  this is best written
  $$
    \begin{aligned}
      \colb{d}
      &:= \colb{d} - \colg{a_1} \colv{s_1} \\
      &= \colb{234567} - \colg{4} \times \colv{40000} \\
      &= \colb{74567}.
    \end{aligned}
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 6"
    \accessible-svg-attributes[name-the-upper-quotients-400-title]\
  >
    [accessible-svg-title/name-the-upper-quotients-400-title
      "Name the upper quotient's four hundred" diagram.
      Update the dividend 234567 to 74567.
      The four rows are now: \
        the upper quotient 400, \
        the dividend 74567, \
        the upright divisor 40000, and \
        the lower divisor 10000.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic-b x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 74567 ##>
      <text \b x="2" y="1" \font-size:normal>7</text>
      <text \b x="3" y="1" \font-size:normal>4</text>
      <text \b x="4" y="1" \font-size:normal>5</text>
      <text \b x="5" y="1" \font-size:normal>6</text>
      <text \b x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 40000 ##>
      <text x="2" y="2" \font-size:normal>4</text>
      <## L ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="3" \font-size:normal>~~下法~~</text>
      <## 10000 ##>
      <text x="2" y="3" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="4.5"/>
    /]
  </svg>
  ||||
  
====


<<
  除訖，[v/倍方法/]。
||
  .[The] removal finished, [v/ double .[the] upright divisor /].
>>
====
* In modern notation:
  $$
    \colv{s_1} := 2 s_1 = 2 \times 40000 = \colv{80000}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 6"
    \accessible-svg-attributes[double-the-upright-divisor-title]\
  >
    [accessible-svg-title/double-the-upright-divisor-title
      "Double the upright divisor" diagram.
      Update the upright divisor 40000 to 80000.
      The four rows are now: \
        the upper quotient 400, \
        the dividend 74567, \
        the upright divisor 80000, and \
        the lower divisor 10000.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 74567 ##>
      <text x="2" y="1" \font-size:normal>7</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic-v x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 方法 ##>
      <text \v x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 80000 ##>
      <text \v x="2" y="2" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="3" \font-size:normal>~~下法~~</text>
      <## 10000 ##>
      <text x="2" y="3" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="4.5"/>
    /]
  </svg>
  ||||
  
====


<<
  [v/方法一退/]，[r/下法再退/]。
||
  [v/ .[The] upright divisor retreateth once /];
  [r/ .[the] lower divisor retreateth again /].
>>
====
* \a[40] and \c[52186] are missing 方法 in 方法一退.

* 再： again; \or twice

* In modern notation:
  $$
    \begin{aligned}
      \colv{s_1} &:= s_1 / 10 = 80000 / 10 = \colv{8000} \\
      \colr{L} &:= L / 10^2 = 10000 / 100 = \colr{100}.
    \end{aligned}
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 6"
    \accessible-svg-attributes[the-upright-divisor-retreateth-title-1]\
  >
    [accessible-svg-title/the-upright-divisor-retreateth-title-1
      "The upright divisor retreateth once", first diagram.
      Update the upright divisor 80000 to 8000.
      Update the lower divisor 10000 to 100.
      The four rows are now: \
        the upper quotient 400, \
        the dividend 74567, \
        the upright divisor 8000, and \
        the lower divisor 100.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 74567 ##>
      <text x="2" y="1" \font-size:normal>7</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic-v x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 方法 ##>
      <text \v x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 8000 ##>
      <text \v x="3" y="2" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic-r x="-3" y="3" \font-size:normal>L</text>
      <## 下法 ##>
      <text \r x="-1" y="3" \font-size:normal>~~下法~~</text>
      <## 100 ##>
      <text \r x="4" y="3" \font-size:normal>1</text>
      <## 方法一退 ##>
      <path \step d="M 2 2 m -0.1 -0.3 a 1.5 2 0 0 1 0.7 0" \arrowhead/>
      <## 下法再退 ##>
      <path \step d="M 2 3 m -0.1 -0.3 a 2 2 0 0 1 1.7 0" \arrowhead/>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="4.5"/>
    /]
  </svg>
  ||||
  
====


<<
  復[g/置上商八十/]，以次前商。
||
  [g/ Put /] again [g/ .[for the] upper quotient eighty /],
  to be next .[after the] quotient .[digit] before.
>>
====
* The [g/ __tens digit of the upper quotient__~(上商) /]
  is the largest $\colg{a_2}$ such that
  $\colg{a_2} (\colv{s_1} + \colg{a_2} \colr{L}) \le \colb{d}$,
  or
  $$
    \colg{a_2} (\colv{8000} + \colr{100} \colg{a_2}) \le \colb{74567},
  $$
  i.e.
  $$
    \colg{a_2} := \colg{8}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 6"
    \accessible-svg-attributes[put-again-for-the-upper-quotient-80-title]\
  >
    [accessible-svg-title/put-again-for-the-upper-quotient-80-title
      "Put again for the upper quotient eighty" diagram.
      Update the upper quotient 400 to 480.
      The four rows are now: \
        the upper quotient 480, \
        the dividend 74567, \
        the upright divisor 8000, and \
        the lower divisor 100.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text \g x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic-g x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text \g x="5" y="0" \font-size:normal>8</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 74567 ##>
      <text x="2" y="1" \font-size:normal>7</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 8000 ##>
      <text x="3" y="2" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="3" \font-size:normal>~~下法~~</text>
      <## 100 ##>
      <text x="4" y="3" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="4.5"/>
    /]
  </svg>
  ||||
  
====


<<
  副[v/置八百/]於方法之下，下法之上，名為[v/廉法/]。
||
  Subsidiarily [v/ put eight hundred /] below .[the] upright divisor,
  .[and] above .[the] lower divisor;
  .[its] name be [v/ .[the] incorrupt divisor /].
>>
====
* 廉： incorrupt

* The second straight divisor is the [v/ __incorrupt divisor__~(廉法) /]
  $$
    \colv{s_2}
    := \colg{a_2} \colr{L}
    = \colg{8} \times \colr{100}
    = \colv{800}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 7"
    \accessible-svg-attributes[subsidiarily-put-800-title]\
  >
    [accessible-svg-title/subsidiarily-put-800-title
      "Subsidiarily put eight hundred" diagram.
      Insert the incorrupt divisor 800 \
      between the upright divisor 8000 and the lower divisor 100.
      There are now five rows: \
        the upper quotient 480, \
        the dividend 74567, \
        the upright divisor 8000, \
        the incorrupt divisor 800, and \
        the lower divisor 100.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 74567 ##>
      <text x="2" y="1" \font-size:normal>7</text>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>5</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic-v x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 8000 ##>
      <text x="3" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text \v x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 800 ##>
      <text \v x="4" y="3" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic x="-3" y="4" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="4" \font-size:normal>~~下法~~</text>
      <## 100 ##>
      <text x="4" y="4" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="5.5"/>
    /]
  </svg>
  ||||

====


<<
  [v/方、廉各命/][g/上商八十/]，以[b/除實/]。
||
  [v/ Each of .[the] upright .[and the] incorrupt nameth /]
  [g/ .[the] upper quotient's eighty /],
  to be [b/ removed from .[the] dividend /].
>>
====
* \a[40] and \c[52186] are missing 實.

* In modern notation:
  $$
    \begin{aligned}
      \colb{d}
      &:= \colb{d} - \colg{a_2} \colv{(s_1 + s_2)} \\
      &= \colb{74567} - \colg{8} \times \colv{(8000 + 800)} \\
      &= \colb{4167}.
    \end{aligned}
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 7"
    \accessible-svg-attributes[the-incorrupt-nameth-title]\
  >
    [accessible-svg-title/the-incorrupt-nameth-title
      "... the incorrupt nameth" diagram.
      Update the dividend 74567 to 4167.
      The five rows are now: \
        the upper quotient 480, \
        the dividend 4167, \
        the upright divisor 8000, \
        the incorrupt divisor 800, and \
        the lower divisor 100.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## d ##>
      <text \maths-italic-b x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text \b x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 4167 ##>
      <text \b x="3" y="1" \font-size:normal>4</text>
      <text \b x="4" y="1" \font-size:normal>1</text>
      <text \b x="5" y="1" \font-size:normal>6</text>
      <text \b x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 8000 ##>
      <text x="3" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 800 ##>
      <text x="4" y="3" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic x="-3" y="4" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="4" \font-size:normal>~~下法~~</text>
      <## 100 ##>
      <text x="4" y="4" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="5.5"/>
    /]
  </svg>
  ||||

====


<<
  除訖，[v/倍廉法/]，上從方法。
||
  .[The] removal finished, [v/ double .[the] incorrupt divisor /],
  .[which] followeth .[the] upright divisor above.
>>
====
* \a[40] and \c[52186] are missing 除.

* In modern notation:
  $$
    \colv{s_2} := 2 s_2 = 2 \times 800 = \colv{1600}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 7"
    \accessible-svg-attributes[double-the-incorrupt-divisor-title]\
  >
    [accessible-svg-title/double-the-incorrupt-divisor-title
      "Double the incorrupt divisor" diagram.
      Update the incorrupt divisor 800 to 1600.
      The five rows are now: \
        the upper quotient 480, \
        the dividend 4167, \
        the upright divisor 8000, \
        the incorrupt divisor 1600, and \
        the lower divisor 100.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 4167 ##>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>1</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic-v x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 8000 ##>
      <text x="3" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text \v x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 1600 ##>
      <text \v x="3" y="3" \font-size:normal>1</text>
      <text \v x="4" y="3" \font-size:normal>6</text>
      <## L ##>
      <text \maths-italic x="-3" y="4" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="4" \font-size:normal>~~下法~~</text>
      <## 100 ##>
      <text x="4" y="4" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="5.5"/>
    /]
  </svg>
  ||||

====


<<
  [v/方法一退/]，[r/下法再退/]。
||
  [v/ .[The] upright divisor retreateth once /];
  [r/ .[the] lower divisor retreateth again /].
>>
====
* \a[40] erroneously has 一退方法 for 方法一退.

* Presumably 上從方法 from the previous sentence tells us that
  the incorrupt divisor~(廉法) is to
  "follow .[the] upright divisor~(方法) above"
  in its retreat.

* In modern notation:
  $$
    \begin{aligned}
      \colv{s_1} &:= s_1 / 10 = 8000 / 10 = \colv{800} \\
      \colv{s_2} &:= s_2 / 10 = 1600 / 10 = \colv{160} \\
      \colr{L} &:= L / 10^2 = 100 / 100 = \colr{1}.
    \end{aligned}
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 7"
    \accessible-svg-attributes[the-upright-divisor-retreateth-title-2]\
  >
    [accessible-svg-title/the-upright-divisor-retreateth-title-2
      "The upright divisor retreateth once", second diagram.
      Update the upright divisor 8000 to 800.
      Update the incorrupt divisor 1600 to 160.
      Update the lower divisor 100 to 1.
      The five rows are now: \
        the upper quotient 480, \
        the dividend 4167, \
        the upright divisor 800, \
        the incorrupt divisor 160, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 4167 ##>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>1</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic-v x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic-v x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 方法 ##>
      <text \v x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text \v x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text \v x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text \v x="4" y="3" \font-size:normal>1</text>
      <text \v x="5" y="3" \font-size:normal>6</text>
      <## L ##>
      <text \maths-italic-r x="-3" y="4" \font-size:normal>L</text>
      <## 下法 ##>
      <text \r x="-1" y="4" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text \r x="6" y="4" \font-size:normal>1</text>
      <## 方法一退 ##>
      <path \step d="M 3 2 m -0.1 -0.3 a 1.5 2 0 0 1 0.7 0" \arrowhead/>
      <path \step d="M 3 3 m -0.1 -0.3 a 1.5 2 0 0 1 0.7 0" \arrowhead/>
      <## 下法再退 ##>
      <path \step d="M 4 4 m -0.1 -0.3 a 2 2 0 0 1 1.7 0" \arrowhead/>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="5.5"/>
    /]
  </svg>
  ||||
  
====


<<
  復[g/置上商四/]，以次前。
||
  [g/ Put /] again [g/ .[for the] upper quotient four /],
  to be next .[after the digit] before.
>>
====
* The [g/ __ones digit of the upper quotient__~(上商) /]
  is the largest $\colg{a_3}$ such that
  $\colg{a_3} (\colv{s_1} + \colv{s_2} + \colg{a_3} \colr{L})
  \le \colb{d}$,
  or
  $$
    \colg{a_3} (\colv{800} + \colv{160} + \colg{a_3}) \le \colb{4167},
  $$
  i.e.
  $$
    \colg{a_3} := \colg{4}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 7"
    \accessible-svg-attributes[put-again-for-the-upper-quotient-4-title]\
  >
    [accessible-svg-title/put-again-for-the-upper-quotient-4-title
      "Put again for the upper quotient four" diagram.
      Update the upper quotient 480 to 484.
      The five rows are now: \
        the upper quotient 484, \
        the dividend 4167, \
        the upright divisor 800, \
        the incorrupt divisor 160, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text \g x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## a_3 ##>
      <text \maths-italic-g x="6" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 4 ##>
      <text \g x="6" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 4167 ##>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>1</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text x="4" y="3" \font-size:normal>1</text>
      <text x="5" y="3" \font-size:normal>6</text>
      <## L ##>
      <text \maths-italic x="-3" y="4" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="4" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text x="6" y="4" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="5.5"/>
    /]
  </svg>
  ||||

====


<<
  副[v/置四/]於方法之下，下法之上，名曰[v/隅法/]。
||
  Subsidiarily [v/ put four /] below .[the] upright divisor,
  .[and] above .[the] lower divisor;
  .[its] name .[be] called [v/ .[the] honest divisor /].
>>
====
* 隅：廉也； honest

* The third straight divisor is the [v/ __honest divisor__~(隅法) /]
  $$
    \colv{s_3}
    := \colg{a_3} \colr{L}
    = \colg{4} \times \colr{1}
    = \colv{4}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 8"
    \accessible-svg-attributes[subsidiarily-put-4-title]\
  >
    [accessible-svg-title/subsidiarily-put-4-title
      "Subsidiarily put four" diagram.
      Insert the honest divisor 4 \
      between the incorrupt divisor 160 and the lower divisor 1.
      There are now six rows: \
        the upper quotient 484, \
        the dividend 4167, \
        the upright divisor 800, \
        the incorrupt divisor 160, \
        the honest divisor 4, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## a_3 ##>
      <text \maths-italic x="6" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 4 ##>
      <text x="6" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 4167 ##>
      <text x="3" y="1" \font-size:normal>4</text>
      <text x="4" y="1" \font-size:normal>1</text>
      <text x="5" y="1" \font-size:normal>6</text>
      <text x="6" y="1" \font-size:normal>7</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## s_3 ##>
      <text \maths-italic-v x="-3" y="4" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text x="4" y="3" \font-size:normal>1</text>
      <text x="5" y="3" \font-size:normal>6</text>
      <## 隅法 ##>
      <text \v x="-1" y="4" \font-size:normal>~~隅法~~</text>
      <## 4 ##>
      <text \v x="6" y="4" \font-size:normal>4</text>
      <## L ##>
      <text \maths-italic x="-3" y="5" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="5" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text x="6" y="5" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="6.5"/>
    /]
  </svg>
  ||||

====


<<
  [v/方、廉、隅各命/][g/上商四/]，以[b/除實/]。
||
  [v/ Each of .[the] upright, .[the] incorrupt .[and the] honest nameth /]
  [g/ .[the] upper quotient's four /],
  to be [b/ removed from .[the] dividend /].
>>
====
* \a[40] is missing 以.

* In modern notation:
  $$
    \begin{aligned}
      \colb{d}
      &:= \colb{d} - \colg{a_3} \colv{(s_1 + s_2 + s_3)} \\
      &= \colb{4167} - \colg{4} \times \colv{(800 + 160 + 4)} \\
      &= \colb{311}.
    \end{aligned}
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 8"
    \accessible-svg-attributes[the-honest-nameth-title]\
  >
    [accessible-svg-title/the-honest-nameth-title
      "... the honest nameth" diagram.
      Update the dividend 4167 to 311.
      The six rows are now: \
        the upper quotient 484, \
        the dividend 311, \
        the upright divisor 800, \
        the incorrupt divisor 160, \
        the honest divisor 4, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## a_3 ##>
      <text \maths-italic x="6" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 4 ##>
      <text x="6" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic-b x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text \b x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 311 ##>
      <text \b x="4" y="1" \font-size:normal>3</text>
      <text \b x="5" y="1" \font-size:normal>1</text>
      <text \b x="6" y="1" \font-size:normal>1</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## s_3 ##>
      <text \maths-italic x="-3" y="4" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text x="4" y="3" \font-size:normal>1</text>
      <text x="5" y="3" \font-size:normal>6</text>
      <## 隅法 ##>
      <text x="-1" y="4" \font-size:normal>~~隅法~~</text>
      <## 4 ##>
      <text x="6" y="4" \font-size:normal>4</text>
      <## L ##>
      <text \maths-italic x="-3" y="5" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="5" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text x="6" y="5" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="6.5"/>
    /]
  </svg>
  ||||

====


<<
  除訖，[v/倍隅法/]，從方法。
||
  .[The] removal finished, [v/ double .[the] honest divisor /],
  .[which] followeth .[the] upright divisor.
>>
====
* \a[40] is missing 倍隅法，從方法.

* In modern notation:
  $$
    \colv{s_3} := 2 s_3 = 2 \times 4 = \colv{8}.
  $$
  
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 8"
    \accessible-svg-attributes[double-the-honest-divisor-title]\
  >
    [accessible-svg-title/double-the-honest-divisor-title
      "Double the honest divisor" diagram.
      Update the honest divisor 4 to 8.
      The six rows are now: \
        the upper quotient 484, \
        the dividend 311, \
        the upright divisor 800, \
        the incorrupt divisor 160, \
        the honest divisor 8, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text x="5" y="0" \font-size:normal>8</text>
      <## a_3 ##>
      <text \maths-italic x="6" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 4 ##>
      <text x="6" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 311 ##>
      <text x="4" y="1" \font-size:normal>3</text>
      <text x="5" y="1" \font-size:normal>1</text>
      <text x="6" y="1" \font-size:normal>1</text>
      <## s_1 ##>
      <text \maths-italic x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## s_3 ##>
      <text \maths-italic-v x="-3" y="4" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 方法 ##>
      <text x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text x="4" y="3" \font-size:normal>1</text>
      <text x="5" y="3" \font-size:normal>6</text>
      <## 隅法 ##>
      <text \v x="-1" y="4" \font-size:normal>~~隅法~~</text>
      <## 8 ##>
      <text \v x="6" y="4" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic x="-3" y="5" \font-size:normal>L</text>
      <## 下法 ##>
      <text x="-1" y="5" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text x="6" y="5" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="6.5"/>
    /]
  </svg>
  ||||

====


<<
  [g/上商得四百八十四/]，\
  [v/下法得九百六十八/]，\
  [b/不盡三百一十一/]。
||
  [g/ .[The] upper quotient resulteth in four hundred .[and] eighty-four /],
  [v/ .[and the] lower divisors result in nine hundred .[and] sixty-eight /],
  [b/ .[with] remainder three hundred .[and] eleven /].
>>
====
* 下法： lower divisors \+
  Confusingly, this refers not to the lower divisor~(下法),
    currently $\colr{L = 1}$,
  but to the total of the three straight divisors,
    upright ($\colv{s_1}$),
    incorrupt ($\colv{s_2}$), and
    honest ($\colv{s_3}$).

* In modern notation:
  $$
    \begin{aligned}
      \colg{U} &:= \colg{100 a_1 + 10 a_2 + a_3} = \colg{484} \\
      \colv{L} &:= \colv{s_1 + s_2 + s_3} = \colv{968} \\
      \colb{R} &:= \colb{d} = \colb{311}.
    \end{aligned}
  $$
  ----
  The final arrangement of counting rods is thus:
  ----
  ||||{.centred-block}
  <svg width="280px" height="100%" viewBox="-3.5 -2.25 10.5 8"
    \accessible-svg-attributes[final-arrangement-title]\
  >
    [accessible-svg-title/final-arrangement-title
      Final arrangement diagram.
      There are six rows: \
        the upper quotient 484, \
        the dividend 311, \
        the upright divisor 800, \
        the incorrupt divisor 160, \
        the honest divisor 8, and \
        the lower divisor 1.
    /]
    [accessible-svg-content/
      <## 上商 ##>
      <text \g x="-1" y="0" \font-size:normal>~~上商~~</text>
      <## a_1 ##>
      <text \maths-italic-g x="4" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## 4 ##>
      <text \g x="4" y="0" \font-size:normal>4</text>
      <## a_2 ##>
      <text \maths-italic-g x="5" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## 8 ##>
      <text \g x="5" y="0" \font-size:normal>8</text>
      <## a_3 ##>
      <text \maths-italic-g x="6" y="-1.3" \font-size:normal>\
        a<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 4 ##>
      <text \g x="6" y="0" \font-size:normal>4</text>
      <## d ##>
      <text \maths-italic-b x="-3" y="1" \font-size:normal>d</text>
      <## 實 ##>
      <text \b x="-1" y="1" \font-size:normal>~~實~~</text>
      <## 311 ##>
      <text \b x="4" y="1" \font-size:normal>3</text>
      <text \b x="5" y="1" \font-size:normal>1</text>
      <text \b x="6" y="1" \font-size:normal>1</text>
      <## s_1 ##>
      <text \maths-italic-v x="-3" y="2" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">1</tspan>\
      </text>
      <## s_2 ##>
      <text \maths-italic-v x="-3" y="3" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">2</tspan>\
      </text>
      <## s_3 ##>
      <text \maths-italic-v x="-3" y="4" \font-size:normal>\
        s<tspan \font-size:subscript dy="0.25em">3</tspan>\
      </text>
      <## 方法 ##>
      <text \v x="-1" y="2" \font-size:normal>~~方法~~</text>
      <## 800 ##>
      <text \v x="4" y="2" \font-size:normal>8</text>
      <## 廉法 ##>
      <text \v x="-1" y="3" \font-size:normal>~~廉法~~</text>
      <## 160 ##>
      <text \v x="4" y="3" \font-size:normal>1</text>
      <text \v x="5" y="3" \font-size:normal>6</text>
      <## 隅法 ##>
      <text \v x="-1" y="4" \font-size:normal>~~隅法~~</text>
      <## 8 ##>
      <text \v x="6" y="4" \font-size:normal>8</text>
      <## L ##>
      <text \maths-italic-r x="-3" y="5" \font-size:normal>L</text>
      <## 下法 ##>
      <text \r x="-1" y="5" \font-size:normal>~~下法~~</text>
      <## 1 ##>
      <text \r x="6" y="5" \font-size:normal>1</text>
      <## Rectangular border ##>
      <rect \border x="-2.25" y="-1" width="9" height="6.5"/>
    /]
  </svg>
  ||||

====


<<
  是為方[g/四百八十四/]步[v/九百六十八分/]步之[b/三百一十一/]。
||
  This be .[a] square .[of edge]
    [g/ four hundred .[and] eighty-four /] paces
    .[and] [b/ three hundred .[and] eleven /]
      [v/ nine hundred .[and] sixty-eighths /]
    of .[a] pace.
>>
====
* Thus the algorithm gives
  $$
    \begin{aligned}
      \sqrt{234567 \unit{paces}^2}
      &\approx \left( \colg{U} + \frac\colb{R}\colv{L} \right) \unit{paces}
        \\[\tallspace]
      &= \colg{484} \tfrac\colb{311}\colv{968} \unit{paces},
    \end{aligned}
  $$
  which has relative error $2.2 \times 10^{-7}$.
====


##{#commentary}
  Extended commentary
##


###{#pseudocode}
  Pseudocode
###

----
In modern notation, \sun-tzu's algorithm
for computing the square root of the positive integer $x$
proceeds thus:
----

++++++++

1. 
  Compute the number of digits of $x$:
  $$
    N := \lfloor \log_{10} x \rfloor + 1.
  $$


2.
  Compute the number of digits of the [g/ upper quotient~(上商) /],
  which is the integer part of $\sqrt{x}$:
  $$
    n := \left\lceil \frac{N}{2} \right\rceil.
  $$


3.
  Initialise the [r/ lower divisor~(下法) /]:
  $$
    \colr{L} := (10 ^ {n - 1}) ^ 2.
  $$


4.
  Initialise the [b/ dividend~(實) /]:
  $$
    \colb{d} := x.
  $$


<## Keyword [. .] ##>
w{%
  \[ [.]
    [ ]
    (?P<content> [\S]*? )
    [ ]
  [.] \]
%
  <span class="keyword">\g<content></span>
%}

5.
  [. For .] $i = 1, 2, \dots, n$:
  
  ======
  * Determine the [g/ $i$th digit of the upper quotient~(上商) /],
    the largest integer $\colg{a_i}$ such that
    $$
      \colg{a_i}
      \Bigl[
        (\colv{s_1} + \dots + \colv{s_{i-1}}) + \colg{a_i} \colr{L}
      \Bigr]
        \le
      \colb{d}.
    $$
  
  * Determine the [v/ $i$th straight divisor /]:
    $$
      \colv{s_i} := \colg{a_i} \colr{L}.
    $$
    The first three are named:
      $\colv{s_1}$ upright~(方),
      $\colv{s_2}$ incorrupt~(廉), and
      $\colv{s_3}$ honest~(隅).
  
  * Update the [b/ dividend~(實) /]:
    $$
      \colb{d} :=
      \colb{d}
        -
      \colg{a_i}
      \Bigl[
        (\colv{s_1} + \dots + \colv{s_{i-1}}) + \colv{s_i}
      \Bigr].
    $$
  
  * Double the [v/ $i$th straight divisor /]:
    $$
      \colv{s_i} := 2 s_i.
    $$
  
  * [. If .] $i < n$:
    ====
    * Retreat the divisors:
      $$
        \begin{aligned}
          \colv{s_1} &:= s_1 / 10 \\
            &\quad \vdots \\
          \colv{s_i} &:= s_i / 10 \\
          \colr{L} &:= L / 10^2.
        \end{aligned}
      $$
    ====
    [. End~If .]
  
  ======
  
  [. End~For .]

* Compute
    the [g/ upper quotient~(上商) /],
    the [v/ sum of the straight divisors /],
    and the [b/ remainder~(不盡) /]:
  $$
    \begin{aligned}
      \colg{U} &:= \colg{10^{n-1} a_1 + 10^{n-2} a_2 + \dots + a_n} \\
      \colv{L} &:= \colv{s_1 + s_2 + \dots + s_n} \\
      \colb{R} &:= \colb{d}.
    \end{aligned}
  $$

* [. Return .] $\colg{U} + \colb{R} / \colv{L}$.

++++++++

----
For an implementation in Python, see [`/sun-tzu/code/sqrt.py`] [python].
----

@@[python]
  https://github.com/yawnoc/yawnoc.github.io/blob/master/sun-tzu/code/sqrt.py
@@


###{#why}
  Why does it work?
###

----
Stare at the following identity for a long time:
----

$$
\begin{aligned}
  \gdef\coeffbr#1{\Bigl(#1\Bigr)}
  \roundbr{
    a_1 + \frac{a_2}{10} + \frac{a_3}{10^2} + \frac{a_4}{10^3} + \dots
  } ^ 2
    =
  {a_1}^2
  &+ \frac{a_2}{10^2} \coeffbr{20 a_1 + a_2}
    \\[\tallspace]
  &+ \frac{a_3}{10^4} \coeffbr{200 a_1 + 20 a_2 + a_3}
    \\[\tallspace]
  &+ \frac{a_4}{10^6} \coeffbr{2000 a_1 + 200 a_2 + 20 a_3 + a_4}
    \\[\tallspace]
  &+ \dots
\end{aligned}
$$


{{{{|
  \nav-up: Volume~II : ["ii"]
  {{|
    \nav-prev: \P18 : ["ii 18"]
    \nav-curr: \P19
    \nav-next: \P20 : ["ii 20"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~II \P19"
][
  sun-tzu-ii-19
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{II} {\P19}''~~
]

%footer-element
