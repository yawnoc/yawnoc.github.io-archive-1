{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/superscripts.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P4
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P4](\/ You are viewing \P4)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P4. Names of large numbers
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P3 : ["i 3"]
    \nav-curr: \P4
    \nav-next: \P5 : ["i 5"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph introduces a "long scale" for __named powers of ten__.
Note that the [previous paragraph (\P3)] ["i 3"] uses a "short scale".
----


##{#translation}
  Translation
##

----
Chinese source text: \a[6], \b[147], \c[52060], \d[13]. \+
\d-default
----

<<
  凡大數之法， \+
  萬萬曰億， \+
  萬萬億曰兆， \+
  萬萬兆曰京， \+
  萬萬京曰陔， \+
  萬萬陔曰秭， \+
  萬萬秭曰壤， \+
  萬萬壤曰溝， \+
  萬萬溝曰澗， \+
  萬萬澗曰正， \+
  萬萬正曰載。
||
  .[In the] method of all large numbers: \+
  .[a] myriad myriad .[is] called .[a] square-myriad; \+
  .[a] myriad myriad square-myriad .[is] called .[a] multitude; \+
  .[a] myriad myriad multitude .[is] called .[a] capital; \+
  .[a] myriad myriad capital .[is] called .[a] terrace; \+
  .[a] myriad myriad terrace .[is] called .[a] haystack; \+
  .[a] myriad myriad haystack .[is] called .[a] soil; \+
  .[a] myriad myriad soil .[is] called .[a] ditch; \+
  .[a] myriad myriad ditch .[is] called .[a] stream; \+
  .[a] myriad myriad stream .[is] called .[a] right; \+
  .[a] myriad myriad right .[is] called .[a] carry.
>>
====
* \c[52060] erroneously has 萬萬澗日正 for 萬萬澗曰正.
====


##{#commentary}
  Extended commentary
##

----
Here we have a "long scale" where the named quantities go up
by a factor of 10 ** 8:
----
$$
\begin{aligned}
  \unit{square-myriad~(億)} &= 10^8 \\
  \unit{multitude~(兆)} &= 10^{16} \\
  \unit{capital~(京)} &= 10^{24} \\
  \unit{terrace~(陔)} &= 10^{32} \\
  \unit{haystack~(秭)} &= 10^{40} \\
  \unit{soil~(壤)} &= 10^{48} \\
  \unit{ditch~(溝)} &= 10^{56} \\
  \unit{stream~(澗)} &= 10^{64} \\
  \unit{right~(正)} &= 10^{72} \\
  \unit{carry~(載)} &= 10^{80}.
\end{aligned}
$$
----
Recall that in the [previous paragraph (\P3)] ["i 3"],
we had a "short scale" where the named quantities
only went up by a factor of 10.
----

----
In modern usage, a "medium scale" is used where
the named quantities go up by a factor of 10 ** 4.
In summary:
----

||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ; Quantity
    ; Rendering
    ; [\P3] ["i 3"]
    ; [\P4] ["i 4"]
    ; Modern
|:
  ==
    , 億
    , square-myriad
    , 10 ** 8
    , 10 ** 8
    , 10 ** 8
  ==
    , 兆
    , multitude
    , 10 ** 9
    , 10 ** 16
    , 10 ** 12
  ==
    , 京
    , capital
    , 10 ** 10
    , 10 ** 24
    , 10 ** 16
  ==
    , 陔
    , terrace
    , 10 ** 11
    , 10 ** 32
    , 10 ** 20
  ==
    , 秭
    , haystack
    , 10 ** 12
    , 10 ** 40
    , 10 ** 24
  ==
    , 壤
    , soil
    , 10 ** 13
    , 10 ** 48
    , 10 ** 28
  ==
    , 溝
    , ditch
    , 10 ** 14
    , 10 ** 56
    , 10 ** 32
  ==
    , 澗
    , stream
    , 10 ** 15
    , 10 ** 64
    , 10 ** 36
  ==
    , 正
    , right
    , 10 ** 16
    , 10 ** 72
    , 10 ** 40
  ==
    , 載
    , carry
    , 10 ** 17
    , 10 ** 80
    , 10 ** 44
''''
||||
||||||

----
Note that 兆, "multitude", is also used for the SI Prefix mega~(10 ** 6).
Confusing eh?
----


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P3 : ["i 3"]
    \nav-curr: \P4
    \nav-next: \P5 : ["i 5"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P4"
][
  sun-tzu-i-4
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P4}''~~
]

%footer-element
