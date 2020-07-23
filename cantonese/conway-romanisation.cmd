{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/svg-styles.cmd +}

%%
  %title Conway's Romanisation for Cantonese
  %date-created 2019-04-07
  %date-modified 2020-04-19
  \resources:rendering
  %description
    Conway's Romanisation for Cantonese, \
    with English approximations and a diagram of the nine tones.
  %css a~~
    .alternatives-separator {
      font-weight: bold;
      margin-left: 1em;
    }
    .approximation-part,
    .conway-romanisation,
    .tone {
      color: darkviolet;
      font-weight: bold;
    }
    .wrong {
      color: #e00;
    }
    .example {
      border: 2px solid black;
      font-size: large;
      padding: 0.3em 0.4em;
    }
  ~~
%%


[[====
* \header-link:home
* \header-link:top
* [Examples](#examples Examples)
* \header-link:cite
====]]


# %title #


[||||
See also:
  [\[Python\] Cantonese Diceware (GitHub)](
    https://github.com/yawnoc/cantonese-diceware
  )
||||]

[====
* [Initials](#initials)
* [{ts~vs~ch}](#ts-vs-ch)
* [Finals](#finals)
* [Tones](#tones)
* [Compact tables](#compact-tables)
* [Examples](#examples)
====]


----
This is my custom romanisation system for Cantonese,
as spoken and perceived by me.
----


<## Conway romanisation / tone [. .] ##>
{%
  \[ [.]
  (?P<tone> [1-9] )
  [.] \]
%
  <span class="tone">\g<tone></span>
%}
{%
  \[ [.]
  (?P<content> [\S]*? )
  [.] \]
%
  <span class="conway-romanisation">\g<content></span>
%}

<## Approximation parts [: :] ##>
{%
  \[ [:]
  (?P<content> [\S]*? )
  [:] \]
%
  <span class="approximation-part">\g<content></span>
%}


##{#initials}
  Initials (聲)
##

[====
* [(p p' m f)](#labial)
* [(t t' n l)](#plain-dental-alveolar)
* [(k k' ng h kw k'w w)](#velar-glottal)
* [(ts ch ts' ch' s sh y)](#sibilant-palatal)
====]


<## Header rows for tables ##>
{%
  \\header[-]row
  \[
    (?P<type> initials | finals )
  \]
%
  |^
    ==
      ; \\heading-cell[\g<type>]
      ; IPA
      ; Conway
      ; Jyutping
      ; Yale
      ; S.~Lau
      ; Conway's approximation
  |:
%}
{: \heading-cell[initials] : Initials (聲) :}
{: \heading-cell[finals] : Finals (韻) :}


###{#labial}
  Labial
###

||||{.overflowing}
''''
  \header-row[initials]
  ==
    , 巴
    , [p]
    , [.p.]
    , b
    , b
    , b
    , [[:p:] as in s[:p:]y]
  ==
    , 怕
    , [pʰ]
    , [.p'.]
    , p
    , p
    , p
    , [[:p:] as in [:p:]ie]
  ==
    , 媽
    , [m]
    , [.m.]
    , m
    , m
    , m
    , [[:m:] as in [:m:]y]
  ==
    , 花
    , [f]
    , [.f.]
    , f
    , f
    , f
    , [[:f:] as in [:f:]ee]
''''
||||


###{#plain-dental-alveolar}
  Plain dental/alveolar
###

||||{.overflowing}
''''
  \header-row[initials]
  ==
    , 打
    , [t]
    , [.t.]
    , d
    , d
    , d
    , [[:t:] as in s[:t:]y]
  ==
    , 他
    , [tʰ]
    , [.t'.]
    , t
    , t
    , t
    , [[:t:] as in [:t:]ie], in Received Pronunciation
  ==
    , 那
    , [n]
    , [.n.]
    , n
    , n
    , n
    , [[:n:] as in [:n:]igh]
  ==
    , 啦
    , [l]
    , [.l.]
    , l
    , l
    , l
    , [[:l:] as in [:l:]ie]
''''
||||


###{#velar-glottal}
  Velar and glottal
###

||||{.overflowing}
''''
  \header-row[initials]
  ==
    , 家
    , [k]
    , [.k.]
    , g
    , g
    , g
    , [[:k:] as in s[:k:]y]
  ==
    , 卡
    , [kʰ]
    , [.k'.]
    , k
    , k
    , k
    , [[:k:] as in [:k:]ey]
  ==
    , 牙
    , [ŋ]
    , [.ng.]
    , ng
    , ng
    , ng
    , [[:ng:] as in si[:ng:]er]
  ==
    , 蝦
    , [h]
    , [.h.]
    , h
    , h
    , h
    , [[:h:] as in [:h:]e]
  ==
    , 瓜
    , [kʷ]
    , [.kw.]
    , gw
    , gw
    , gw
    , [[:qu:] as in s[:qu:]eeze]
  ==
    , 誇
    , [kʷʰ]
    , [.k'w.]
    , kw
    , kw
    , kw
    , [[:qu:] as in [:qu:]een]
  ==
    , 華
    , [w]
    , [.w.]
    , w
    , w
    , w
    , [[:w:] as in [:w:]e]
''''
||||


###{#sibilant-palatal}
  Sibilant dental/alveolar and palatal
###

||||{.overflowing}
''''
  \header-row[initials]
  ==
    , 將
    , [ts]
    , [.ts.]
    ,{r2} z
    ,{r2} j
    ,{r2} j
    , [[:ts:] as in lis[:ts:]]
  ==
    , 張
    , [tɕ]
    , [.ch.]
    ,
      halfway between [[:ts:] as in lis[:ts:]]
      and [[:t:] as in s[:t:]upid],
      with the latter in a sufficiently broad Australian accent
      for which the T is sounded like [[:ch:] as in [:ch:]ew]
  ==
    , 槍
    , [tsʰ]
    , [.ts'.]
    ,{r2} c
    ,{r2} ch
    ,{r2} ch
    , [[:ts:] as in hi[:ts:]]
  ==
    , 昌
    , [tɕʰ]
    , [.ch'.]
    ,
      halfway between [[:ts:] as in hi[:ts:]]
      and [[:ch:] as in hit[:ch:]]
  ==
    , 相
    , [s]
    , [.s.]
    ,{r2} s
    ,{r2} s
    ,{r2} s
    , [[:s:] as in [:s:]igh]
  ==
    , 傷
    , [ɕ]
    , [.sh.]
    ,
      halfway between [[:s:] as in [:s:]igh]
      and [[:sh:] as in [:sh:]y]
  ==
    , 也
    , [j]
    , [.y.]
    , j
    , y
    , y
    , [[:y:] as in [:y:]e]
''''
||||


####{#ts-vs-ch}
  {[^ts] vs [^ch]}, {[^ts'] vs [^ch']}, and {[^s] vs [^sh]}
####

----
  Modern Cantonese has merged the initials in the pairs
    {將~[^ts](oe)ng vs 張~[^ch](oe)ng},
    {槍~[^ts'](oe)ng vs 昌~[^ch'](oe)ng} and
    {相~[^s](oe)ng vs 傷~[^sh](oe)ng}.
  As noted by [Samuel Wells Williams]
  in [《英華分韻撮要》][wells-tonic-dictionary] (1856, or 咸豐丙辰年):
----
""""
  The initials _ch_ and _ts_ are constantly confounded,
  and some persons are absolutely unable to detect the difference,
  more frequently calling the words under _ts_ as _ch_, than contrawise.
""""

@@[Samuel Wells Williams]
  https://en.wikipedia.org/wiki/Samuel_Wells_Williams
@@
@@[wells-tonic-dictionary]
  https://archive.org/details/tonicdictionaryo00will/page/n25/mode/1up
@@

----
The pre-merger distinctions are remnant only in most romanisations
of district names in Hong Kong, e.g.
----
====
* {[^ts]~vs~[^ch]}:
  將軍澳 ([^Ts]eung Kwan O) and 荔枝角 (Lai [^Ch]i Kok),

* {[^ts']~vs~[^ch']}:
  荃灣 ([^Ts]uen Wan) and 東涌 (Tung [^Ch]ung), and

* {[^s]~vs~[^sh]}:
  西灣河 ([^S]ai Wan Ho) and 筲箕灣 ([^Sh]au Kei Wan).

====
----
Not all district romanisations
follow the pre-merger consonants correctly though,
e.g.~灣仔 should really be Wan [^Ts]ai (not Wan [^Ch]ai),
and 彩虹 should be [^Ts]oi Hung (not [^Ch]oi Hung).
----

----
Now despite the merging of those pairs of initials,
I perceive a tendency for people to favour different consonants
of the merger depending on the vowel which follows:
----


||||||{.centred-block}
||||{.overflowing}
''''
  ==
    ; Following vowel
    , [aː]
    , [ɐ]
    , [ɛː]
    , [e]
    , [iː]
    , [ɔː]
    , [o]
    , [uː]
    , [œ]
    , [ɵ]
    , [yː]
  ==
    ;{r3} Favoured post-merger initial
    ,{.merged-cell c5} [_ts]
    ,{.merged-cell c6} [_ch]
  ==
    ,{.merged-cell c5} [_ts']
    ,{.merged-cell c6} [_ch']
  ==
    ,{.merged-cell c10} [_s]
    ,{.merged-cell} [_sh]
''''
||||
||||||

<## Wrong initials [! ] ##>
{%
  \[
  [!]
    (?P<content> [\S]*? )
  \]
%
  <span class="wrong initial">\g<content></span>
%}

----
The {[_s]~vs~[_sh]} tendency is the strongest.
I have *never* heard anyone pronounce 書, [^sh](u")~/~[[^ɕ]yː],
as [!s](u")~/~[[!s]yː] (which is both wrong and not favoured),
and yet the vast majority of people will pronounce 石, [^sh]ek~/~[[^ɕ]ɛːk̚],
as [_s]ek~/~[[_s]ɛːk̚] (which is wrong but favoured),
myself included.
The {[_ts]~vs~[_ch]} and {[_ts']~vs~[_ch']} tendencies are not as strong,
but still prevalent.
----

||||{.important}
I have decided for historical purposes
to preserve the pre-merger distinctions in my romanisation system,
using the [^pre-merger initial]
according to [《分韻撮要》](https://ytenx.org/pyonh/).
||||

||||{.important}
However, unless you want to sound really weird,
**I still suggest pronouncing words out loud
using the appropriate [_favoured post-merger initial]**
listed in the table above,
rather than the [^pre-merger initial].
For example, [_s]aang [_ch']oi rather than [^sh]aang [^ts']oi for 生菜.
||||


##{#finals}
  Finals (韻)
##

[====
* [(aa)](#aa)
* [(a)](#a)
* [(e)](#e)
* [(ee i)](#ee-i)
* [(or o)](#or-o)
* [(oo u)](#oo-u)
* [((oe))](#oe)
* [(\_)](#_)
* [((u"))](#ue)
* [(m ng)](#m-ng)
====]

----
If typesetting of the characters [.(oe).]~`U+0153`
and [.(u").]~`U+00FC` is inconvenient,
you may use the ASCII-only substitutes [.oe.] and [.ue.] respectively.
----


<## Alternative approximation \OR ##>
{:
  \OR
:
  <div class="alternatives-separator">OR</div>
:}


###{#aa}
  aː
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 叉
    , [aː]
    , [.aa.]
    , aa
    , a
    , a
    ,
      [[:ar:] as in c[:ar:]],
      in a general Australian accent with strictly no R consonant
  ==
    , 釵
    , [aːi]
    , [.aai.]
    , aai
    , aai
    , aai
    , [[:y:] as in m[:y:]], in Received Pronunciation
  ==
    , 抄
    , [aːu]
    , [.aau.]
    , aau
    , aau
    , aau
    , [[:ow:] as in c[:ow:]], in Received Pronunciation
  ==
    , 參
    , [aːm]
    , [.aam.]
    , aam
    , aam
    , aam
    ,
      [[:arm:] as in [:arm:]],
      in a general Australian accent with strictly no R consonant
  ==
    , 餐
    , [aːn]
    , [.aan.]
    , aan
    , aan
    , aan
    ,
      [[:arn:] as in b[:arn:]],
      in a general Australian accent with strictly no R consonant
  ==
    , 撐
    , [aːŋ]
    , [.aang.]
    , aang
    , aang
    , aang
    ,
      [[:ar:] as in c[:ar:]],
      in a general Australian accent with strictly no R consonant,
      followed by [[:ng:] as in si[:ng:]]
  ==
    , 插
    , [aːp̚]
    , [.aap.]
    , aap
    , aap
    , aap
    ,
      [[:ar:] as in c[:ar:]],
      in a general Australian accent with strictly no R consonant,
      followed by [[:p:] as in co[:p:]ter] with no audibly released P
  ==
    , 察
    , [aːt̚]
    , [.aat.]
    , aat
    , aat
    , aat
    ,
      [[:ar:] as in c[:ar:]],
      in a general Australian accent with strictly no R consonant,
      followed by [[:t:] as in a[:t:]las]
      with no audibly released T
        \OR
      [[:art:] as in c[:art:]wheel] with no audibly released T,
      in a general Australian accent with strictly no R consonant
  ==
    , 拆
    , [aːk̚]
    , [.aak.]
    , aak
    , aak
    , aak
    ,
      [[:ar:] as in c[:ar:]],
      in a general Australian accent with strictly no R consonant,
      followed by [[:c:] as in do[:c:]tor]
      with no audibly released C
        \OR
      [[:arc:] as in [:arc:]tangent] with no audibly released C,
      in a general Australian accent with strictly no R consonant
''''
||||


###{#a}
  ɐ
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 仔
    , [ɐi]
    , [.ai.]
    , ai
    , ai
    , ai
    ,
      [[:ay:] as in b[:ay:]],
      in a general, perhaps slightly broad Australian accent,
      but with shorter A
  ==
    , 走
    , [ɐu]
    , [.au.]
    , au
    , au
    , au
    ,
      [[:u:] as in c[:u:]t],
      in a general Australian accent,
      followed by [[:u:] as in p[:u:]ll],
      in a general Australian accent
  ==
    , 針
    , [ɐm]
    , [.am.]
    , am
    , am
    , am
    , [[:um:] as in s[:um:]], in a general Australian accent
  ==
    , 真
    , [ɐn]
    , [.an.]
    , an
    , an
    , an
    , [[:un:] as in s[:un:]], in a general Australian accent
  ==
    , 增
    , [ɐŋ]
    , [.ang.]
    , ang
    , ang
    , ang
    , [[:ung:] as in s[:ung:]], in a general Australian accent
  ==
    , 汁
    , [ɐp̚]
    , [.ap.]
    , ap
    , ap
    , ap
    ,
      [[:u:] as in c[:u:]t], in a general Australian accent,
      followed by [[:p:] as in co[:p:]ter] with no audibly released P
  ==
    , 疾
    , [ɐt̚]
    , [.at.]
    , at
    , at
    , at
    ,
      [[:u:] as in c[:u:]t], in a general Australian accent,
      followed by [[:t:] as in a[:t:]las]
      with no audibly released T
        \OR
      [[:ut:] as in b[:ut:]ler] with no audibly released T,
      in a general Australian accent
  ==
    , 仄
    , [ɐk̚]
    , [.ak.]
    , ak
    , ak
    , ak
    ,
      [[:u:] as in c[:u:]t], in a general Australian accent,
      followed by [[:c:] as in do[:c:]tor] with no audibly released C
''''
||||


###{#e}
  ɛː and e
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 爹
    , [ɛː]
    , [.e.]
    , e
    , e
    , e
    ,
      [[:e:] as in y[:e:]ah],
      in a general Australian accent, but slightly longer
  ==
    , 地
    , [ei]
    , [.ei.]
    , ei
    , ei
    , ei
    ,
      [[:ay:] as in b[:ay:]], in Received Pronunciation,
      but with shorter A and longer Y
  ==
    , 掉
    , [ɛːu]
    , [.eu.]
    , eu
    ,
    ,
    ,
      [[:e:] as in y[:e:]ah], in a general Australian accent,
      followed by
      [[:u:] as in p[:u:]ll], in a general Australian accent
  ==
    , 舔
    , [ɛːm]
    , [.em.]
    , em
    ,
    ,
    ,
      [[:em:] as in h[:em:]], in a general Australian accent,
      but longer
  ==
    , 贏
    , [ɛːŋ]
    , [.eng.]
    , eng
    , eng
    , eng
    ,
      [[:e:] as in y[:e:]ah], in a general Australian accent,
      but slightly longer, followed by [[:ng:] as in si[:ng:]]
  ==
    , 夾
    , [ɛːp̚]
    , [.ep.]
    , ep
    ,
    ,
    ,
      [[:e:] as in y[:e:]ah], in a general Australian accent,
      but slightly longer, followed by
      [[:p:] as in co[:p:]ter] with no audibly released P
        \OR
      [[:ep:] as in s[:ep:]tic] with no audibly released P,
      in a general Australian accent, but longer
  ==
    , 尺
    , [ɛːk̚]
    , [.ek.]
    , ek
    , ek
    , ek
    ,
      [[:e:] as in y[:e:]ah], in a general Australian accent,
      but slightly longer, followed by
      [[:c:] as in do[:c:]tor] with no audibly released C
        \OR
      [[:ec:] as in s[:ec:]tor] with no audibly released C,
      in a general Australian accent, but longer
''''
||||


###{#ee-i}
  iː and e
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 而
    , [iː]
    , [.ee.]
    , i
    , i
    , i
    , [[:ee:] as in b[:ee:]], in Received Pronunciation
  ==
    , 堯
    , [iːu]
    , [.eeu.]
    , iu
    , iu
    , iu
    ,
      [[:ee:] as in b[:ee:]], in Received Pronunciation,
      followed by
      [[:u:] as in p[:u:]ll], in a general Australian accent
  ==
    , 嚴
    , [iːm]
    , [.eem.]
    , im
    , im
    , im
    , [[:eem:] as in s[:eem:]], in Received Pronunciation
  ==
    , 言
    , [iːn]
    , [.een.]
    , in
    , in
    , in
    , [[:een:] as in s[:een:]], in Received Pronunciation
  ==
    , 形
    , [eŋ]
    , [.ing.]
    , ing
    , ing
    , ing
    ,
      halfway between [[:i:] as in t[:i:]n]
      and [[:e:] as in t[:e:]n],
      both in a general Australian accent,
      followed by [[:ng:] as in si[:ng:]]
  ==
    , 葉
    , [iːp̚]
    , [.eep.]
    , ip
    , ip
    , ip
    ,
      [[:ee:] as in b[:ee:]], in Received Pronunciation,
      followed by [[:p:] as in co[:p:]ter] with no audibly released P
  ==
    , 熱
    , [iːt̚]
    , [.eet.]
    , it
    , it
    , it
    ,
      [[:ee:] as in b[:ee:]], in Received Pronunciation,
      followed by [[:t:] as in a[:t:]las] with no audibly released T 
  ==
    , 亦
    , [ek̚]
    , [.ik.]
    , ik
    , ik
    , ik
    ,
      halfway between [[:i:] as in t[:i:]n]
      and [[:e:] as in t[:e:]n],
      both in a general Australian accent,
      followed by [[:c:] as in do[:c:]tor] with no audibly released C
''''
||||


###{#or-o}
  ɔː and o
###

----
Cantonese has no R sound.
The letter R only appears in "[.or.]" to represent the vowel [ɔː],
and is **never** sounded as a consonant.
----

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 歌
    , [ɔː]
    , [.or.]
    , o
    , o
    , oh
    ,
      [[:or:] as in n[:or:]],
      in a general Australian accent with strictly no R consonant
  ==
    , 該
    , [ɔːy]
    , [.oi.]
    , oi
    , oi
    , oi
    ,
      [[:oy:] as in b[:oy:]], in a general Australian accent,
      but with longer O
  ==
    , 高
    , [ou]
    , [.ou.]
    , ou
    , ou
    , o
    ,
      [[:or:] as in n[:or:]],
      in a general Australian accent with strictly no R consonant,
      but much much shorter,
      followed by
      [[:u:] as in p[:u:]ll], in a general Australian accent
  ==
    , 干
    , [ɔːn]
    , [.orn.]
    , on
    , on
    , on
    ,
      [[:orn:] as in h[:orn:]],
      in a general Australian accent with strictly no R consonant
  ==
    , 江
    , [ɔːŋ]
    , [.ong.]
    , ong
    , ong
    , ong
    ,
      [[:ong:] as in s[:ong:]], in a general Australian accent,
      but longer
  ==
    , 葛
    , [ɔːt̚]
    , [.ort.]
    , ot
    , ot
    , ot
    ,
      [[:or:] as in n[:or:]],
      in a general Australian accent with strictly no R consonant,
      followed by [[:t:] as in a[:t:]las]
      with no audibly released T
        \OR
      [[:ort:] as in f[:ort:]let] with no audibly released T,
      in a general Australian accent with strictly no R consonant
  ==
    , 各
    , [ɔːk̚]
    , [.ok.]
    , ok
    , ok
    , ok
    ,
      [[:oc:] as in d[:oc:]tor] with no audibly released C,
      in a general Australian accent, but longer
''''
||||


###{#oo-u}
  uː and o
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 呼
    , [uː]
    , [.oo.]
    , u
    , u
    , oo
    ,
      [[:u:] as in p[:u:]ll], in a general Australian accent,
      but longer
  ==
    , 灰
    , [uːy]
    , [.ooi.]
    , ui
    , ui
    , ooi
    ,
      [[:u:] as in p[:u:]ll], in a general Australian accent,
      but longer, followed by
      [[:y:] as in bo[:y:]], in a general Australian accent
  ==
    , 歡
    , [uːn]
    , [.oon.]
    , un
    , un
    , oon
    ,
      [[:u:] as in p[:u:]ll], in a general Australian accent,
      but longer, followed by [[:n:] as in si[:n:]]
  ==
    , 風
    , [oŋ]
    , [.ung.]
    , ung
    , ung
    , ung
    ,
      [[:oo:] as in t[:oo:]k], in a general Australian accent,
      followed by [[:ng:] as in si[:ng:]]
  ==
    , 闊
    , [uːt̚]
    , [.oot.]
    , ut
    , ut
    , oot
    ,
      [[:u:] as in p[:u:]ll], in a general Australian accent,
      but longer,
      followed by [[:t:] as in a[:t:]las] with no audibly released T
  ==
    , 福
    , [ok̚]
    , [.uk.]
    , uk
    , uk
    , uk
    ,
      [[:oo:] as in t[:oo:]k], in a general Australian accent,
      followed by
      [[:c:] as in do[:c:]tor] with no audibly released C
        \OR
      [[:ook:] as in b[:ook:]token] with no audibly released K,
      in a general Australian accent
''''
||||


###{#oe}
  œ
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 靴
    , [œː]
    , [.(oe).]
    , oe
    , eu
    , euh
    ,
      [[:ö:] as in H[:ö:]lle], in German
        \OR
      [[:eu:] as in j[:eu:]ne], in French
  ==
    , 香
    , [œːŋ]
    , [.(oe)ng.]
    , oeng
    , eung
    , eung
    ,
      [[:ö:] as in H[:ö:]lle], in German,
      followed by [[:ng:] as in si[:ng:]]
  ==
    , 卻
    , [œːk̚]
    , [.(oe)k.]
    , oek
    , euk
    , euk
    ,
      [[:ö:] as in H[:ö:]lle], in German,
      followed by [[:c:] as in do[:c:]tor] with no audibly released C
''''
||||


###{#_}
  ɵ
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 需
    , [ɵy]
    , [.\_(u").]
    , eoi
    , eui
    , ui
    ,
      [[:ö:] as in H[:ö:]lle], in German, but extremely short,
      followed by [[:ü:] as in [:ü:]ber], in German
  ==
    , 詢
    , [ɵn]
    , [.\_n.]
    , eon
    , eun
    , un
    ,
      [[:ö:] as in H[:ö:]lle], in German, but extremely short,
      followed by [[:n:] as in si[:n:]]
  ==
    , 戌
    , [ɵt̚]
    , [.\_t.]
    , eot
    , eut
    , ut
    ,
      [[:ö:] as in H[:ö:]lle], in German, but extremely short,
      followed by [[:t:] as in a[:t:]las] with no audibly released T
''''
||||


###{#ue}
  yː
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 遇
    , [yː]
    , [.(u").]
    , yu
    , yu
    , ue
    , [[:ü:] as in [:ü:]ber], in German
  ==
    , 願
    , [yːn]
    , [.(u")n.]
    , yun
    , yun
    , uen
    ,
      [[:ü:] as in [:ü:]ber], in German,
      followed by [[:n:] as in si[:n:]]
  ==
    , 月
    , [yːt̚]
    , [.(u")t.]
    , yut
    , yut
    , uet
    ,
      [[:ü:] as in [:ü:]ber], in German,
      followed by [[:t:] as in a[:t:]las] with no audibly released T
''''
||||


###{#m-ng}
  m̩ and ŋ̍
###

||||{.overflowing}
''''
  \header-row[finals]
  ==
    , 唔
    , [m̩]
    , [.m.]
    , m
    , m
    , m
    , [[:m:] as in su[:m:]], but longer
  ==
    , 吾
    , [ŋ̍]
    , [.ng.]
    , ng
    , ng
    , ng
    , [[:ng:] as in si[:ng:]], but longer
''''
||||


##{#tones}
  Nine tones (九聲) with tone diagram
##


||||||{.centred-block}
||||{.overflowing}
''''{.no-wrapping}
|^
  ==
    ;{c3} 九聲
    ; IPA~(num.)
    ; Conway
    ; Jyutping
    ; Yale
    ; S.~Lau
|:
  ==
    , 婚
    , 1
    , 陰平
    , [fɐn˥]~(55)
    , [.fan1.]
    , fan1
    , fān
    , fan1
  ==
    , 粉
    , 2
    , 陰上
    , [fɐn˧˥]~(35)
    , [.fan2.]
    , fan2
    , fán
    , fan2
  ==
    , 訓
    , 3
    , 陰去
    , [fɐn˧]~(33)
    , [.fan3.]
    , fan3
    , fan
    , fan3
  ==
    , 焚
    , 4
    , 陽平
    , [fɐn˩]~(11)
    , [.fan4.]
    , fan4
    , fàhn
    , fan4
  ==
    , 奮
    , 5
    , 陽上
    , [fɐn˨˧]~(23)
    , [.fan5.]
    , fan5
    , fáhn
    , fan5
  ==
    , 份
    , 6
    , 陽去
    , [fɐn˨]~(22)
    , [.fan6.]
    , fan6
    , fahn
    , fan6
  ==
    , 忽
    , 7
    , 高陰入
    , [fɐt̚˥]~(5)
    , [.fat7.]
    , fat1
    , fāt
    , fat1
  ==
    , 　
    , 8
    , 低陰入
    , [fɐt̚˧]~(3)
    , [.fat8.]
    , fat3
    , fat
    , fat3
  ==
    , 佛
    , 9
    , 陽入
    , [fɐt̚˨]~(2)
    , [.fat9.]
    , fat6
    , faht
    , fat6
''''
||||
||||||

<##
                              Tone diagram
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    wn          width of non-entering tones             5
    we          width of entering tones                 2.5
    hp          height between pitches                  1.1
    xp          x pos of pitch numbers                 -4
    xn          central x pos of non-entering tones     0
    xe          central x pos of entering tones         5
    xleft       left x pos                             -5
    xright      right x pos                             6.5
    w           total width                            11.5
    ytop        top y pos                              -7
    ybottom     bottom y pos                            0.5
    h           total height                            6.5
  ***********************************************************************
   pitch
    num.
                        tone 1 陰平                    tone 7 高陰入
     5        ________________________________        ________________
                        tone 2 陰上  ==/////
     4                  ==///////////
                 ==///// tone 3 陰去                    tone 8 低陰入
     3        ________________________________        ________________
          tone 5 陽上// tone 6 陽去                     tone 9 陽入
     2        ________________________________   _    ________________
                        tone 4 陽平                |
     1        ________________________________   _| 1.1

              |<-            5             ->|        |<-    2.5   ->|

     ^                       ^                                ^
    -4                       0                                5
  ***********************************************************************
##>

[svg-styles/
  line {
    \svg-style:stroke-declarations
  }
  text {
    \svg-style:text-declarations
  }
/]

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-5.5 -7 12 6.5"
  \accessible-svg-attributes[tone-diagram-title]
>
  [accessible-svg-title/tone-diagram-title
    Diagram of the nine tones of Cantonese. \
    Using the pitch numerals 1 to 5 in order of increasing pitch:
      tone~1 ~~ 陰平 ~~ is level at 5;
      tone~2 ~~ 陰上 ~~ is rising from 3 to 5;
      tone~3 ~~ 陰去 ~~ is level at 3;
      tone~4 ~~ 陽平 ~~ is level at 1;
      tone~5 ~~ 陽上 ~~ is rising from 2 to 3;
      tone~6 ~~ 陽去 ~~ is level at 2;
      tone~7 ~~ 高陰入 ~~ is level at 5 and short;
      tone~8 ~~ 低陰入 ~~ is level at 3 and short;
      tone~9 ~~ 陽入 ~~ is level at 2 and short.
  /]
  
  [accessible-svg-content/
    
    {:: \font-size :: font-size = "0.4" ::}
    
    <## tone 1 陰平 ##>
    <line
      x1 = "-2.5"
      y1 = "-5.5"
      x2 = "2.5"
      y2 = "-5.5" />
    <text
      x = "0"
      y = "-5.5"
      \font-size
      dy = "-0.5em"
      >tone~1 ~~ 陰平 ~~
    </text>
    
    <## tone 2 陰上 ##>
    <line
      x1 = "-2.5"
      y1 = "-3.3"
      x2 = "2.5"
      y2 = "-5.5" />
    <text
      x = "0"
      y = "-4.4"
      \font-size
      dy = "-0.5em"
      transform = "rotate(-23.75 0 -4.4)"
      >tone~2 ~~ 陰上 ~~
      <## arctan (2.2/5) == 23.75 degree ##>
    </text>
    
    <## tone 3 陰去 ##>
    <line
      x1 = "-2.5"
      y1 = "-3.3"
      x2 = "2.5"
      y2 = "-3.3" />
    <text
      x = "0"
      y = "-3.3"
      \font-size
      dy = "-0.5em"
      >tone~3 ~~ 陰去 ~~
    </text>
    
    <## tone 4 陽平 ##>
    <line
      x1 = "-2.5"
      y1 = "-1.1"
      x2 = "2.5"
      y2 = "-1.1" />
    <text
      x = "0"
      y = "-1.1"
      \font-size
      dy = "-0.5em"
      >tone~4 ~~ 陽平 ~~
    </text>
    
    <## tone 5 陽上 ##>
    <line
      x1 = "-2.5"
      y1 = "-2.2"
      x2 = "2.5"
      y2 = "-3.3" />
    <text
      x = "-1.3"
      y = "-2.75"
      \font-size
      dy = "-0.5em"
      transform = "rotate(-12.41 0 -2.75)"
      >tone~5 ~~ 陽上 ~~
      <## arctan (1.1/5) == 12.41 degree ##>
    </text>
    
    <## tone 6 陽去 ##>
    <line
      x1 = "-2.5"
      y1 = "-2.2"
      x2 = "2.5"
      y2 = "-2.2" />
    <text
      x = "1.3"
      y = "-2.2"
      \font-size
      dy = "-0.5em"
      >tone~6 ~~ 陽去 ~~
    </text>
    
    <## tone 7 高陰入 ##>
    <line
      x1 = "3.75"
      y1 = "-5.5"
      x2 = "6.25"
      y2 = "-5.5" />
    <text
      x = "5"
      y = "-5.5"
      \font-size
      dy = "-0.5em"
      >tone~7 ~~ 高陰入 ~~
    </text>
    
    <## tone 8 低陰入 ##>
    <line
      x1 = "3.75"
      y1 = "-3.3"
      x2 = "6.25"
      y2 = "-3.3" />
    <text
      x = "5"
      y = "-3.3"
      \font-size
      dy = "-0.5em"
      >tone~8 ~~ 低陰入 ~~
    </text>
    
    <## tone 9 陽入 ##>
    <line
      x1 = "3.75"
      y1 = "-2.2"
      x2 = "6.25"
      y2 = "-2.2" />
    <text
      x = "5"
      y = "-2.2"
      \font-size
      dy = "-0.5em"
      >tone~9 ~~ 陽入 ~~
    </text>
    
    <## pitch num. ##>
    <text
      x = "-4"
      y = "-6.6"
      \font-size
      >pitch num.
    </text>
    
    <## 5 ##>
    <text
      x = "-4"
      y = "-5.5"
      \font-size
      >5
    </text>
    
    <## 4 ##>
    <text
      x = "-4"
      y = "-4.4"
      \font-size
      >4
    </text>
    
    <## 3 ##>
    <text
      x = "-4"
      y = "-3.3"
      \font-size
      >3
    </text>
    
    <## 2 ##>
    <text
      x = "-4"
      y = "-2.2"
      \font-size
      >2
    </text>
    
    <## 1 ##>
    <text
      x = "-4"
      y = "-1.1"
      \font-size
      >1
    </text>
  
  /]
  
</svg>
||||

----
Tone~4 is also pronounced slightly falling, i.e.~[fɐn˨˩]~(21),
especially if the syllable is drawn-out
(for instance in operatic or theatrical dialogue).
Tone~2 can start slightly lower, i.e.~[fɐn˨˥]~(25).
----

----
Cantonese preserves all ending consonants of Middle Chinese,
and thus there is a correspondence between
the nasals ([m], [n], [ŋ]) and the unreleased stops ([p̚], [t̚], [k̚])
of the entering tones (入聲).
Pronunciations in old rime dictionaries can only be understood
in terms of this correspondence:
----

||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ; Place of articulation
    ; Nasal
    ; Stop
    ; Example quoted in 《康熙字典》
|:
  ==
    , Labial
    , [m]
    , [p̚]
    ,
      [入：任入聲](https://ctext.org/kangxi-zidian/11/0#n318684)
      i.e.~任~[.(yam6).] to~入~[.(yap9).]
  ==
    , Plain dental/alveolar
    , [n]
    , [t̚]
    ,
      [出：春入聲](https://ctext.org/kangxi-zidian/17/3#n319099)
      i.e.~春~[.(ch'\_n1).] to~出~[.(ch'\_t7).]
  ==
    , Plain velar
    , [ŋ]
    , [k̚]
    ,
      [德：登入聲](https://ctext.org/kangxi-zidian/60/12#n326232)
      i.e.~登~[.(tang1).] to~德~[.(tak7).]
''''
||||
||||||

----
While the entering tones (入聲) 7, 8, 9 are the same pitch
as tones 1, 3, 6 respectively, they should not be regarded as the same.
In poetry, balancing 平聲 (tones 1 and 4) and 仄聲 (the rest)
is highly desirable; if you count tone~7 (高陰入) as tone~1 (陰平),
you will get tone patterns (平仄) wrong.
None of Jyutping, Yale and Sidney~Lau make this distinction.
----

----
Tone patterns and literary situations aside though,
tones in colloquial Cantonese are highly versatile, in that they can be
vernacularised as different tones in particular instances.
This, in my opinion, makes colloquial Cantonese
probably the most inconsistent language in the world.
Here are a few examples:
----

||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ; Phrase
    ; Literary
    ; Vernacularised
|:
  ==
    , 笛
    , tek[.9.]
    , tek[.2.]
  ==
    , 姐姐
    , tse[.2.]~tse[.2.]
    , tse[.4.]~tse[.1.]
  ==
    , 後尾
    , hau[.6.]~mei[.5.]
    ,
      hau6~mei[.1.] \+
      hau[.1.]~mei[.1.]
  ==
    , 今晚
    , kam1~maan[.5.]
    , kam1~maan[.1.]
  ==
    , 長沙灣
    , ch'(oe)ng4~shaa1~waan[.1.]
    , ch'(oe)ng4~shaa1~waan[.4.]
  ==
    , 油麻地
    , yau4~maa4~tei[.6.]
    , yau4~maa4~tei[.2.]
''''
||||
||||||


##{#compact-tables}
  Compact reference tables
##

###{#initials-table}
  Initials (聲)
###

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    , 巴~[.p.]
    , 打~[.t.]
    , 家~[.k.]
    , 瓜~[.kw.]
    , 將~[.ts.]
    , 張~[.ch.]
  ==
    , 怕~[.p'.]
    , 他~[.t'.]
    , 卡~[.k'.]
    , 誇~[.k'w.]
    , 槍~[.ts'.]
    , 昌~[.ch'.]
  ==
    , 媽~[.m.]
    , 那~[.n.]
    , 牙~[.ng.]
    , 華~[.w.]
    , 相~[.s.]
    , 傷~[.sh.]
  ==
    , 花~[.f.]
    , 啦~[.l.]
    , 蝦~[.h.]
    , 也~[.y.]
    ,
    ,
''''
||||
||||||


###{#finals-table}
  Finals (韻)
###

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    , 叉~[.aa.]
    ,
    , 爹~[.e.]
    , 而~[.ee.]
    , 歌~[.or.]
    , 呼~[.oo.]
    , 靴~[.(oe).]
    ,
    , 遇~[.(u").]
    ,
  ==
    , 釵~[.aai.]
    , 仔~[.ai.]
    , 地~[.ei.]
    ,
    , 該~[.oi.]
    , 灰~[.ooi.]
    ,
    , 需~[.\_(u").]
    ,
    ,
  ==
    , 抄~[.aau.]
    , 走~[.au.]
    , 掉~[.eu.]
    , 堯~[.eeu.]
    , 高~[.ou.]
    ,
    ,
    ,
    ,
    ,
  ==
    , 參~[.aam.]
    , 針~[.am.]
    , 舔~[.em.]
    , 嚴~[.eem.]
    ,
    ,
    ,
    ,
    ,
    , 唔~[.m.]
  ==
    , 餐~[.aan.]
    , 真~[.an.]
    ,
    , 言~[.een.]
    , 干~[.orn.]
    , 歡~[.oon.]
    ,
    , 詢~[.\_n.]
    , 願~[.(u")n.]
    ,
  ==
    , 撐~[.aang.]
    , 增~[.ang.]
    , 贏~[.eng.]
    , 形~[.ing.]
    , 江~[.ong.]
    , 風~[.ung.]
    , 香~[.(oe)ng.]
    ,
    ,
    , 吾~[.ng.]
  ==
    , 插~[.aap.]
    , 汁~[.ap.]
    , 夾~[.ep.]
    , 葉~[.eep.]
    ,
    ,
    ,
    ,
    ,
    ,
  ==
    , 察~[.aat.]
    , 疾~[.at.]
    ,
    , 熱~[.eet.]
    , 葛~[.ort.]
    , 闊~[.oot.]
    ,
    , 戌~[.\_t.]
    , 月~[.(u")t.]
    ,
  ==
    , 拆~[.aak.]
    , 仄~[.ak.]
    , 尺~[.ek.]
    , 亦~[.ik.]
    , 各~[.ok.]
    , 福~[.uk.]
    , 卻~[.(oe)k.]
    ,
    ,
    ,
''''
||||
||||||

###{#tones-table}
  Nine tones (九聲)
###

{: \to : → :}

||||||{.centred-block}
||||{.centred-block .overflowing}
''''
|^
  ==
    ;{.vertical-rtl} 陰平
    ;{.vertical-rtl} 陰上
    ;{.vertical-rtl} 陰去
    ;{.vertical-rtl} 陽平
    ;{.vertical-rtl} 陽上
    ;{.vertical-rtl} 陽去
    ;{.no-wrapping r2} 鼻 → 塞
    ;{.vertical-rtl} 高陰入
    ;{.vertical-rtl} 低陰入
    ;{.vertical-rtl} 陽入
  ==
    ; 1
    ; 2
    ; 3
    ; 4
    ; 5
    ; 6
    ; 7
    ; 8
    ; 9
|:
  ==
    , 閹
    , 掩
    , 厭
    , 炎
    , 染
    , 艷
    ,{.no-wrapping} [m] \to [p̚]
    , 　
    , 醃
    , 頁
  ==
    , 婚
    , 粉
    , 訓
    , 焚
    , 奮
    , 份
    ,{.no-wrapping} [n] \to [t̚]
    , 忽
    , 　
    , 佛
  ==
    , 英
    , 影
    , 應
    , 形
    , 　
    , 認
    ,{.no-wrapping} [ŋ] \to [k̚]
    , 益
    , 　
    , 亦
''''
||||
||||||


##{#examples}
  Examples
##

----
First with [^pre-merger initials] (rarely heard today),
then with [_favoured post-merger initials].
See [{[^ts] vs [^ch]} etc](#ts-vs-ch).
----

||||{.example}
  身體髮膚，受之父母，不敢毀傷，孝之始也。
||||
====
*
  [^sh]an1 t'ai2 faat8 foo1, 
  [^sh]au6 [^ch]ee1 foo6 mou5,
  pat7 kam2 wai2 [^sh](oe)ng1,
  haau3 [^ch]ee1 [^ch']ee2 yaa5.
*
  [_s]an1 t'ai2 faat8 foo1,
  [_s]au6 [_ts]ee1 foo6 mou5,
  pat7 kam2 wai2 [_s](oe)ng1,
  haau3 [_ts]ee1 [_ts']ee2 yaa5.
====

||||{.example}
  天地玄黃，宇宙洪荒。日月盈昃，辰宿列張。
||||
====
*
  t'een1 tei6 y(u")n4 wong4,
  y(u")5 [^ch]au6 hung4 fong1.
  yat9 y(u")t9 ying4 [^ch]ak7,
  [^sh]an4 [^s]uk7 leet9 [^ch](oe)ng1.
*
  t'een1 tei6 y(u")n4 wong4,
  y(u")5 [_ts]au6 hung4 fong1.
  yat9 y(u")t9 ying4 [_ts]ak7,
  [_s]an4 [_s]uk7 leet9 [_ch](oe)ng1.
====

||||{.example}
  夫質以代興，妍因俗易。
||||
====
*
  foo4 [^ch]at7 yee5 toi6 hing1,
  yeen4 yan1 [^ts]uk9 yik9.
*
  foo4 [_ts]at7 yee5 toi6 hing1,
  yeen4 yan1 [_ch]uk9 yik9.
====

||||{.example}
  攜書劍，滯京華。
||||
====
*
  k'wai4 [^sh](u")1 keem3,
  [^ch]ai6 king1 waa4.
*
  k'wai4 [_sh](u")1 keem3,
  [_ts]ai6 king1 waa4.
====

||||{.example}
  日日醉涼州，笙歌卒未休。
||||
====
*
  yat9 yat9 [^ts]\_(u")3 l(oe)ng4 [^ch]au1,
  [^sh]ang1 kor1 [^ts]\_t7 mei6 yau1.
*
  yat9 yat9 [_ch]\_(u")3 l(oe)ng4 [_ts]au1,
  [_s]ang1 kor1 [_ch]\_t7 mei6 yau1.
====

||||{.example}
  胡不念花園盟香？
||||
====
*
  woo4 pat7 neem6 faa1 y(u")n2 mang4 h(oe)ng1?
====

||||{.example}
  妾從無錯處，嘆我自招報應，怨句匹夫變性。
||||
====
*
  [^ts']eep8 [^ts']ung4 mou4 [^ts']or3 [^ch'](u")3,
  t'aan3 ngor5 [^ts]ee6 [^ch]eeu1 pou3 ying3,
  y(u")n3 k\_(u")3 p'at7 foo1 peen3 [^s]ing3.
*
  [_ts']eep8 [_ch']ung4 mou4 [_ch']or3 [_ch'](u")3,
  t'aan3 ngor5 [_ts]ee6 [_ts]eeu1 pou3 ying3,
  y(u")n3 k\_(u")3 p'at7 foo1 peen3 [_s]ing3.
====

||||{.example}
  請勿靠近車門。
||||
====
*
  [^ts']ing2 mat9 k'aau3 kan6 [^ch']e1 moon4.
*
  [_ts']ing2 mat9 k'aau3 kan6 [_ts']e1 moon4.
====

||||{.example}
  下一站：九龍塘，乘客可以轉乘九廣東鐵。
||||
====
*
  haa6 yat7 [^ch]aam6: kau2 lung4 t'ong4,
  [^sh]ing4 haak8 hor2 yee5 [^ch](u")n2 [^sh]ing4
  kau2 kwong2 tung1 t'eet8.
*
  haa6 yat7 [_ts]aam6: kau2 lung4 t'ong4,
  [_s]ing4 haak8 hor2 yee5 [_ch](u")n2 [_s]ing4
  kau2 kwong2 tung1 t'eet8.
====


\cite-this-page[][cantonese-romanisation][
  {Conway's} {Romanisation} for {Cantonese}
]


%footer-element
