{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/svg-styles.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title
    "\sun-tzu's Computational Classic: Volume~I" 《孫子算經\.卷上》 \P6
  %date-created 2019-06-09
  %date-modified 2020-05-13
  \resources:maths
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:sun-tzu
*> [I] ["i" Volume~I]
*> [\P6](\/ You are viewing \P6)
* \header-link:cite
====]]


#
  《孫子算經\.卷上》 \+
  "\sun-tzu's Computational Classic: Volume~I" \+
  \P6. Densities of metals etc.
#

{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P5 : ["i 5"]
    \nav-curr: \P6
    \nav-next: \P7 : ["i 7"]
  |}}
|}}}}


\noscript:maths


[||||
||||]


----
This paragraph gives the __densities__ of some precious \& base metals,
along with those of jade and an unspecific "stone/rock".
----


##{#translation}
  Translation
##

----
Chinese source text: \a[6], \b[147], \c[52062], \d[13]. \+
\d-default
----

<<
  黃金方寸重一斤。 \+
  白金方寸重一十四兩。 \+
  玉方寸重一十二兩。
||
  .[Each] cubic inch of gold weigheth one catty. \+
  .[Each] cubic inch of silver weigheth fourteen taels. \+
  .[Each] cubic inch of jade weigheth twelve taels.
>>
====
* 黃金： gold; \lit yellow metal

* \b[147] has 白銀 for 白金.

* 白金： silver; \lit white metal

* For jade, \b[147] has 一十兩 for 一十二兩.
====

<<
  銅方寸重七兩半。 \+
  鉛方寸重九兩半。 \+
  鐵方寸重六兩。 \+
  石方寸重三兩。
||
  .[Each] cubic inch of copper weigheth seven taels .[and an] half. \+
  .[Each] cubic inch of lead weigheth nine taels .[and an] half. \+
  .[Each] cubic inch of iron weigheth six taels. \+
  .[Each] cubic inch of stone weigheth three taels.
>>
====
* 銅： copper; also brass

* For iron, \b[147] has 七兩 for 六兩.

* 石： stone; \or rock
====


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


##{#commentary}
  Extended commentary
##

----
Let us do a quick comparison of the densities.
For the modern density of~鐵 I have used cast iron,
since that value is available, and the Chinese
probably couldn't get pure iron back then.
石~(stone) I have excluded from the analysis
since it does not adequately pinpoint a specific material.
----

@@[engineering toolbox]
  https://www.engineeringtoolbox.com/density-solids-d_1265.html
@@

||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ;
      Material
    ;
      《孫子算經》 \+
      $\rho_\text{s} / (\unit{taels} \unit{inch}^{-3})$
    ;
      Modern value \+
      $\rho_\text{m} / (\unit{g} \unit{cm}^{-3})$
    ;
      $\dfrac{
        \rho_\text{s} / (\unit{taels} \unit{inch}^{-3})
      }{
        \rho_\text{m} / (\unit{g} \unit{cm}^{-3})
      }$
    ;
      Reference
