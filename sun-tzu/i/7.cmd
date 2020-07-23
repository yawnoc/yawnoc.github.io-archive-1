{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/original-chinese.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P7
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:rendering
  %css
    td {
      padding: 0;
    }
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P7](\/ You are viewing \P7)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P7. Rod calculus: vertical \& horizontal forms
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P6 : ["i 6"]
    \nav-curr: \P7
    \nav-next: \P8 : ["i 8"]
  |}}
|}}}}


[||||
||||]


----
This paragraph hints at the way in which numerals are displayed
in [__rod calculus__] [rod calculus],
a means of doing arithmetic computations using counting rods
(eventually replaced by the [Chinese abacus]).
----

@@[rod calculus]
  https://en.wikipedia.org/wiki/Rod_calculus
@@
@@[Chinese abacus]
  https://en.wikipedia.org/wiki/Suanpan
@@


##{#translation}
  Translation
##

----
Chinese source text: \a[6], \b[147], \c[52063], \d[14]. \+
\d-default
----

<<
  凡算之法，先識其位。
||
  .[In the] method of all computation, know first .[the] places.
>>
====
* 位： .[the] places
====

<<
  一從十橫，百立千僵，千十相望，萬百相當。
||
  .[The] ones .[are] vertical .[and the] tens horizontal;
  .[the] hundreds upright .[and the] thousands prostrate.
  .[The] thousands .[and] tens look at each other;
  .[the] myriads .[and] hundreds correspond to each other.
>>
====
* 從 \+
    Variant of 縱.

* 僵：偃也； [prostrate] \+
  Not to be confused with prostate.
  
  @@[prostrate]
    https://en.wiktionary.org/wiki/prostrate#Adjective
    Adjective
  @@

* \a[6] and \d[14] have 百萬 instead of 萬百.
  According to the inline note in \b[147], this is a transcription error:
  <<
    案：「萬百」原本訛作「百萬」。今據《夏侯陽算經》改正。
  ||
    Note: "Myriads .[and] hundreds" .[in the] original version
    .[was] erroneously written "hundreds .[and] myriads".
    Now corrected according to
    ["Hia Hou-yang ((夏侯陽))'s Computational Classic"] [夏侯陽算經].
  >>
  In my opinion 萬百 vs~百萬 is a minor issue,
  but I agree that 萬百 is the correct order,
  since we have 千十 preceding, rather than
  十千 (i.e.~the larger place-value appears first).
  Thus I have 萬百 above.
  
  @@[夏侯陽算經]
    https://archive.org/details/02094036.cn/page/n6
  @@
====


<##
                       Rod calculus numerals
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    xleft       left x pos                             -0.5
    xright      right x pos                             0.5
    w           total width                             1
    ytop        top y pos                              -0.5
    ybottom     bottom y pos                            0.5
    h           total height                            1
    l           rod length                              0.5
    s           rod spacing                             0.1
  ***********************************************************************
  Each numeral shall occupy a width of 36px.
##>

[svg-styles/
  text {
    \svg-style:text-declarations
  }
  \svg-style:maths-font-rulesets
  line {
    \svg-style:stroke-declarations
    fill: none;
  }
  polyline.points {
    fill: none;
    stroke: none;
  }
  .thick {
    stroke-width: 2;
  }
/]

<## Rod at origin ##>
{% \\rod[-] (?P<type> [vh] ) \[ (?P<n>[1-9]) \] %
  <polyline \\point points="0,0" \\marker:rod-\g<type>[\g<n>]/>
%}

<## Rod marker reference by id ##>
{% \\marker:rod[-]v \[ (?P<n>[1-9]) \] %
  marker-end="url(#rod-vertical-\g<n>)"
%}
{% \\marker:rod[-]h \[ (?P<n>[1-9]) \] %
  marker-end="url(#rod-horizontal-\g<n>)"
%}
{:: \marker:rod-v-g[5] :: marker-end="url(#rod-vertical-grouping-5)" ::}
{:: \marker:rod-h-g[5] :: marker-end="url(#rod-horizontal-grouping-5)" ::}

<## Attributes ##>
{:: \svg-attributes:rod ::
  width="36px" \\view-box:rod
::}
{:: \marker-attributes:rod ::
  \\view-box:rod refX="0" refY="0" markerWidth="1" markerHeight="1"
  markerUnits="userSpaceOnUse"
::}
{:: \view-box:rod :: viewBox="-0.5 -0.5 1 1" ::}
{: \point : class="points" :}


##{#commentary}
  Extended commentary
##

----
Since this paragraph is hardly a self-contained explanation of rod calculus,
I give a brief introduction here.
----

----
For each numeral (except zero which is denoted by a blank space)
there are two forms, vertical and horizontal:
----

