{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "Record of the Lion's Pavilion, Victoria Peak" 《太平山獅子亭記》
  %title-en "Record of .[the] Lion's Pavilion, Victoria~Peak"
  %date-created 2019-04-07
  %date-modified 2020-07-17
  \resources:rendering
  %description
    An English translation of 《太平山獅子亭記》, \
    "Record of the Lion's Pavilion, Victoria~Peak", \
    the text on a plaque in the Lion's Pavilion, Victoria Peak, Hong Kong.
  %css
    .level-tone {
      color: green;
    }
    .sloped-tone {
      color: #e00;
    }
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:translation
* \header-link:cite
====]]


#
  《太平山獅子亭記》 \+
  %title-en
#

[||||
||||]


----
This is a semi-literary text on a plaque in the Lion's Pavilion,
[Victoria Peak], Hong~Kong.
Unfortunately I did not photograph the left half of the plaque.
From memory it contained a list of names of contributors to the funding
(referred to in the text as 諸君子, ".[the] multiple gentlemen"),
but no mention of the author.
----

@@[Victoria Peak]
  https://en.wikipedia.org/wiki/Victoria_Peak
@@

||||{.centred-block}
  ![Photograph of the plaque text.][plaque text small]
||||

@@[plaque text small]
  lion-pavilion-small.jpg
@@

----
__High-resolution version:__ [`lion-pavilion.jpg`~(1.6~MB)](
  https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
    lit/lion-pavilion.jpg
)
----


##{#translation}
  Translation
##

----
The inserted punctuation is my own.
----

<<
  《太平山獅子亭記》
||
  "Record of .[the] Lion's Pavilion, Victoria~Peak"
>>

<<
  太平山，古稱鼇峰，南臨大海，北與九龍諸山遥遥相望，\
  岡巒連綿，林木蔚茂，風景絶美。
||
  Victoria Peak, .[in] ancient .[times] referred to .[as]
  .[the] Peak of the Great Sea Turtle,
  overlooks .[the] great sea .[unto the] south,
  .[and is in] far, far mutual looking .[unto the] north
  with .[the] multiple mountains of Kowloon;
  .[its] ridges .[and] small, pointed hills .[are] connected .[and] unbroken,
  .[its] woods .[and] trees thriving .[and] flourishing,
  .[and its] sights .[and] scenery absolutely beautiful.
>>
====
* 太平山： Victoria Peak； \lit Mount~Tranquility; \or Mount~Peace

* 鼇：海中大鱉也； the Great Sea Turtle \+
  鼇，牛刀切， \C ngou4, \M (a/)o

* 峰： Peak; \or Summit

* 臨：居高臨下；臨，視也； overlooks

* 岡：山脊也； ridges; \lit mountain backs