|:
  ==
    , 金~Gold
    , 16
    , 19.29
    , 0.83
    , [Engineering ToolBox]
  ==
    , 銀~Silver
    , 14
    , 10.5
    , 1.33
    , [Engineering ToolBox]
  ==
    , 玉~Jade
    , 12
    , \03~(roughly)
    , 4~(roughly)
    ,
      [Wikipedia](https://en.wikipedia.org/wiki/Jadeite)
      [Wikipedia](https://en.wikipedia.org/wiki/Nephrite)
  ==
    , 銅~Copper
    , \07.5
    , \08.79
    , 0.85
    , [Engineering ToolBox]
  ==
    , 鉛~Lead
    , \09.5
    , 11.35
    , 0.84
    , [Engineering ToolBox]
  ==
    , 鐵~Cast~iron
    , \06
    , \07.2
    , 0.83
    , [Engineering ToolBox]
''''
||||
||||||

----
Apart from silver and jade, the densities appear to fit quite well,
so \sun-tzu either fluked the measurements for gold, copper, lead and iron
or he was actually a decent experimentalist but buggered up
the measurements for silver and jade.
Or maybe he only had access to *very* impure silver and jade:
----

<##
                         Density comparison
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    xleft       left x pos                            - 3.5
    xright      right x pos                            22
    w           total width                            25.5
    ytop        top y pos                             -18
    ybottom     bottom y pos                            4
    h           total height                           22
  ***********************************************************************
##>

{: \data-point : \\point marker-end="url(#datapoint)" :}

{: \maths-regular : class="maths-regular" :}
{: \maths-italic : class="maths-italic" :}
{: \point : class="points" :}

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-3.5 -18 25.5 22"
  \accessible-svg-attributes[scatter-plot-title]\
>
  [accessible-svg-title/scatter-plot-title
    Scatter plot of \sun-tzu versus modern densities \
    for gold, silver, jade, copper, lead, and cast iron.
    If the clear outliers silver and jade are discarded, \
    a straight line through the origin fits well \
    to the four remaining points (gold, lead, copper, and cast iron).
  /]
  
  {:: \tick-labels:horizontal :: \\font-size:ticks dy="1.35em" ::}
  
  {:: \font-size:axis-indices :: font-size="0.8" ::}
  {:: \font-size:axis :: font-size="1" ::}
  {:: \font-size:material :: font-size="1" ::}
  {:: \font-size:ticks :: font-size="1" ::}
  
  [accessible-svg-content/
    
    <## Marker definitions ##>
    <defs>
      <## Horizontal axis coarse tick ##>
      <marker id="htickcoarse" viewBox="-0.1 0 0.2 0.4"
        markerUnits="userSpaceOnUse"
        refX="0" refY="0" markerWidth="0.2" markerHeight="0.4">
        <line x1="0" y1="0" x2="0" y2="0.4"/>
      </marker>
      <## Horizontal axis fine tick ##>
      <marker id="htickfine" viewBox="-0.1 0 0.2 0.25"
        markerUnits="userSpaceOnUse"
        refX="0" refY="0" markerWidth="0.2" markerHeight="0.25">
        <line x1="0" y1="0" x2="0" y2="0.25"/>
      </marker>
      <## Vertical axis coarse tick ##>
      <marker id="vtickcoarse" viewBox="-0.4 -0.1 0.4 0.2"
        markerUnits="userSpaceOnUse"
        refX="0" refY="0" markerWidth="0.4" markerHeight="0.2">
        <line x1="-0.4" y1="0" x2="0" y2="0"/>
      </marker>
      <## Vertical axis fine tick ##>
      <marker id="vtickfine" viewBox="-0.25 -0.1 0.25 0.2"
        markerUnits="userSpaceOnUse"
        refX="0" refY="0" markerWidth="0.25" markerHeight="0.2">
        <line x1="-0.25" y1="0" x2="0" y2="0"/>
      </marker>
      <## Data point ##>
      <marker id="datapoint"
        markerUnits="userSpaceOnUse"
        viewBox="-0.5 -0.5 1 1"
        refX="0" refY="0" markerWidth="1" markerHeight="1"\
      >
        <line class="thick" x1="-0.3" y1="-0.3" x2="0.3" y2="0.3"/>
        <line class="thick" x1="-0.3" y1="0.3" x2="0.3" y2="-0.3"/>
      </marker>
    </defs>
    
    {:: \ticks:coarse-horizontal ::
      marker-start="url(#htickcoarse)"
      marker-mid="url(#htickcoarse)"
      marker-end="url(#htickcoarse)"
    ::}
    {:: \ticks:fine-horizontal ::
      marker-start="url(#htickfine)"
      marker-mid="url(#htickfine)"
      marker-end="url(#htickfine)"
    ::}
    {:: \ticks:coarse-vertical ::
      marker-start="url(#vtickcoarse)"
      marker-mid="url(#vtickcoarse)"
      marker-end="url(#vtickcoarse)"
    ::}
    {:: \ticks:fine-vertical ::
      marker-start="url(#vtickfine)"
      marker-mid="url(#vtickfine)"
      marker-end="url(#vtickfine)"
    ::}
    
    <## Horizontal axis ##>
    <line x1="0" y1="0" x2="20.5" y2="0"/>
    <text \maths-italic x="11" y="2.6" \font-size:axis>\
      ρ<tspan \maths-regular \font-size:axis-indices
        dx="0.05em" dy="0.25em">m</tspan>\
        <tspan dy="-0.2em">\,/</tspan>\
      (<tspan \maths-regular>g</tspan> <tspan \maths-regular>cm</tspan>\
        <tspan \font-size:axis-indices
        dy="-0.4em">−3</tspan>\
      <tspan dx="0.1em" dy="0.32em">)</tspan>
    </text>
    <## Horizontal axis coarse ticks ##>
    <polyline \point points="5,0 10,0 15,0 20,0"
      \ticks:coarse-horizontal/>
    <text \maths-italic x="5" y="0" \tick-labels:horizontal>5</text>
    <text \maths-italic x="10" y="0" \tick-labels:horizontal>10</text>
    <text \maths-italic x="15" y="0" \tick-labels:horizontal>15</text>
    <text \maths-italic x="20" y="0" \tick-labels:horizontal>20</text>
    
    <## Horizontal axis fine ticks ##>
    <polyline \point
      points =
       "1,0  2,0  3,0  4,0  6,0  7,0  8,0  9,0
        11,0 12,0 13,0 14,0 16,0 17,0 18,0 19,0"
      \ticks:fine-horizontal/>
    
    <## Vertical axis ##>
    <line x1="0" y1="0" x2="0" y2="-17.5"/>
    <text \maths-italic x="-2.4" y="-8.5" \font-size:axis
      transform = "rotate(-90 -2.4 -8.5)">\
      ρ<tspan \maths-regular \font-size:axis-indices
        dy="0.25em">s</tspan>\
        <tspan dy="-0.25em">\,/</tspan>\
      (<tspan \maths-regular>taels</tspan> \
      <tspan \maths-regular>inch</tspan>\
        <tspan \font-size:axis-indices
        dy="-0.4em">−3</tspan>\
      <tspan dx="0.1em" dy="0.32em">)</tspan>
    </text>
    
    <## Vertical axis coarse ticks ##>
    <polyline \point points="0,-5 0,-10 0,-15"
      \ticks:coarse-vertical/>
    <text \maths-italic x="0" y="-5" \font-size:ticks
      dx="-1em" dy="0.3em">5</text>
    <text \maths-italic x="0" y="-10" \font-size:ticks
      dx="-1.2em" dy="0.3em">10</text>
    <text \maths-italic x="0" y="-15" \font-size:ticks
      dx="-1.2em" dy="0.3em">15</text>
    
    <## Vertical axis fine ticks ##>
    <polyline \point
      points =
       "0, -1 0, -2 0, -3 0, -4 0, -6 0, -7 0, -8 0,-9
        0,-11 0,-12 0,-13 0,-14 0,-16 0,-17"
      \ticks:fine-vertical/>
    
    <## Data points ##>
    
    <## Gold ##>
    <polyline \data-point points="19.29,-16"/>
    <text x="19.29" y="-16" \font-size:material
      dx="0.8em" dy="1.4em">~~金~~ Gold</text>
    <## Silver ##>
    <polyline \data-point points="10.5,-14"/>
    <text x="10.5" y="-14" \font-size:material
      dy="-0.6em">~~銀~~ Silver</text>
    <## Jade ##>
    <polyline \data-point points="3,-12"/>
    <text x="3" y="-12" \font-size:material
      dy="-0.6em">~~玉~~ Jade</text>
    <## Copper ##>
    <polyline \data-point points="8.79,-7.5"/>
    <text x="8.79" y="-7.5" \font-size:material
      dx="-1.5em" dy="-0.7em">~~銅~~ Copper</text>
    <## Lead ##>
    <polyline \data-point points="11.35,-9.5"/>
    <text x="11.35" y="-9.5" \font-size:material
      dx="-1.4em" dy="-0.6em">~~鉛~~ Lead</text>
    <## Cast iron ##>
    <polyline \data-point points="7.2,-6"/>
    <text x="7.2" y="-6" \font-size:material
      dx="2.2em" dy="1.4em">~~鐵~~ Cast iron</text>
    
    <## Line of best fit (slope 0.834229) ##>
    <line x1="0" y1="0" x2="20" y2="-16.68458"/>
  
  /]
  
</svg>
||||

----
Discarding the outliers 銀~(silver) and 玉~(jade)
and forcing a least squares fit through the origin, we get
----
$$
  \frac{\rho_\text{s}}{\unit{taels} \unit{inch}^{-3}}
  = 0.834229 \cdot \frac{\rho_\text{m}}{\unit{g} \unit{cm}^{-3}}
$$
----
with R<sup>2</sup>~=~0.999915; the slope has standard error~0.004453.
----

----
Assuming that \sun-tzu's $\rho_\text{s}$ and toady's $\rho_\text{m}$
are referring to the same material,
we *should* have that $\rho_\text{s} = \rho_\text{m}$.
Therefore we obtain the following experimental conversion relation
between \sun-tzu and modern density units:
----
$$
  1 \unit{tael} \unit{inch}^{-3} = (1.1987 \pm 0.0064) \unit{g} \unit{cm}^{-3}.
$$


{{{{|
  \nav-up: Volume~I : ["i"]
  {{|
    \nav-prev: \P5 : ["i 5"]
    \nav-curr: \P6
    \nav-next: \P7 : ["i 7"]
  |}}
|}}}}


\cite-this-page[
  "\sun-tzu's Computational Classic: Volume~I \P6"
][
  sun-tzu-i-6
][
  ~~``{Sun}~{Tz{\u u}'s} {Computational} {Classic}: {Volume}~{I} {\P6}''~~
]

%footer-element
