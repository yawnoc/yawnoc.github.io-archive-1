{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}

%%
  %title Quick links for Williams' Tonic Dictionary of Cantonese
  %date-created 2020-02-20
  %date-modified 2020-05-14
  \resources:rendering
  %description
    Quick links for each syllable of Samuel Wells Williams' \
    "A Tonic Dictionary Of The Chinese Language In The Canton Dialect" \
    《英華分韻撮要》
%%


[[====
* \header-link:home
* \header-link:top
* [Links](#links Links A to Z)
* \header-link:cite
====]]


# Quick links for Williams' _Tonic Dictionary_ of Cantonese #


[||||
See also: [Conway's Custom Romanisation for Cantonese][conway]
||||]

@@[conway]
  /cantonese/conway-romanisation
@@

----
Quick links for each syllable of
  [A Tonic Dictionary Of The Chinese Language In The Canton Dialect]["n6"],
  or 《英華分韻撮要》,
written by [Samuel Wells Williams] in 1856 (or 咸豐丙辰年),
recording both literary and vernacular Cantonese
as spoken in Canton in the late Ts'ing Dynasty.
----

@@[Samuel Wells Williams]
  https://en.wikipedia.org/wiki/Samuel_Wells_Williams
@@

----
The equivalent romanisations in [my own system][conway] and in [Jyutping]
are listed alongside for comparison.
Note that Jyutping (like all contemporary romanisation systems)
[merges {[^ts] vs [^ch]}, {[^ts'] vs [^ch']}, and {[^s] vs [^sh]}][ts-vs-ch].
----

@@[jyutping]
  https://en.wikipedia.org/wiki/Jyutping
@@

@@[ts-vs-ch]
  /cantonese/conway-romanisation#ts-vs-ch
@@

##{#links}
  Links A to Z
##

[====
* [A](#a)
* [C](#c)
====]


<## Header rows for tables ##>
{::
  \header-row
::
  |^
    ==
      ; (n)
      ; Williams
      ; Conway
      ; Jyutping
  |:
::}


<## Page row \page-row[p] n ##>
{%
  \\page-row
  \[
    (?P<archive_page_number> [n]?[0-9]+? )
  \]
    [ ]+
  (?P<williams_page_number> [0-9]+(\\\*)? )
%
  ==
    ,{.merged-cell c4}
      [Page~\g<williams_page_number>]["\g<archive_page_number>"]
%}


<## Syllable row \syllable-row  i  W  C  J ##>
{%
  \\syllable-row
    [ ]+
  (?P<williams_index> [0-9]+? )
    [ ]+
  (?P<williams> [\S]+? )
    [ ]+
  (?P<conway> [\S]+? )
    [ ]+
  (?P<jyutping> [\S]+? )
%
  ==
    , (\g<williams_index>)
    , \g<williams>
    , \g<conway>
    , \g<jyutping>
%}


<## archive.org URL in round brackets ["p"] ##>
{%
  \[ "
    (?P<archive_page_number> [n]?[0-9]+? )
  " \]
%
  (
    https://archive.org/details/tonicdictionaryo00will/page/\\
      \g<archive_page_number>/mode/1up
  )
%}


###{#a}  A  ###


||||||{.centred-block}
||||{.overflowing}
''''

\header-row

\page-row[1]      1
\syllable-row             1         (a/)           aa           aa

\page-row[2]      2
\syllable-row             2           ai           ai           ai
\syllable-row             3        (a/)i          aai          aai

\page-row[3]      3
\syllable-row             4           ak           ak           ak
\syllable-row             5        (a/)k          aak          aak
\syllable-row             6           am           am           am

\page-row[4]      4
\syllable-row             7        (a/)m          aam          aam
\syllable-row             8        (a/)n          aan          aan
\syllable-row             9           ang          ang          ang
\syllable-row            10        (a/)ng         aang         aang
\syllable-row            11           ap           ap           ap

\page-row[5]      5
\syllable-row            12        (a/)p          aap          aap
\syllable-row            13           at           at           at
\syllable-row            14        (a/)t          aat          aat

\page-row[6]      6
\syllable-row            15           au           au           au
\syllable-row            16        (a/)u          aau          aau

''''
||||
||||||


###{#c}  C  ###


||||||{.centred-block}
||||{.overflowing}
''''

\header-row

\page-row[7]      7
\syllable-row            17       ch(a/)         chaa          zaa

\page-row[8]      8
\syllable-row            18      ch'(a/)        ch'aa          caa

\page-row[n48]    9
\syllable-row            19         chai         chai          zai

\page-row[n49]   10
\syllable-row            20      ch(a/)i        chaai         zaai

\page-row[n50]   11
\syllable-row            21     ch'(a/)i       ch'aai         caai

\page-row[n51]   12
\syllable-row            22         chak         chak          zak
\syllable-row            23        ch'ak        ch'ak          cak
\syllable-row            24      ch(a/)k        chaak         zaak

\page-row[n52]   13
\syllable-row            25     ch'(a/)k       ch'aak         caak

\page-row[n53]   14
\syllable-row            26         cham         cham          zam

\page-row[n54]   15
\syllable-row            27        ch'am        ch'am          cam
\syllable-row            28      ch(a/)m        chaam         zaam

\page-row[n55]   16
\syllable-row            29     ch'(a/)m       ch'aam         caam
\syllable-row            30         chan         chan          zan

\page-row[n56]   17
\syllable-row            31        ch'an        ch'an          can

\page-row[n58]   19
\syllable-row            32      ch(a/)n        chaan         zaan

\page-row[n59]   20
\syllable-row            33     ch'(a/)n       ch'aan         caan
\syllable-row            34         chang        chang         zang
\syllable-row            35      ch(a/)ng       chaang        zaang

\page-row[n60]   21
\syllable-row            36     ch'(a/)ng      ch'aang        caang

\page-row[n61]   22
\syllable-row            37         chap         chap          zap
\syllable-row            38      ch(a/)p        chaap         zaap

\page-row[n62]   23
\syllable-row            39     ch'(a/)p       ch'aap         caap
\syllable-row            40         chat         chat          zat

\page-row[n63]   24
\syllable-row            41      ch(a/)t        chaat         zaat
\syllable-row            42     ch'(a/)t       ch'aat         caat

\page-row[n64]   25
\syllable-row            43         chau         chau          zau

\page-row[n65]   26
\syllable-row            44        ch'au        ch'au          cau

\page-row[n67]   28
\syllable-row            45      ch(a/)u        chaau         zaau

\page-row[n68]   29
\syllable-row            46     ch'(a/)u       ch'aau         caau

\page-row[n69]   30
\syllable-row            47       ch(e/)          che           ze

\page-row[n70]   31
\syllable-row            48      ch'(e/)         ch'e           ce

\page-row[n71]   32
\syllable-row            49     ch(e/)uk      ch(oe)k         zoek

\page-row[n72]   33
\syllable-row            50    ch'(e/)uk     ch'(oe)k         coek
\syllable-row            51     ch(e/)ung     ch(oe)ng        zoeng

\page-row[n74]   35
\syllable-row            52    ch'(e/)ung    ch'(oe)ng        coeng

\page-row[n76]   37
\syllable-row            53       ch(i/)         chee           zi

\page-row[10]   10\*
\syllable-row            54      ch'(i/)        ch'ee           ci

\page-row[13]   13\*
\syllable-row            55         chik         chik          zik

\page-row[14]   14\*
\syllable-row            56        ch'ik        ch'ik          cik

''''
||||
||||||




\cite-this-page[
  Quick links for Williams' _Tonic Dictionary_ of Cantonese
][
  tonic-dictionary
][
  Quick links for {Williams'} \textit{{Tonic} {Dictionary}} of {Cantonese}
]

%footer-element