* 巒：山小而銳；又山綿連曰巒；
    small, pointed hills; \or unbroken .[and] connected hills \+
  巒，音鑾， \C l(u")n4, \M lu(a/)n

* 蔚：茂也； thriving; \or flourishing \+
  蔚，音尉， \C wai3, w(e\)i
====

<<
  我獅子會，建亭於芬尼徑側，為主亭一，前亭五，如北辰居中，而五星拱之。
||
  We .[the] Lions Club, built .[the] Pavilion
  to .[the] side of Findlay~Path,
  composed of one main Pavilion, .[and] five fore Pavilions,
  like .[the] North Star abiding in .[the] centre,
  with .[the] Five Planets going round it.
>>
====
* 建： built; \or constructed

* 主： main; \or primary

* 北辰： North Star

* 居： abiding in; \or dwelling in

* 五星： .[the] Five Planets \+
  These are 金木水火土,
  i.e.~Venus, Jupiter, Mercury, Mars and Saturn respectively.

* 拱，拱翊，環衛也： going round \+
  The line 如北辰居中，而五星拱之 is a nod to Confucius
  in [《論語\.為政》](https://ctext.org/analects/wei-zheng):
  <<
    子曰：為政以德，譬如北辰，居其所而眾星共之。
  ||
    .[The] Master said,
    .[He who] governeth using virtue
    .[is] like .[the] North Star, abiding in its place with
    .[the] multitude of stars going round it.
  >>
  Here, 共 is interchangeable with 拱.
====

<<
  丹楹畫檻，通以月門，悉依古制。
||
  .[With] red-painted columns .[and] drawing-decorated balustrades,
  through to .[the] Moon Gate,
  all .[were] made according to the olden.
>>
====
* 楹：柱也； columns \+
  楹，以成切， \C ying4, \M y(i/)ng \+
  The phrase 丹楹 refers generally to good looking architecture,
  as in 丹楹刻桷, i.e.~"red-painted columns .[and] carved square rafters".

* 畫： drawing-decorated \+
  畫，去聲， \C waa6, hu(a\) \+
  \/**Not** 入聲~(waak9), and **not** vernacularised into 上聲~(waa2).
  Compare 畫欄, waa6 laan4, as in 畫欄風擺竹橫斜 of 《再世紅梅記\.脫穽救裴》,
  as sung by [任劍輝], [龍劍笙], and [蓋鳴暉].
  
  @@[任劍輝]
    https://youtu.be/NFcPhd74LwM
  @@
  @@[龍劍笙]
    https://youtu.be/QLtQGJ7YeaA
  @@
  @@[蓋鳴暉]
    https://youtu.be/cdcasHCsnpY
  @@
  
  <## 平仄 ##>
  
  Z{%
    \[ l
      /
        (?P<content> [\S]*? )
      /
    \]
  %
    <span class="level-tone">\g<content></span>
  %}
  
  Z{%
    \[ s
      /
        (?P<content> [\S]*? )
      /
    \]
  %
    <span class="sloped-tone">\g<content></span>
  %}
  
  As to why the author of the plaque text chose
  畫檻~(waa6 laam6) over the more common
  畫欄~(waa6 laan4) whose meaning is the same,
  perhaps it is to balance the tone pattern.
  [l/丹楹/][s/畫檻/] has the pattern [l/平平/][s/仄仄/],
  whereas
  [l/丹楹/][s/畫/][l/欄/] has [l/平平/][s/仄/][l/平/].

* 檻： balustrades; \or rails \+
  檻，音艦， \C laam6, \M ji(a\)n

* 月門：
    [Moon Gate](https://en.wikipedia.org/wiki/Moon_gate);
    \or Moon Entrance
====

<<
  春秋佳日，中西人士聨翩蒞止，登斯亭也。
||
  .[On a] good spring .[or] autumn day,
  .[both] Chinese .[and] Western people continuously flock .[here to] visit,
  ascending to this Pavilion.
>>
====
* 聨翩：接連不斷；翩，疾飛也； continuously flock; \lit rapidly fly together \+
  翩，音篇， \C p'een1, \M pi(a-)n \+
  "Flock" preserves the connotation with bird flight.

* 蒞止：蒞，臨也； visit \+
  蒞，力地切，音利， \C lei6, \M l(i\)
====

<<
  可俯瞰維多利亞海港南北两岸，其間朝暉夕陰，晴光雨色，千變萬化，殆如畫圖。
||
  .[One] can face downwards .[and] overlook .[the] two shores,
  southern .[and] northern, of Victoria~Harbour;
  amidst these, .[the] morning sunshine .[and the] even darkness,
  .[and the] clear light .[and the] rainy hues,
  .[undergo a] thousand changes .[and a] myriad tranformations,
  as .[in] paintings .[and] drawings.
>>
====
* 瞰：視也；又俯視曰瞰； overlook; \or look at \+
  瞰，音磡， \C ham3, \M k(a\)n

* 晴： clear; \or fine

* 殆 \+
  Not certain. Looking through the meanings listed in
  [《康熙字典》](https://ctext.org/kangxi-zidian/78/5#n331910):
  ++++
  1. 危也；
      perilous; \or endangered \+
      No.
  
  2. 近也；
      close \+
      No. Surely the actual sight is _better_ than paintings and drawings,
      and not just "close".
  
  3. 始也；
      begin to \+
      No.
  
  4. 將也，幾也；
      almost; \or nearly \+
      No. Same as~2.
  
  5. 
      志操精果謂之誠，反誠爲殆；
      opposite of 誠, which is 志操精果 \+
      No.
  
  6. 與怠通
      (interchangeable with 怠) \+
      No.
  
  7.
    叶養里切，音以。\
    《楚辭\.天問》女歧縫裳，而館同爰止。何顚易厥首，而親以逢殆。 \+
      No.
  
  ++++
  
  《分韻撮要》 simply gives 危也；又語詞,
  i.e.~"perilous; also .[a] speech-.[assist] word".
  I think this is the correct meaning.
====

<<
  山中復有竒花異草可以觀賞，幽泉怪石可以遊遨。
||
  Amidst .[the] mountain, there are also rare flowers .[and] strange grasses
  which .[one] can see .[and] appreciate,
  .[and] secluded springs .[and] oddly-.[shaped] rocks
  which .[one] can tour .[and] roam.
>>
====
* 草： grasses \+
  More generally 草 refers to any green plant which is not a tree.

* 賞： appreciate; \or admire

* 怪石： oddly-.[shaped] rocks; \lit strange rocks \+
  Alternatively, 怪石，似玉也, "rocks like jade", from Kuo P'u ((郭璞))'s
  [annotations of 《山海經》](
    https://books.google.com.au/books\
      ?id=vOxbAAAAcAAJ&pg=PP130\
      &dq=%E5%B1%B1%E6%B5%B7%E7%B6%93+%E6%80%AA%E7%9F%B3\
      &hl=en\
      &sa=X&ved=0ahUKEwj_goLp7obhAhUKbn0KHQDSAk0Q6AEIMDAB#v=onepage\
      &q=%E5%B1%B1%E6%B5%B7%E7%B6%93%20%E6%80%AA%E7%9F%B3\
      &f=false
  ).
====

<<
  而遠近松風，又如笙竽合奏，耳目所接，無一而不足快。亦遊息之佳所也。
||
  And .[the] far .[and] near wind .[through] the pine tree,
  .[is] also like the sh(e^)ng ((笙)) .[and] the y(u") ((竽))
  playing .[in] ensemble;
  .[among] that which the ear .[and] the eye receiveth,
  not one .[thing] .[is] not sufficient .[or] pleasing.
  .[It is] also .[a] good place .[for]
  travel .[and] rest.
>>
====
* 笙： sh(e^)ng \+
  A mouth-blown [free reed instrument][笙].

* 竽： y(u") \+
  Also a [free reed instrument][竽].
====

@@[笙]
  https://en.wikipedia.org/wiki/Sheng_(instrument)
@@
@@[竽]
  https://en.wikipedia.org/wiki/Yu_(wind_instrument)
@@

<<
  亭之建，倡自一九七三年。
||
  .[The] construction of .[the] Pavilion,
  .[was] suggested in .[the] year 1973.
>>
====
* 倡： suggested; \or .[first] advocated for
====

<<
  洪磋景、福伯齡，先後任會長，與諸君子規畫其事，蒙當局撥地興工。
||
  Hung Ts'or-king ((洪磋景)) .[and] Fook Pak-ling ((福伯齡))
  served as Club Chairman, .[one] after .[the] other,
  .[and] planned those matters with .[the] multiple gentlemen,
  .[and] received from .[the] local authority
  .[an] allocation of land .[with which to] begin work.
>>
====
* 先後： .[one] after .[the] other; \lit before .[and] after

* 蒙： received from \+
  This is very formal.
  It almost reads like ".[gratefully] received from".
====

<<
  而形制則前會長百强則師，任之不受酬。其建築布置諸費，凡共五十萬元。
||
  And .[of designing the] form .[and] structure,
  .[the] former club chairman Pak-k'eung ((百强)) .[the] architect
  served this role without receiving payment.
  Its various construction .[and] arrangement costs,
  altogether totalled five hundred thousand dollars.
>>
====
* 百强： Pak-k'eung \+
  The name of the architect.
  According to [a separate plaque]
  his full name is Ch'an Pak-k'eung ((陳百强)).
  I have no idea why he is referred to by first name only.
  Note that he shares the same full name with [Danny Chan] (1958--1993).
  
  @@[a separate plaque]
    https://commons.wikimedia.org/wiki/\
      File:HK_TaiPingShanLionsViewPointPavilion_1976and1992.JPG
  @@
  @@[Danny Chan]
    https://en.wikipedia.org/wiki/Danny_Chan
  @@

* 則師： architect \+
  The use of 則 to mean architectural drawing, as in 圖則,
  appears to be local to Hong Kong.
  And in this context it is pronounced tsik7, not tsak7,
  although I have yet to come across a dictionary which
  lists this pronunciation.
====

<<
  以一九七六年九月落成，是月三日，由市政局沙利士主席行接收禮。
||
  .[It was] completed in September of .[the] year 1976,
  .[and on the] 3rd day of this month,
  .[the] ceremony of receiving .[was] performed by
  Chairman Sales of .[the] Urban Council.
>>
====
* 市政局：
    [Urban Council](https://en.wikipedia.org/wiki/Urban_Council);
    \lit City Administration Department \+
  Disbanded post 1997,
  in favour of new bodies appointed by the government
  rather than elected by citizens.

* 沙利士： Sales \+
  [Arnaldo de~Oliveira Sales](
    https://en.wikipedia.org/wiki/Arnaldo_de_Oliveira_Sales
  ).
====

<<
  吾聞獅子得金精之剛，聲吼如雷，天地皆動。
||
  I hear .[that the] lion receiveth
  .[the] strength of .[the] essence of metal;
  .[its] sounds .[and] roars .[are] like thunder:
  all Heaven .[and] Earth .[are] moved .[by it].
>>
====
* 金精： .[the] essence of metal \+
  Perhaps "essence of .[the] west",
  since metal~(金) is the element associated with
  the cardinal direction west.

* 剛： strength; \or toughness
====

<<
  今兹之舉，賴諸君子如響斯應，相輔相成，其力不啻雄獅。
||
  .[This] deed, here .[and] now,
  dependeth upon .[the] multiple gentlemen
  .[having] sounded .[a] response .[to the calls],
  mutually assisting .[and] mutually fulfilling,
  their efforts no less than .[the] mighty lion's.
>>
====
* 今兹： here .[and] now; \lit now .[and] here

* 舉： deed; \or .[commendable] action

* 力： efforts; \lit strength

* 啻： less than; \lit only; \or merely \+
  啻，音翅， \C [^ch']ee3 (\pm [_ts']ee3), \M ch(i\)
====

<<
  尤望來遊者，亦步健神旺，顧盼自如，而與獅子同也。
||
  .[I] especially hope .[for the]
  traveller .[who] cometh, .[to] also .[have an]
  healthy step .[and an] energetic spirit,
  looking back .[and] looking forth
  according to .[his] own .[will],
  and .[be the] same as .[a] lion.
>>
====
* 望： hope; \or wish

* 神： spirit; \or mind
====

<<
  爰書，是以記之。
||
  .[A] prisoner's document: this to record it.
>>
====
* 爰書：
    .[a] prisoner's document;
    \or .[my writing is but a] prisoner's document \+
  An affidavit given by a prisoner, the term supposedly
  derived from the text of the affidavit being changed: 爰，易也，換也。
  Here the author of the plaque text closes \
  by self-deprecating his own work.
====

\cite-this-page[%title-en][lion-pavilion][
  ~~ ``{Record} of \textit{the} {Lion's} {Pavilion}, {Victoria}~{Peak}'' ~~
]

%footer-element
