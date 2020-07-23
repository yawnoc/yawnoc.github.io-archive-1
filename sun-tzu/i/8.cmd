{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P8
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:rendering
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P8](\/ You are viewing \P8)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P8. Rod calculus: multiplication algorithm
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P7 : ["i 7"]
    \nav-curr: \P8
    \nav-next: \P9 : ["i 9"]
  |}}
|}}}}


[||||
||||]


----
This paragraph describes the algorithm for __multiplying two integers__
represented using rod numerals.
For a brief description of rod numerals,
see [\P7 commentary](/sun-tzu/i/7#commentary).
----


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



##{#translation}
  Translation
##

----
Chinese source text: \a[6], \b[147], \c[52064], \d[14]. \+
\d-default
----

<<
  凡乘之法，重置其位。
||
  .[In the] method of all multiplication,
  put into .[a] stack .[the] places.
>>
====
* 重： .[a] stack \+
  重，平聲， \C ch'ung4, \M ch(o/)ng
====

<<
  上下相觀，上位有十步至十，有百步至百，有千步至千。
||
  .[That the] upper .[and] lower .[places] view each other:
  be there tens .[in the] upper places, step unto .[the] tens;
  be there hundreds, step unto .[the] hundreds;
  be there thousands, step unto .[the] thousands.
>>
====
* \b[147] has 頭位 for 上位,
  both here and in many of the paragraphs to follow.

* 至： unto; \or till

* After putting the numbers into two separate rows,
  the text tells us to "step" (i.e.~shift to the left) the lower number
  until its units digit is vertically in line
  with the top number's most significant digit.
  For example, if we wish to compute 1989 × 64,
  we first shift the lower number 64 to the left
  until its units digit, 4, is in line
  with the upper number's thousands digit, 1:
  
  ||||{.centred-block}
    <svg width="180px" height="100%" viewBox="0.5 -0.5 5 3"
      \accessible-svg-attributes[rod-numerals-1989-times-64-title]\
    >
      
      <## Rod definitions ##>
      
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
      
      [accessible-svg-title/rod-numerals-1989-times-64-title
        Initial arrangement for multiplying 1989 by 64.
        The upper row contains the rod numerals for 1989, \
        and the lower row contains the rod numerals for 64, \
        where the upper~1 is horizontally aligned with the lower~4.
      /]
      
      [accessible-svg-content/
        
        <## 1989 ##>
        <polyline \point points="2,0" \marker:rod-h[1]/>
        <polyline \point points="3,0" \marker:rod-v[9]/>
        <polyline \point points="4,0" \marker:rod-h[8]/>
        <polyline \point points="5,0" \marker:rod-v[9]/>
        
        <## 64 ##>
        <polyline \point points="1,2" \marker:rod-v[6]/>
        <polyline \point points="2,2" \marker:rod-h[4]/>
        
      /]
    </svg>
  ||||
  
  Or, in Arabic numerals for readability:
  
  ||||{.centred-block}
    <svg width="180px" height="100%" viewBox="0.5 -0.7 5 2.8"
      \accessible-svg-attributes[arabic-numerals-1989-times-64-title]\
    >
      
      [accessible-svg-title/arabic-numerals-1989-times-64-title
        Initial arrangement for multiplying 1989 by 64, \
          with Arabic numerals instead of rod numerals.
        The upper row contains 1989, and the lower row contains 64, \
        where the upper~1 is horizontally aligned with the lower~4.
      /]
      
      [accessible-svg-content/
        
        {: \font-size : font-size="0.8" :}
        
        <## 1989 ##>
        <text x="2" y="0" \font-size>1</text>
        <text x="3" y="0" \font-size>9</text>
        <text x="4" y="0" \font-size>8</text>
        <text x="5" y="0" \font-size>9</text>
        
        <## 64 ##>
        <text x="1" y="2" \font-size>6</text>
        <text x="2" y="2" \font-size>4</text>
        
      /]
      
    </svg>
  ||||
  
====

<<
  以上命下，所得之數，列於中位。言十即過，不滿自如。
||
  Name the lower with the upper.
  .[The] quantities which result,
  .[are] arranged in .[a] row in .[the] middle places.
  Tens are carried,
  .[but those] not reaching .[ten], .[left] as themselves.
>>
====
* 命： name \+
  Or maybe "command/order" as in "operate on".

* 列： arranged in .[a] row; \or displayed

* 言 \+
    Pretty sure this is a speech-assist word, with no meaning.

* 過： carried; \lit passed
====

<<
  上位乘訖者，先去之。 \+
  下位乘訖者，則俱退之。
||
  .[The] upper places which .[one hath] finished multiplying:
  remove them first. \+
  .[The] lower places which .[one hath] finished multiplying:
  retreat them all.
>>
====
* 訖：終也，了也； finished \+
  訖，居迄切， \C kat7, \M q(i\)

@@[link to source code]
  /sun-tzu/code/animations
@@

* A concrete example of the algorithm does not appear until [\P13] ["i 13"],
  so I will provide my own.
  Here is an animation ([link to source code])
  showing the multiplication 1989 × 64 = 127296,
  where I have used usual numerals rather than rods (for readability)
  and I have split the middle row into two rows
  to make the intermediate additions clearer.
  I have greyed out the finished digits instead of removing them:
  
  ||||{.centred-block}
    ![Animation for \sun-tzu multiplication: 1989 multiplied by 64](
      /sun-tzu/code/multiply-1989-64.gif
    )
  ||||
  
  The algorithm pretty much works like modern long multiplication,
  except that you go from left to right.
  Indeed the advantage of using counting rods is that
  carrying simply consists of putting more rods down,
  whereas with pen \&~paper, you must work from right to left
  and finish all the carrying before proceding to the next digit.

* The instruction 俱退之, "retreat them all",
  refers to the shifting to the right of the lower number 64,
  after both the 6 and the 4 have been multiplied through.
====

<<
  六不積，五不隻。
||
  Sixes .[are] not accumulated;
  fives, not single.
>>
====
* 六不積 \+
  This is saying that the digit~6 in rod numerals is displayed as either
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[rod-numeral-vertical-6-title]\
    >
      [accessible-svg-title/rod-numeral-vertical-6-title
        Graphic for rod numeral vertical 6.
        One horizontal rod above one vertical rod, like a T.
      /]
      [accessible-svg-content/
        \rod-v[6]
      /]
    </svg>
  or
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[rod-numeral-horizontal-6-title]\
    >
      [accessible-svg-title/rod-numeral-horizontal-6-title
        Graphic for rod numeral horizontal 6.
        One vertical rod above one horizontal rod, like an upside-down T.
      /]
      [accessible-svg-content/
        \rod-h[6]
      /]
    </svg>,
  but not
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[improper-rod-numeral-vertical-6-title]\
    >
      [accessible-svg-title/improper-rod-numeral-vertical-6-title
        Graphic for improper rod numeral vertical 6.
        Six vertical rods.
      /]
      [accessible-svg-content/
        <polyline \point points="-0.25,0" \marker:rod-v[1]/>
        <polyline \point points="-0.15,0" \marker:rod-v[1]/>
        <polyline \point points="-0.05,0" \marker:rod-v[1]/>
        <polyline \point points="0.05,0" \marker:rod-v[1]/>
        <polyline \point points="0.15,0" \marker:rod-v[1]/>
        <polyline \point points="0.25,0" \marker:rod-v[1]/>
      /]
    </svg>
  or
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[improper-rod-numeral-horizontal-6-title]\
    >
      [accessible-svg-title/improper-rod-numeral-horizontal-6-title
        Graphic for improper rod numeral horizontal 6.
        Six horizontal rods.
      /]
      [accessible-svg-content/
        <polyline \point points="0,-0.25" \marker:rod-h[1]/>
        <polyline \point points="0,-0.15" \marker:rod-h[1]/>
        <polyline \point points="0,-0.05" \marker:rod-h[1]/>
        <polyline \point points="0,0.05" \marker:rod-h[1]/>
        <polyline \point points="0,0.15" \marker:rod-h[1]/>
        <polyline \point points="0,0.25" \marker:rod-h[1]/>
      /]
    </svg>.

* 五不隻 \+
  This is saying that the digit~5 in rod numerals is displayed as either
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[rod-numeral-vertical-5-title]\
    >
      [accessible-svg-title/rod-numeral-vertical-5-title
        Graphic for rod numeral vertical 5.
        Five vertical rods.
      /]
      [accessible-svg-content/
        \rod-v[5]
      /]
    </svg>
  or
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[rod-numeral-horizontal-5-title]\
    >
      [accessible-svg-title/rod-numeral-horizontal-5-title
        Graphic for rod numeral horizontal 5.
        Five horizontal rods.
      /]
      [accessible-svg-content/
        \rod-h[5]
      /]
    </svg>,
  but not
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[improper-rod-numeral-vertical-5-title]\
    >
      [accessible-svg-title/improper-rod-numeral-vertical-5-title
        Graphic for improper rod numeral vertical 5.
        One horizontal rod above zero vertical rods.
      /]
      [accessible-svg-content/
        <polyline \point points="0,0" \marker:rod-v-g[5]/>
      /]
    </svg>
  or
    <svg width="36px" viewBox="-0.5 -0.3 1 0.6"
      \accessible-svg-attributes[improper-rod-numeral-horizontal-5-title]\
    >
      [accessible-svg-title/improper-rod-numeral-horizontal-5-title
        Graphic for improper rod numeral horizontal 5.
        One vertical rod above zero horizontal rods.
      /]
      [accessible-svg-content/
        <polyline \point points="0,0" \marker:rod-h-g[5]/>
      /]
    </svg>
  since it would be indistinguishable from the rod numeral representation
  for the digit~1.
====

<<
  上下相乘，至盡則已。
||
  The upper .[and] the lower .[are] mutually multiplied,
  finishing .[upon] reaching exhaustion.
>>
====
* \c[52064] erroneously has 土下 for 上下.

* 盡： exhaustion; \or .[the] end
====


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P7 : ["i 7"]
    \nav-curr: \P8
    \nav-next: \P9 : ["i 9"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P8"
][
  sun-tzu-i-8
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P8}''~~
]

%footer-element
