{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/coloured-spans.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title "The Sea Island Computational Classic" 《海島算經》
  %title-en ".[The] Sea Island Computational Classic"
  %date-created 2019-04-20
  %date-modified 2020-07-19
  \resources:maths
  %description
    An annotated English translation of the first problem in Haidao Suanjing, \
    《海島算經》, "The Sea Island Computational Classic".
  %css
    .parallel-text + ul + .centred-block,
    .parallel-text + .centred-block {
      margin-top: 10ex;
    }
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:translation
* \header-link:cite
====]]

#
  《海島算經》 \+
  %title-en
#


\noscript:maths

[||||
Also known as _Haidao Suanjing_.
||||]


----
《海島算經》, or [".[The] Sea Island Computational Classic"][sea island],
is one of the [ten canon classics] of Chinese mathematics.
Written by [Liu Huei ((劉徽))] [劉徽]
of the [Three Kingdoms period] (220--280~AD),
it consists of nine problems in the surveying of
distant structures or landforms.
For each problem, the Classic itself only gives the statement of the problem,
the answer and the formula used to compute the answer.
Derivations of the formulae I found
in [《海島算經細草圖說》][sea island detailed],
or ".[The] Sea Island Computational Classic
.[with] detailed working, diagrams, .[and] explanations".
Written by [Li Huang ((李潢))] [李潢],
the rough working~(草), diagrams~(圖)
and explanations~(說) supplement the older (but at times erroneous)
annotations of [Li Ch'un-f(e^)ng ((李淳風))] [李淳風].
It is in the explanations~(說) that I find derivations of the formulae,
not unlike high school geometry proofs.
----

@@[sea island]
  https://en.wikipedia.org/wiki/Haidao_Suanjing
@@
@@[ten canon classics]
  https://en.wikipedia.org/wiki/Ten_Computational_Canons
@@
@@[劉徽]
  https://en.wikipedia.org/wiki/Liu_Hui
@@
@@[Three Kingdoms period]
  https://en.wikipedia.org/wiki/Three_Kingdoms
@@
@@[sea island detailed]
  https://archive.org/details/02094033.cn/mode/1up
@@
@@[李潢]
  https://zh.wikipedia.org/wiki/%E6%9D%8E%E6%BD%A2
@@
@@[李淳風]
  https://en.wikipedia.org/wiki/Li_Chunfeng
@@

----
Here I translate the the eponymous first problem 望海島,
"looking at .[a] sea island",
and its corresponding derivation as found in 《海島算經細草圖說》.
----


[svg-styles/
  text {
    \svg-style:text-declarations
  }
  \svg-style:text-colour-rulesets
  \svg-style:maths-font-rulesets
  line {
    \svg-style:stroke-declarations
  }
  \svg-style:stroke-colour-rulesets
/]


##{#translation}
  Translation
##

[====
* [Problem](#problem)
* [Derivation](#derivation)
====]

----
The Chinese source texts
[今有望海島][problem] (problem) and [說曰][derivation] (derivation)
are from archive.org.
After reading these in their original forms (i.e.~without any punctuation)
it is hard not to appreciate modern mathematical notation.
----

@@[problem]
  https://archive.org/details/02094033.cn/page/n1/mode/1up
@@
@@[derivation]
  https://archive.org/details/02094033.cn/page/n5/mode/1up
@@

----
Chinese units of measurement have changed many times throughout history.
There are three length units used in this excerpt,
and while their exact size is not terribly important,
it is good to know the order of magnitude:
----
====
* A chang ((丈)), "rod", is of the order three metres,
* A pu ((步)), "pace", is of the order two metres, and
* A li ((里)), "mile", is of the order half a kilometre.
====
----
The relevant conversions are
----
$$
\begin{aligned}
  3 \unit{rods} &= 5 \unit{paces}, \\
  1 \unit{mile} &= 300 \unit{paces}.
\end{aligned}
$$

###{#problem}
  Problem
###



||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -3.7 9.2 4"
  \accessible-svg-attributes[now-there-be-title]\
>
  [accessible-svg-title/now-there-be-title
    "Now there be" diagram.
    Draw a horizontal segment representing the ground.
    At the left end of the ground, \
      draw a vertical segment upward, representing the sea island.
    At each of two points within the ground segment, \
      draw a vertical segment upward, \
      representing a vertical post of height 3~rods, \
      which is shorter than the sea island.
    The two vertical posts are separated by 1000~paces.
    The post closer to the sea island is called the front post.
    The post further from the sea island is called the rear post.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line \b x1="0" y1="-3.5" x2="0" y2="0"/>
    <text \b x="0" y="-1.75" \font-size
      dx="0em" dy="-1em"
      transform="rotate(-90 0 -1.75)">sea island</text>
    <## ground BH except DG ##>
    <line x1="0" y1="0" x2="3" y2="0"/>
    <line x1="5.5" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line \r x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
    dy="-0.5em">front</text>
    <text \maths-regular-r x="3" y="-0.5" \font-size
      dx="0em" dy="-0.5em"
      transform="rotate(-90 3 -0.5)">3 rods</text>
    <## rear post FG ##>
    <line \r x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
    dy="-0.5em">rear</text>
    <text \maths-regular-r x="5.5" y="-0.5" \font-size
      dx="0em" dy="1.3em"
      transform="rotate(-90 5.5 -0.5)">3 rods</text>
    <## post separation DG ##>
    <line \g x1="3" y1="0" x2="5.5" y2="0"/>
    <text \maths-regular-g x="4.25" y="0" \font-size
      dy="-0.5em">1000 paces</text>
  
  /]
  
</svg>
||||

<<
  今有望[b/海島/]，立[r/兩表/]，[r/齊高三丈/]，\
  前後[g/相去千步/]，令後表與前表參相直。
||
  Now there be .[a] looking at .[a] [b/ sea island /];
  erect [r/ two posts /], [r/ .[of the] same height three rods /],
  .[one] in front of .[the] other,
  [g/ mutually separated by .[a] thousand paces /],
  .[and] make .[the] rear post mutually straight .[the] three
  with .[the] front post .[and the island].
>>
====
* 表：標也； posts; \or pillars; \lit markers

* 齊： .[the] same; \or uniform

* 丈： rod; \or measure \+
  A unit of distance, of the order three metres.
  Note that $3 \unit{rods} = 5 \unit{paces}$.

* 前後： .[one] in front of .[the] other; \lit front .[and] rear

* 步： paces; \or steps \+
  A unit of distance, of the order two metres.

* 參相直： mutually straight .[the] three; \or three-in-line \+
  參 means 三, three.
====




||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -3.7 9.2 4.2"
  \accessible-svg-attributes[walking-back-123-paces-title]\
>
  [accessible-svg-title/walking-back-123-paces-title
    "Walking back 123~paces" diagram.
    Draw a line through the peak of the sea island \
    and the (upper) tip of the front post.
    This line meets the horizontal ground \
    123~paces from the base of the front post.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <## ground BH except DE ##>
    <line x1="0" y1="0" x2="3" y2="0"/>
    <line x1="4.2" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <## front line of sight ACE ##>
    <line \r x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <## front post backward walk DE ##>
    <line \b x1="3" y1="0" x2="4.2" y2="0"/>
    <text \maths-regular-b x="3.6" y="0" \font-size
      dy="1.2em">123 paces</text>
  
  /]
  
</svg>
||||

<<
  從前表[b/卻行一百二十三步/]，人目著地[r/取望島峯/]，與表末參合。
||
  [b/ Walking back one hundred .[and] twenty-three paces /]
    from .[the] front post,
  .[a] man's eye on .[the] ground,
    [r/ taking .[a] look at .[the] peak of .[the] island /],
  meeteth .[the] three with .[the] tip of .[the] post.
>>
====
* 著地： on .[the] ground; \lit contacting .[the] ground

* 峯： peak; \or summit

* In other words, the three of them
  (the island's peak, the post's tip, and the person's eye)
  are in a straight line.
====




||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -3.7 9.2 4.2"
  \accessible-svg-attributes[walking-back-127-paces-title]\
>
  [accessible-svg-title/walking-back-127-paces-title
    "Walking back 127~paces" diagram.
    Draw a line through the peak of the sea island \
    and the (upper) tip of the rear post.
    This line meets the horizontal ground \
    127~paces from the base of the rear post.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <## ground BH except GH ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <## rear line of sight AFH ##>
    <line \r x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <## rear post backward walk GH ##>
    <line \b x1="5.5" y1="0" x2="7.7" y2="0"/>
    <text \maths-regular-b x="6.6" y="0" \font-size
      dy="1.2em">127 paces</text>
  
  /]
  
</svg>
||||

<<
  從後表[b/卻行一百二十七步/]，人目着地[r/取望島峯/]，亦與表末參合。
||
  [b/ Walking back one hundred .[and] twenty-seven paces /]
  from .[the] rear post, .[a] man's eye on .[the] ground,
  [r/ taking .[a] look at .[the] peak of .[the] island /],
  also meeteth .[the] three with .[the] tip of .[the] post.
>>




||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -3.7 9.2 4.2"
  \accessible-svg-attributes[we-ask-how-much-title]\
>
  [accessible-svg-title/we-ask-how-much-title
    "We ask how much" diagram.
    What is the height of the sea island?
    What is the distance from the base of the sea island \
    to the base of the front post?
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line \b x1="0" y1="-3.5" x2="0" y2="0"/>
    <text \b x="0" y="-1.75" \font-size
    dx="0em" dy="-1em"
      transform="rotate(-90 0 -1.75)">island height?</text>
    <## ground BH except BD ##>
    <line x1="3" y1="0" x2="7.7" y2="0"/>
    <## distance from front post BD ##>
    <line \r x1="0" y1="0" x2="3" y2="0"/>
    <text \r x="1.5" y="0" \font-size
    dy="-0.5em">distance?</text>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
  
  /]
  
</svg>
||||

<<
  問[b/島高/]及[r/去表/]各幾何？
||
  .[We] ask, how much .[are] each of [b/ .[the] height of .[the] island /]
  and [r/ .[its] distance from .[the] post /]?
>>

<<
  答曰：島高[b/四里五十五步/]；去表[r/一百二里一百五十步/]。
||
  Answer saith: .[the] height of .[the] island .[is]
    [b/ four miles .[and] fifty-five paces /],
  .[and the] distance from .[the] post,
    [r/ one hundred .[and] two miles .[and] one hundred .[and] fifty paces /].
>>
======
* 里： miles \+
  A [unit of distance](https://en.wikipedia.org/wiki/Li_\(unit\)),
  of the order half a kilometre.
  Note that $1 \unit{mile} = 300 \unit{paces}$.

* 一百二： one hundred .[and] two \+
  The italicised .[and] has been supplied by me as the translator,
  and is noteworthy because:
  ====
  * In modern Chinese, you must say 一百零二,
    "one hundred oh two", to mean~102.
    If you just say 一百二 or 百二, this means~120;
    the~二 refers to the next significant digit
    (as in $1.2 \times 100 = 120$).
  
  * In Literary Chinese you might see 一百又二 or 一百有二,
    "one hundred and two", but the "and" is not necessary.
    Thus 一百二 or 百二 means~102 rather than~120.
    This is preserved in modern Japanese.
  ====
======

<<
  術曰：以表高乘表間爲實；相多爲法，除之。所得加表高，即得島高。
||
  Method saith: use .[the] post height times
  .[the] post separation as .[the] dividend, .[and the]
  mutual excess as .[the] divisor, .[and] divide them.
  .[Unto] that obtained add .[the] post height,
  that is .[we] obtain .[the] height of .[the] island.
>>
====
* 實： dividend; \or numerator

* 間： separation \+
  間，去聲， \C kaan3, \M ji(a\)n

* 相多： mutual excess; \or difference \+
  It is not immediately obvious, but "mutual excess" refers to
  the difference between the backward walking distances from the two posts.

* 法： divisor; \or denominator \+
  Altogether:
  $$
    \frac{\text{實}}{\text{法}} = \frac{\textq{dividend}}{\textq{divisor}}.
  $$
  實 and 法 are very much mathematical jargon terms of Literary Chinese.
  In no other context do they mean "dividend" and "divisor".

* In modern notation,
  $$
    \text{島高} =
    \frac{\text{表高} \cdot \text{表間}}{\text{相多}} + \text{表高}
  $$
  or
  $$
    \begin{aligned}
      \textq{island height}
      &=
        \frac{
          \textq{post height}
          \textq{post separation}
        }{
          \textq{mutual excess}
        }
          +
        \textq{post height}
          \\[\tallspace]
      &=
        \frac{
          3 \unit{rods} \cdot 1000 \unit{paces}
        }{
          127 \unit{paces} - 123 \unit{paces}
        } 
          +
        5 \unit{paces}
          \\[\tallspace]
      &= 4 \unit{miles} + 55 \unit{paces}.
    \end{aligned}
  $$
====

<<
  求前表去島遠近者：以前表卻行乘表間爲實；相多爲法。除之，得島去表里數。
||
  Those seeking .[the] distance .[that the] front post .[is] separated
    from .[the] island:
  use .[the] front post backward walk times .[the] post separation
    as .[the] dividend,
  .[and the] mutual excess as .[the] divisor.
  Divide them, .[to] obtain .[the] number of miles
    .[that the] island .[is] separated from .[the] post.
>>
====
* 遠近： distance; \lit far-closeness

* In modern notation,
  $$
    \text{島去表} = \frac{\text{前表卻行} \cdot \text{表間}}{\text{相多}}
  $$
  or
  $$
    \begin{aligned}
      \textq{island-post separation}
      &=
        \frac{
          \textq{front post backward walk}
          \textq{post separation}
        }{
          \textq{mutual excess}
        }
          \\[\tallspace]
      &=
        \frac{
          123 \unit{paces} \cdot 1000 \unit{paces}
        }{
          127 \unit{paces} - 123 \unit{paces}
        }
          \\[\tallspace]
      &= 102 \unit{miles} + 150 \unit{paces}.
    \end{aligned}
  $$
====


###{#derivation}
  Derivation
###

----
The derivation in 《海島算經細草圖說》,
called an [explanation~(說)][derivation],
comes with a [diagram~(圖)] [diagram]
which I have reproduced here, minus some irrelevant vertical lines.
I have mapped the names of the vertices as follows:
----
@@[diagram]
  https://archive.org/details/02094033.cn/page/n4/mode/1up
@@

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    , 甲
    , 乙
    , 丙
    , 丁
    , 戊
    , 己
    , 庚
    , 辛
    , 壬
    , 辰
  ==
    , $A$
    , $B$
    , $C$
    , $D$
    , $E$
    , $F$
    , $G$
    , $H$
    , $I$
    , $O$
''''
||||
||||||


<##
                           Full diagram
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    p           post height                             1
    h           island height                           3.5
    d           distance from front post                3
    s           post separation                         2.5
    f           front post backward walk                1.2
                  f / p == (f + d) / h
                  f == d/h / (1/p - 1/h)
    r           rear post backward walk                 2.2
                  r / p == (r + s + d) / h
                  r == (s+d)/h / (1/p - 1/h)
    BH          horizontal range d + s + r              7.7
    xleft       left x pos                             -1
    xright      right x pos                             8.2
    w           total width                             9.2
    ytop        top y pos                              -4
    ybottom     bottom y pos                            1
    h           total height                            5
  ***********************************************************************
      A____
      |    \____
      |  \      \____
      |    -         \____
      |       \           \____
      |          \             \____
  h   |              \              \____
      |                  \     C         \____ F
    O |______________________\________________\____
      |                        |\ _           |\_  \____
    p |                        |   \ _        |   \ _   \____
      |________________________|_______\______|_______\______\_
      B           d            D   f   E      G   f   I       H
                                      s              r
  ***********************************************************************
##>


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
w{: \font-size : font-size="0.3" :}


||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[main-diagram-title]\
>
  [accessible-svg-title/main-diagram-title
    Main diagram from the Chinese text 《海島算經細草圖說》, \
    minus some irrelevant vertical lines, \
    replicated in SVG format and with vertices labelled using latin letters \
    in addition to the original Chinese.
    This diagram is not easily describable in words, \
    and is better understood via the diagrams to follow, \
    which construct this diagram step by step.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH ##>
    <line x1="0" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF ##>
    <line x1="0" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

----
The punctuation inserted in this section is my own.
----

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[ab-is-the-sea-island-title]\
>
  [accessible-svg-title/ab-is-the-sea-island-title
    "AB is the sea island" diagram.
    Draw a horizontal segment representing the ground.
    Label the left end of the ground B, the base of the sea island.
    At B, draw a vertical segment upward to A, the peak of the sea island.
    AB represents the sea island.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line \b x1="0" y1="-3.5" x2="0" y2="0"/>
    <text \r x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic-r x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH ##>
    <line x1="0" y1="0" x2="7.7" y2="0"/>
  
  /]
  
</svg>
||||

<<
  說曰：[b/甲乙爲海島/]，[r/甲爲島峯/]。
||
  Explanation saith:
  [b/ $AB$ is .[the] sea island /];
  [r/ $A$ is .[the] peak of .[the] island /].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[cd-is-the-front-post-title]\
>
  [accessible-svg-title/cd-is-the-front-post-title
    "CD is the front post" diagram.
    Mark a point D along the ground, the location of the front post.
    At D, draw a vertical segment upward to C, the tip of the front post.
    CD represents the front post, and is shorter than the sea island AB.
    Draw a line through A and C, to meet the ground at E.
  /]
  
  [accessible-svg-content/
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH except DE ##>
    <line x1="0" y1="0" x2="3" y2="0"/>
    <line x1="4.2" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line \b x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## front line of sight ACE ##>
    <line \v x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text \g x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic-g x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## front pillar backward walk ED ##>
    <line \r x1="3" y1="0" x2="4.2" y2="0"/>
  
  /]
  
</svg>
||||

<<
  [b/丙丁爲前表/]，[r/戊丁爲前去表/]，\
  [g/戊爲人目/]，[v/戊丙甲爲前表望島峯/]。
||
  [b/$CD$ is .[the] front post/];
  [r/$ED$ is .[the] front .[walk's] separation from .[the] post/];
  [g/$E$ is .[the] man's eye/];
  [v/$ECA$ is .[the] front post's
  looking at .[the] peak of .[the] island/].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[fg-is-the-rear-post-title]\
>
  [accessible-svg-title/fg-is-the-rear-post-title
    "FG is the rear post" diagram.
    Mark a point G along the ground, the location of the rear post, \
    further than the front post from the sea island.
    At G, draw a vertical segment upward to F, the tip of the rear post.
    FG represents the rear post, \
    and is of the same height as the front post CD.
    Draw a line through A and F, to meet the ground at H.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH except HG ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \b x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line \v x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text \g x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic-g x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## rear post backward walk HG ##>
    <line \r x1="5.5" y1="0" x2="7.7" y2="0"/>
  
  /]
  
</svg>
||||

<<
  [b/己庚爲後表/]，[r/辛庚爲後去表/]，\
  [g/辛爲人目/]，[v/辛己甲爲後表望島峯/]。
||
  [b/$FG$ is .[the] rear post/];
  [r/$HG$ is .[the] rear .[walk's] separation from .[the] post/];
  [g/$H$ is .[the] man's eye/];
  [v/$HFA$ is .[the] rear post's looking at
    .[the] peak of .[the] island/].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[construct-fco-title]\
>
  [accessible-svg-title/construct-fco-title
    "Construct FCO" diagram.
    Draw a line through F and C, the tips of the rear and front posts, \
    to meet the sea island AB at O.
    Highlight OB and the posts CD and FG, \
    all three of which are the same height.
  /]
  
  [accessible-svg-content/
    
    <## sea island AB except OB ##>
    <line x1="0" y1="-3.5" x2="0" y2="-1"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## OB ##>
    <line \g x1="0" y1="-1" x2="0" y2="0"/>
    <## ground BH except GEDB ##>
    <line x1="5.5" y1="0" x2="7.7" y2="0"/>
    <## GEDB ##>
    <line \b x1="0" y1="0" x2="5.5" y2="0"/>
    <## front post CD ##>
    <line \g x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \g x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF ##>
    <line \r x1="0" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
  
  /]
  
</svg>
||||

<<
  與[b/庚戊丁乙/]平行[r/作己丙辰/]，則[g/辰乙與丙丁、己庚俱等/]。
||
  [r/Constructing $FCO$/] parallel with [b/$GEDB$/],
  [g/$OB$ .[is] equal with both $CD$ .[and] $FG$/].
>>
====
* 俱： both; \lit all
====

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[constructing-fi-title]\
>
  [accessible-svg-title/constructing-fi-title
    "Constructing FI" diagram.
    Construct FI parallel and equal in length to CE.
    Highlight IG and ED, which are the same length.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH except IG and ED ##>
    <line x1="0" y1="0" x2="3" y2="0"/>
    <line x1="4.2" y1="0" x2="5.5" y2="0"/>
    <line x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## ED ##>
    <line \g x1="3" y1="0" x2="4.2" y2="0"/>
    <## IG ##>
    <line \g x1="5.5" y1="0" x2="6.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF ##>
    <line x1="0" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE except CE ##>
    <line x1="0" y1="-3.5" x2="3" y2="-1"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## CE ##>
    <line \b x1="3" y1="-1" x2="4.2" y2="0"/>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line \r x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  與[b/丙戊/]平行[r/作己壬/]，則[g/壬庚與戊丁等/]。
||
  [r/Constructing $FI$/] parallel with [b/$CE$/],
  [g/$IG$ .[is] equal with $ED$/].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[similar-with-the-shape-aof-title]\
>
  [accessible-svg-title/similar-with-the-shape-aof-title
    "... similar with the shape AOF" diagram.
    Highlight the right-angled triangles FGH and AOF, which are similar.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB except AO ##>
    <line x1="0" y1="-1" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## AO ##>
    <line \r x1="0" y1="-3.5" x2="0" y2="-1"/>
    <## ground BH except GH ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <## GH ##>
    <line \b x1="5.5" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \b x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF ##>
    <line \r x1="0" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH except HF ##>
    <line \r x1="0" y1="-3.5" x2="5.5" y2="-1"/>
    <## HF ##>
    <line \b x1="7.7" y1="0" x2="5.5" y2="-1"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  [b/己庚辛形/]，與[r/甲辰己形/]同式。
||
  [b/.[The] shape $FGH$/] .[is] similar with
  [r/.[the] shape $AOF$/].
>>
====
* 同式： similar; \lit same form; \or same style
====

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[similar-with-the-shape-aoc-title]\
>
  [accessible-svg-title/similar-with-the-shape-aoc-title
    "... similar with the shape AOC" diagram.
    Highlight the right-angled triangles FGI and AOC, which are similar.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB except AO ##>
    <line x1="0" y1="-1" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## AO ##>
    <line \r x1="0" y1="-3.5" x2="0" y2="-1"/>
    <## ground BH except GI ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <line x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## GI ##>
    <line \b x1="5.5" y1="0" x2="6.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \b x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF except OC ##>
    <line x1="3" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## OC ##>
    <line \r x1="0" y1="-1" x2="3" y2="-1"/>
    <## front line of sight ACE except CA ##>
    <line x1="3" y1="-1" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## CA ##>
    <line \r x1="0" y1="-3.5" x2="3" y2="-1"/>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line \b x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  [b/己庚壬形/]，與[r/甲辰丙形/]同式。
||
  [b/.[The] shape $FGI$/] .[is] similar with
  [r/.[the] shape $AOC$/].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[hi-as-the-major-cathetus-title]\
>
  [accessible-svg-title/hi-as-the-major-cathetus-title
    "... HI as the major cathetus" diagram.
    Highlight the right-angled triangle FGI.
    Highlight the segment IH sticking out from the base of FGI.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH except GH ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <## GI ##>
    <line \b x1="5.5" y1="0" x2="6.7" y2="0"/>
    <## HI ##>
    <line \r x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \b x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF ##>
    <line x1="0" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line \b x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  己庚辛形，分[b/己庚壬形，同己庚句/]，而[r/辛壬爲股較/]。
||
  .[The] shape $FGH$ .[is] split into [b/.[the] shape $FGI$
  .[of the] same minor cathetus  $FG$/],
  with [r/$HI$ as .[the] major cathetus chariot-beam/].
>>

====
* 句： minor cathetus; \or shorter leg (of a right-angled triangle) \+
  Variant of 勾. \+
  A [cathetus] or leg is a non-hypotenuse side of a right-angled triangle.
  
  @@[cathetus]
    https://en.wikipedia.org/wiki/Cathetus
  @@

* 股： major cathetus; \or longer leg (of a right-angled triangle) \+
  Surveying the sea island from distances much greater than its height,
  the horizontal lengths will be much greater than
  the vertical lengths.
  Thus the relevant horizontal segments are referred to as major catheti~(股)
  and the relevant vertical segments as minor catheti~(句).

* 較： (horizontal) chariot-beam \+
  較，入聲，音覺， \C kok8, \M ji(a\)o \+
  If I understand [the entry in 《康熙字典》][較] correctly,
  較 are horizontal beams of a chariot which stick out like horns,
  above 輢 (the wooden vertical side boards)
  and above 軾 (which are the horizontal handrails for standing passengers).
  So 辛壬爲股較 is a very literary way of saying
  "$HI$ sticks out horizontally" (from $FGI$).
  
  @@[較]
    https://ctext.org/kangxi-zidian/159/6#n352070
  @@
====

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[fc-as-the-major-cathetus-title]\
>
  [accessible-svg-title/fc-as-the-major-cathetus-title
    "... FC as the major cathetus" diagram.
    Highlight the right-angled triangle AOC.
    Highlight the segment CF sticking out from the base of AOC.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB except AO ##>
    <line x1="0" y1="-1" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## AO ##>
    <line \b x1="0" y1="-3.5" x2="0" y2="-1"/>
    <## ground BH ##>
    <line x1="0" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF except OC ##>
    <line \r x1="3" y1="-1" x2="5.5" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## OC ##>
    <line \b x1="0" y1="-1" x2="3" y2="-1"/>
    <## front line of sight ACE except CA ##>
    <line x1="3" y1="-1" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## CA ##>
    <line \b x1="0" y1="-3.5" x2="3" y2="-1"/>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  甲辰己形，分[b/甲辰丙形，同甲辰句/]，而[r/己丙爲股較/]。
||
  .[The] shape $AOF$ .[is] split into [b/.[the] shape $AOC$
  .[of the] same minor cathetus  $AO$/],
  with [r/$FC$ as .[the] major cathetus chariot-beam/].
>>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[compared-unto-the-large-minor-cathetus-title]\
>
  [accessible-svg-title/compared-unto-the-large-minor-cathetus-title
    "... compared unto the large minor cathetus" diagram.
    Highlight the vertical segments AO and FG.
    Highlight the horizontal segments FC and HI.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB except AO ##>
    <line x1="0" y1="-1" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## AO ##>
    <line \v x1="0" y1="-3.5" x2="0" y2="-1"/>
    <## ground BH except HI ##>
    <line x1="0" y1="0" x2="6.7" y2="0"/>
    <## HI ##>
    <line \b x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \r x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF except FC ##>
    <line x1="0" y1="-1" x2="3" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## FC ##>
    <line \g x1="3" y1="-1" x2="5.5" y2="-1"/>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  以[b/小股較辛壬/]比[r/小句己庚/]，\
  若[g/大股較己丙/]比[v/大句甲辰/]。
||
  Using [b/.[the] small major cathetus chariot-beam $HI$/]
  .[to] compare unto [r/.[the] small minor cathetus $FG$/],
  .[is] like [g/.[the] large major cathetus chariot-beam $FC$/]
  compared unto [v/.[the] large minor cathetus $AO$/].
>>
====
* In modern notation,
  $$
    \begin{aligned}
      \frac{\colb{HI}}{\colr{FG}} &= \frac{\colg{FC}}{\colv{AO}}
        \\[\tallspace]
      \colv{AO} &= \frac{\colr{FG} \cdot \colg{FC}}{\colb{HI}}
    \end{aligned}
  $$
====

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[add-the-post-height-title]\
>
  [accessible-svg-title/add-the-post-height-title
    "Add the post height" diagram.
    Highlight the vertical segments OB, CD, and FG, which are the same height.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB except AO ##>
    <line \r x1="0" y1="-1" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## AO ##>
    <line \v x1="0" y1="-3.5" x2="0" y2="-1"/>
    <## ground BH except HI ##>
    <line x1="0" y1="0" x2="6.7" y2="0"/>
    <## HI ##>
    <line \b x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## front post CD ##>
    <line \r x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line \r x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF except FC ##>
    <line x1="0" y1="-1" x2="3" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## FC ##>
    <line \g x1="3" y1="-1" x2="5.5" y2="-1"/>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  /]
  
</svg>

||||
<<
  既得[v/甲辰/]，加[r/表高辰乙/]（即[r/丙丁/]），得甲乙，爲島高。
||
  Having obtained [v/$AO$/],
  add [r/.[the] post height $OB$/] (which is [r/$CD$/]),
  .[to] obtain $AB$, being .[the] height of .[the] island.
>>
====
* In modern notation,
  $$
    \begin{aligned}
      AB
        &= \colv{AO} + \colr{OB} \\[\tallspace]
        &= \frac{\colr{FG} \cdot \colg{FC}}{\colb{HI}} + \colr{OB}
          \\[\tallspace]
      \textq{island height}
        &=
          \frac{
            \textq{\colr{post height}}
            \textq{\colg{post separation}}
          }{
            \textq{\colb{mutual excess}}
          }
            +
          \textq{\colr{post height}}.
    \end{aligned}
  $$
  Remember
  $$
    \begin{aligned}
      \textq{\colb{mutual excess}}
        &= \colb{HI} \\
        &= HG - IG \\
        &= HG - ED \\
        &= \textq{rear post backward walk}
         - \textq{front post backward walk}.
    \end{aligned}
  $$
====

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-1 -4 9.2 5"
  \accessible-svg-attributes[compared-unto-the-split-major-cathetus-title]\
>
  [accessible-svg-title/compared-unto-the-split-major-cathetus-title
    "... compared unto the split major cathetus.
    Highlight the horizontal segments HI and IG.
    Highlight the horizontal segments FC and CO.
    Highlight the horizontal segments CO and DB, which are equal in length.
  /]
  
  [accessible-svg-content/
  
    <## sea island AB ##>
    <line x1="0" y1="-3.5" x2="0" y2="0"/>
    <text x="0" y="-3.5" \font-size
      dx="-1em" dy="0.3em">~~ 甲 ~~</text>
    <text \maths-italic x="0" y="-3.5" \font-size
      dx="-2.25em" dy="0.3em">A</text>
    <text x="0" y="0" \font-size
      dy="1.2em">~~ 乙 ~~</text>
    <text \maths-italic x="0" y="0" \font-size
      dy="2.7em">B</text>
    <## ground BH except GH and DB ##>
    <line x1="3" y1="0" x2="5.5" y2="0"/>
    <## HI ##>
    <line \b x1="6.7" y1="0" x2="7.7" y2="0"/>
    <## IG ##>
    <line \r x1="5.5" y1="0" x2="6.7" y2="0"/>
    <## DB ##>
    <line \v x1="0" y1="0" x2="3" y2="0"/>
    <## front post CD ##>
    <line x1="3" y1="-1" x2="3" y2="0"/>
    <text x="3" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 丙 ~~</text>
    <text \maths-italic x="3" y="-1" \font-size
      dx="0.4em" dy="-1.7em">C</text>
    <text x="3" y="0" \font-size
      dy="1.2em">~~ 丁 ~~</text>
    <text \maths-italic x="3" y="0" \font-size
      dy="2.7em">D</text>
    <## rear post FG ##>
    <line x1="5.5" y1="-1" x2="5.5" y2="0"/>
    <text x="5.5" y="-1" \font-size
      dx="0.4em" dy="-0.5em">~~ 己 ~~</text>
    <text \maths-italic x="5.5" y="-1" \font-size
      dx="0.4em" dy="-1.7em">F</text>
    <text x="5.5" y="0" \font-size
      dy="1.2em">~~ 庚 ~~</text>
    <text \maths-italic x="5.5" y="0" \font-size
      dy="2.7em">G</text>
    <## post height line OF except CO ##>
    <line \g x1="3" y1="-1" x2="5.5" y2="-1"/>
    <## CO ##>
    <line \v x1="0" y1="-1" x2="3" y2="-1"/>
    <text x="0" y="-1" \font-size
      dx="-1em" dy="0.3em">~~ 辰 ~~</text>
    <text \maths-italic x="0" y="-1" \font-size
      dx="-2.25em" dy="0.3em">O</text>
    <## front line of sight ACE ##>
    <line x1="0" y1="-3.5" x2="4.2" y2="0"/>
    <text x="4.2" y="0" \font-size
      dy="1.2em">~~ 戊 ~~</text>
    <text \maths-italic x="4.2" y="0" \font-size
      dy="2.7em">E</text>
    <## rear line of sight AFH ##>
    <line x1="0" y1="-3.5" x2="7.7" y2="0"/>
    <text x="7.7" y="0" \font-size
      dy="1.2em">~~ 辛 ~~</text>
    <text \maths-italic x="7.7" y="0" \font-size
      dy="2.7em">H</text>
    <## front line of sight translated unto rear FI ##>
    <line x1="5.5" y1="-1" x2="6.7" y2="0"/>
    <text x="6.7" y="0" \font-size
      dy="1.2em">~~ 壬 ~~</text>
    <text \maths-italic x="6.7" y="0" \font-size
      dy="2.7em">I</text>
  
  /]
  
</svg>
||||

<<
  [b/小股較辛壬/]比[r/分股壬庚/]，\
  若[g/大股較己丙/]比[v/分股丙辰/]（即[v/丁乙/]），\
  得[v/島去前表之遠/]。
||
  [b/.[The] small major cathetus chariot-beam $HI$/] compared unto
  [r/.[the] split major cathetus $IG$/],
  .[is] like
  [g/.[the] large major cathetus chariot-beam $FC$/] compared unto
  [v/.[the] split major cathetus $CO$/]
  (which is [v/$DB$/]);
  .[we] obtain [v/.[the] distance .[that the] island .[is] separated
  from .[the] front post/].
>>
====
* In modern notation,
  $$
    \begin{aligned}
      \frac{\colb{HI}}{\colr{IG}}
        &= \frac{\colg{FC}}{\colv{CO}} \\[\tallspace]
        &= \frac{\colg{FC}}{\colv{DB}} \\[\tallspace]
      \colv{DB}
        &=
          \frac{
            \colr{IG} \cdot \colg{FC}
          }{
            \colb{HI}
          }
          \\[\tallspace]
      \textq{\colv{island-post separation}}
      &=
        \frac{
          \textq{\colr{front post backward walk}}
          \textq{\colg{post separation}}
        }{
          \textq{\colb{mutual excess}}
        }.
    \end{aligned}
  $$
====

\cite-this-page[%title-en][sea-island][
  ~~ ``\textit{The} {Sea} {Island} {Computational} {Classic}'' ~~
]

%footer-element