||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ; Numeral
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
    ; Vertical
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-1-title]\
      >
        
        <## Rod definitions ##>
        <##
          It would be better to put these definitions into a
          dedicated definitions SVG rather than include them here
          inside the SVG for "rod-vertical-1",
          but when I do that I can't figure out
          how to make that SVG take up zero width and height
          without breaking the definitions.
        ##>
        
        <defs>
          
          <## Rod calculus vertical 1 ##>
          <marker id="rod-vertical-1" \marker-attributes:rod>
            <line class="thick" x1="0" y1="-0.25" x2="0" y2="0.25"/>
          </marker>
          
          <## Rod calculus vertical 2 ##>
          <marker id="rod-vertical-2" \marker-attributes:rod>
            <polyline \point points="-0.05,0" \marker:rod-v[1]/>
            <polyline \point points="0.05,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus vertical 3 ##>
          <marker id="rod-vertical-3" \marker-attributes:rod>
            <polyline \point points="-0.1,0" \marker:rod-v[1]/>
            <polyline \point points="0,0" \marker:rod-v[1]/>
            <polyline \point points="0.1,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus vertical 4 ##>
          <marker id="rod-vertical-4" \marker-attributes:rod>
            <polyline \point points="-0.15,0" \marker:rod-v[1]/>
            <polyline \point points="-0.05,0" \marker:rod-v[1]/>
            <polyline \point points="0.05,0" \marker:rod-v[1]/>
            <polyline \point points="0.15,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus vertical 5 ##>
          <marker id="rod-vertical-5" \marker-attributes:rod>
            <polyline \point points="-0.2,0" \marker:rod-v[1]/>
            <polyline \point points="-0.1,0" \marker:rod-v[1]/>
            <polyline \point points="0,0" \marker:rod-v[1]/>
            <polyline \point points="0.1,0" \marker:rod-v[1]/>
            <polyline \point points="0.2,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus vertical grouping horizontal 5 ##>
          <marker id="rod-vertical-grouping-5" \marker-attributes:rod>
            <polyline \point points="0,-0.25" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus vertical 6 ##>
          <marker id="rod-vertical-6" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-v-g[5]/>
            <polyline \point points="0,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus vertical 7 ##>
          <marker id="rod-vertical-7" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-v-g[5]/>
            <polyline \point points="0,0" \marker:rod-v[2]/>
          </marker>
          
          <## Rod calculus vertical 8 ##>
          <marker id="rod-vertical-8" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-v-g[5]/>
            <polyline \point points="0,0" \marker:rod-v[3]/>
          </marker>
          
          <## Rod calculus vertical 9 ##>
          <marker id="rod-vertical-9" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-v-g[5]/>
            <polyline \point points="0,0" \marker:rod-v[4]/>
          </marker>
          
          <## Rod calculus horizontal 1 ##>
          <marker id="rod-horizontal-1" \marker-attributes:rod>
            <line class="thick" x1="-0.25" y1="0" x2="0.25" y2="0"/>
          </marker>
          
          <## Rod calculus horizontal 2 ##>
          <marker id="rod-horizontal-2" \marker-attributes:rod>
            <polyline \point points="0,-0.05" \marker:rod-h[1]/>
            <polyline \point points="0,0.05" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus horizontal 3 ##>
          <marker id="rod-horizontal-3" \marker-attributes:rod>
            <polyline \point points="0,-0.1" \marker:rod-h[1]/>
            <polyline \point points="0,0" \marker:rod-h[1]/>
            <polyline \point points="0,0.1" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus horizontal 4 ##>
          <marker id="rod-horizontal-4" \marker-attributes:rod>
            <polyline \point points="0,-0.15" \marker:rod-h[1]/>
            <polyline \point points="0,-0.05" \marker:rod-h[1]/>
            <polyline \point points="0,0.05" \marker:rod-h[1]/>
            <polyline \point points="0,0.15" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus horizontal 5 ##>
          <marker id="rod-horizontal-5" \marker-attributes:rod>
            <polyline \point points="0,-0.2" \marker:rod-h[1]/>
            <polyline \point points="0,-0.1" \marker:rod-h[1]/>
            <polyline \point points="0,0" \marker:rod-h[1]/>
            <polyline \point points="0,0.1" \marker:rod-h[1]/>
            <polyline \point points="0,0.2" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus horizontal grouping vertical 5 ##>
          <marker id="rod-horizontal-grouping-5" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-v[1]/>
          </marker>
          
          <## Rod calculus horizontal 6 ##>
          <marker id="rod-horizontal-6" \marker-attributes:rod>
            <polyline \point points="0,0" \marker:rod-h-g[5]/>
            <polyline \point points="0,0.25" \marker:rod-h[1]/>
          </marker>
          
          <## Rod calculus horizontal 7 ##>
          <marker id="rod-horizontal-7" \marker-attributes:rod>
            <polyline \point points="0,-0.05" \marker:rod-h-g[5]/>
            <polyline \point points="0,0.25" \marker:rod-h[2]/>
          </marker>
          
          <## Rod calculus horizontal 8 ##>
          <marker id="rod-horizontal-8" \marker-attributes:rod>
            <polyline \point points="0,-0.075" \marker:rod-h-g[5]/>
            <polyline \point points="0,0.3" \marker:rod-h[3]/>
          </marker>
          
          <## Rod calculus horizontal 9 ##>
          <marker id="rod-horizontal-9" \marker-attributes:rod>
            <polyline \point points="0,-0.1" \marker:rod-h-g[5]/>
            <polyline \point points="0,0.325" \marker:rod-h[4]/>
          </marker>
        </defs>
        
        [accessible-svg-title/rod-vertical-1-title
          Rod numeral vertical 1.
          One vertical rod.
        /]
        [accessible-svg-content/
          \rod-v[1]
        /]
        
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-2-title]\
      >
        [accessible-svg-title/rod-vertical-2-title
          Rod numeral vertical 2.
          Two vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[2]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-3-title]\
      >
        [accessible-svg-title/rod-vertical-3-title
          Rod numeral vertical 3.
          Three vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[3]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-4-title]\
      >
        [accessible-svg-title/rod-vertical-4-title
          Rod numeral vertical 4.
          Four vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[4]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-5-title]\
      >
        [accessible-svg-title/rod-vertical-5-title
          Rod numeral vertical 5.
          Five vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[5]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-6-title]\
      >
        [accessible-svg-title/rod-vertical-6-title
          Rod numeral vertical 6.
          One horizontal rod above one vertical rod, like a T.
        /]
        [accessible-svg-content/
          \rod-v[6]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-7-title]\
      >
        [accessible-svg-title/rod-vertical-7-title
          Rod numeral vertical 7.
          One horizontal rod above two vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[7]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-8-title]\
      >
        [accessible-svg-title/rod-vertical-8-title
          Rod numeral vertical 8.
          One horizontal rod above three vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[8]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-vertical-9-title]\
      >
        [accessible-svg-title/rod-vertical-9-title
          Rod numeral vertical 9.
          One horizontal rod above four vertical rods.
        /]
        [accessible-svg-content/
          \rod-v[9]
        /]
      </svg>
  ==
    ; Horizontal
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-1-title]\
      >
        [accessible-svg-title/rod-horizontal-1-title
          Rod numeral horizontal 1.
          One horizontal rod.
        /]
        [accessible-svg-content/
          \rod-h[1]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-2-title]\
      >
        [accessible-svg-title/rod-horizontal-2-title
          Rod numeral horizontal 2.
          Two horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[2]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-3-title]\
      >
        [accessible-svg-title/rod-horizontal-3-title
          Rod numeral horizontal 3.
          Three horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[3]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-4-title]\
      >
        [accessible-svg-title/rod-horizontal-4-title
          Rod numeral horizontal 4.
          Four horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[4]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-5-title]\
      >
        [accessible-svg-title/rod-horizontal-5-title
          Rod numeral horizontal 5.
          Five horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[5]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-6-title]\
      >
        [accessible-svg-title/rod-horizontal-6-title
          Rod numeral horizontal 6.
          One vertical rod above one horizontal rod, like an upside-down T.
        /]
        [accessible-svg-content/
          \rod-h[6]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-7-title]\
      >
        [accessible-svg-title/rod-horizontal-7-title
          Rod numeral horizontal 7.
          One vertical rod above two horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[7]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-8-title]\
      >
        [accessible-svg-title/rod-horizontal-8-title
          Rod numeral horizontal 8.
          One vertical rod above three horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[8]
        /]
      </svg>
    ,
      <svg \svg-attributes:rod
        \accessible-svg-attributes[rod-horizontal-9-title]\
      >
        [accessible-svg-title/rod-horizontal-9-title
          Rod numeral horizontal 9.
          One vertical rod above four horizontal rods.
        /]
        [accessible-svg-content/
          \rod-h[9]
        /]
      </svg>
