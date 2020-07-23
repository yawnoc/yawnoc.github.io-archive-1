{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P1
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P1](\/ You are viewing \P1)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P1. Units of length (or distance)
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: Vol.~I : ["i"]
    \nav-curr: \P1
    \nav-next: \P2 : ["i 2"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph introduces __Chinese units of length__
and gives the conversion rates between them.
----


##{#translation}
  Translation
##

----
Chinese source text: \a[4], \b[146], \c[52058], \d[11]. \+
\d-default
----

<<
  度之所起，起於忽。欲知其忽，蠶吐絲為忽。
||
  .[Of] that which measuring of length beginneth from:
  beginneth .[it] from floss.
  Wishing to know .[the size of] floss:
  .[the] silk spat of the silkworm be floss.
>>
====
* 度： measuring of length \+
  度，入聲， \C tok9, \M duo\ (\gr du(o/))

* 起： beginneth from; \lit ariseth from

* 忽： floss \+
  Hu ((忽)), a hundred-thousandth of the Chinese inch, ts'un ((寸)).
  [K'ang-hi's Dictionary](https://ctext.org/kangxi-zidian/61/4#n326385),
  quoting 《劉德曰》, "Liu T(e^)'s sayings",
  has 忽，蜘蛛網也, "floss, .[a] spider's web".

* \c[52058] has 蠶所生，吐絲為忽.
====

<<
  十忽為一絲， \+
  十絲為一毫， \+
  十毫為一釐， \+
  十釐為一分， \+
  十分為一寸， \+
  十寸為一尺， \+
  十尺為一丈， \+
  十丈為一引；
||
  Ten flosses make one thread; \+
  ten threads make one mil; \+
  ten mils make one cent; \+
  ten cents make one tenth; \+
  ten tenths make one inch; \+
  ten inches make one rule; \+
  ten rules make one rod; \+
  ten rods make one draw.
>>
====
* 絲： (silk) thread \+
  Ss(uu) ((絲)), a ten-thousandth of the Chinese inch, ts'un ((寸)).

* 毫： mil; \or thou; \lit fine hair \+
  Hao ((毫)), a thousandth of the Chinese inch, ts'un ((寸)).
  Similar to the imperial [mil or thou].
  
  @@[mil or thou]
    https://en.wikipedia.org/wiki/Thousandth_of_an_inch
  @@

* 釐： cent \+
  Li ((釐)), a hundredth of the Chinese inch, ts'un ((寸)).

* 分： tenth \+
  F(e^)n ((分)), a tenth of the Chinese inch, ts'un ((寸)).

* 寸： inch \+
  Ts'un ((寸)), the [__Chinese inch__] [寸].
  Of the same order of magnitude as the imperial inch,
  and used figuratively as the inch is in English
  to denote a small distance,
  so I am happy to simply render it as "inch".
  
  @@[寸]
    https://en.wikipedia.org/wiki/Cun_(unit)
  @@

* 尺： rule; \or ruler; \or covid \+
  Ch'ih ((尺)), ten Chinese inches.
  This is of the order one foot,
  but I have not rendered this as "foot"
  because there is no such connotation.
  Some translate this as "cubit",
  but a cubit is more like one and a half feet, or even two.
  The term "covid" appears to have been used in colonial Hong Kong,
  but I can't seem to find much about it on the internet...
  thanks a lot, WHO.

* 丈： rod; \or staff; \or measure \+
  Chang ((丈)), ten rules.
  Difficult to render because Chinese dictionaries
  simply define it as ten rules.
  More generally its meanings are "elder male",
  from the interchangeable 杖 or "walking stick",
  and "to measure/survey land".
  I have chosen "rod" for its few letters \& monosyllabicity,
  and because of the [imperial rod],
  of the same order of magnitude and also related to surveying.
  Also Moses had one.
  
  @@[imperial rod]
    https://en.wikipedia.org/wiki/Rod_(unit)
  @@

* 引： \lit draw; \or pull \+
  Yin ((引)), ten rods.
====

<<
  五十尺為一端； \+
  四十尺為一匹； \+
  六尺為一步。
||
  Fifty rules make one end; \+
  forty rules make one length; \+
  six rules make one pace.
>>
====
* 端： \lit end \+
  Tuan ((端)), fifty rules.

* \b[146] erroneously has 五十引為一端.

* 匹： length \+
  P'i ((匹)), forty rules.
  This is the only unit rendering which I am unsatisfied with.
  匹 is the classifier for cloth, 一匹布 being "one length of cloth".

* 步： pace; \or step \+
  Pu ((步)), the Chinese pace, six rules.
====

<<
  二百四十步為一畝。
||
  Two hundred .[and] forty paces make one acre.
>>
====
* 畝： acre; \lit field \+
  Mu ((畝)), 240~square paces.
  Classical Chinese mathematics did not have
  a fully developed notion of dimensional analysis,
  so 'square paces' were simply referred to as 'paces'.
  While a mu ((畝)) is only about a fifth of an [imperial acre],
  I have chosen to render it acre
  because both have the etymological meaning "field".
  
  @@[imperial acre]
    https://en.wikipedia.org/wiki/Acre
  @@
====

<<
  三百步為一里。
||
  Three hundred paces make one mile.
>>
====
* 里： mile \+
  Li ((里)), the [Chinese mile] [里], of the order half a kilometre.
  While this is much shorter than the imperial mile,
  it is figuratively used as the mile is in English
  to denote a large distance,
  so I am happy to simply render it as "mile".
  
  @@[里]
    https://en.wikipedia.org/wiki/Li_(unit)
  @@
====


##{#commentary}
  Extended commentary
##

----
I can't be bothered looking up a reputable source
for the precise length of a ch'ih ((尺)) or rule
when \sun-tzu's Computational Classic was first written,
but using 0.3~metres as an estimate,
we have:
----
$$
  \begin{alignedat}{3}
    1 \unit{floss~(忽)} &={} & 10^{-6} & \unit{rules} && \sim 0.3 \unit{μm} \\
    1 \unit{thread~(絲)} &={} & 10^{-5} & \unit{rules} && \sim 3 \unit{μm} \\
    1 \unit{mil~(毫)} &={} & 10^{-4} & \unit{rules} && \sim 30 \unit{μm} \\
    1 \unit{cent~(釐)} &={} & 10^{-3} & \unit{rules} && \sim 0.3 \unit{mm} \\
    1 \unit{tenth~(分)} &={} & 10^{-2} & \unit{rules} && \sim 3 \unit{mm} \\
    1 \unit{inch~(寸)} &={} & 10^{-1} & \unit{rules} && \sim 30 \unit{mm} \\
    1 \unit{rule~(尺)} &={} & 1 & \unit{rule} && \sim 0.3 \unit{m} \\
    1 \unit{rod~(丈)} &={} & 10 & \unit{rules} && \sim 3 \unit{m} \\
    1 \unit{draw~(引)} &={} & 100 & \unit{rules} && \sim 30 \unit{m} \\
    1 \unit{end~(端)} &={} & 50 & \unit{rules} && \sim 15 \unit{m} \\
    1 \unit{length~(匹)} &={} & 40 & \unit{rules} && \sim 12 \unit{m} \\
    1 \unit{pace~(步)} &={} & 6 & \unit{rules} && \sim 1.8 \unit{m} \\
    1 \unit{acre~(畝)} &={} & 240 & \unit{paces}^2 && \sim 780 \unit{m}^2 \\
    1 \unit{mile~(里)} &={} & 300 & \unit{paces} && \sim 540 \unit{m}.
  \end{alignedat}
$$

----
Silk is around 12~μm in thickness ([UAF], [Luong~_et~al._~(2014)][Luong])
so hu ((忽)), "floss", is much too thin,
and ss(uu) ((絲)), "(silk) thread", still a little thin.
Thus 蠶吐絲為忽, ".[the] silk spat of the silkworm be floss",
is an exaggeration of the thinness of silk.
But my job is only to translate the text as it is, not to correct it.
----

@@[UAF]
  https://www.uaf.edu/lars/qiviut/fine-fibers/
@@
@@[Luong]
  https://www.researchgate.net/publication/\
    263089345_\
    Investigation_of_the_Silk_Fiber_Extraction_Process_\
    from_the_Vietnam_Natural_Bombyx_Mori_Silkworm_Cocoon
@@

----
By the later part of the Ts'ing Dynasty,
one ch'ih ((尺)) or rule is 14⅝~inches in Hong Kong,
locally called a ch'ek ((尺)).
Reading through historical versions of the [Weights and Measures Ordinance]
enacted by the British in Hong Kong,
[Ordinance No.~22 of~1844 (PDF)] [ord 22 of 1844]
gives the following conversions between Chinese length units
(consistent with those above):
----

||||{.centred-block}
  ![
    Image of Ordinance No.~22 of~1844, British Hong Kong.
    Measures of Length.
    w~~
      Ten Fun, 分 make one 寸 Tsun.
      Ten Tsun, 寸 make one 尺 Chih. (or Covid.)
      Ten Chih, 尺 make one 丈 Chang.
      Ten Chang, 丈 make one 引 Yin.
    ~~
  ](
    ord-1844-no-22-length.jpg
  )
||||

@@[Weights and Measures Ordinance]
  https://oelawhk.lib.hku.hk/exhibits/show/oelawhk/searchresult\
    ?stext=weight+measure\
    &x=16&y=15&sfield=ZZ&edition=1890&no_result=10
@@
@@[ord 22 of 1844]
  http://oelawhk.lib.hku.hk/archive/files/\
    9c24f167a27b616a75db9691574eb925.pdf
@@
@@[ord 8 of 1885]
  http://oelawhk.lib.hku.hk/archive/files/\
    52fa22f83069cf6a385779d462a0f6e7.pdf
@@

----
However, it is very interesting to note that
the British only standardised these
Chinese length units with reference to English units
in [Ordinance No.~8 of~1885 (PDF)] [ord 8 of 1885],
more than four decades later:
----

||||{.centred-block}
  ![
    Image of Ordinance No.~8 of~1885, British Hong Kong.
    Length.
      One Chek (foot) equal to fourteen and five eighths English inches,
      divided into ten Tsün or inches,
      and each inch into ten Fan or tenths.
  ](
    ord-1885-no-8-length.jpg
  )
||||

----
Eventually the ch'ek ((尺)) is given
the equivalent definition of 0.371475~metres,
used unto this day in Hong Kong;
see [Cap.~68 Weights and Measures Ordinance] [cap 68].
(Floor plans are reckoned in imperial feet though, written "呎".)
----

@@[cap 68]
  https://www.elegislation.gov.hk/hk/cap68
@@

----
Taiwan uses a ch'ih ((尺)) from the Japanese occupation
equal to 10/33 of a metre, i.e.~0.3030...~metres,
and Mainland China uses a metric-based ch'ih ((尺))
equal to 1/3 of a metre, i.e.~0.3333...~metres.
In either case, ugh to recurring decimals.
----

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: Vol.~I : ["i"]
    \nav-curr: \P1
    \nav-next: \P2 : ["i 2"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P1"
][
  sun-tzu-i-1
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P1}''~~
]

%footer-element