''''
||||
||||||

----
The text tells us to use
----
====
* __vertical form__ for place values corresponding to __even powers of ten__,
  i.e.~ones, hundreds, myriads~etc., and

* __horizontal form__ for place values corresponding to __odd powers of ten__,
  i.e.~tens, thousands~etc.
====

----
For example, the number~345 is displayed as
  <svg width="108px" viewBox="0.5 -0.3 3 0.6"
    \accessible-svg-attributes[rod-numerals-345-title]\
  >
    [accessible-svg-title/rod-numerals-345-title
      Graphic for the number 345 in rod numerals.
    /]
    [accessible-svg-content/
      <polyline \point points="1,0" \marker:rod-v[3]/>
      <polyline \point points="2,0" \marker:rod-h[4]/>
      <polyline \point points="3,0" \marker:rod-v[5]/>
    /]
  </svg>,
with vertical form for the hundreds digit~3,
horizontal form for the tens digit~4,
and vertical form for the units digit~5.
The alternating between vertical and horizontal forms
prevents ambiguities which would arise
from placing vertical forms next to each other.
----


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P6 : ["i 6"]
    \nav-curr: \P7
    \nav-next: \P8 : ["i 8"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P7"
][
  sun-tzu-i-7
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P7}''~~
]

%footer-element
