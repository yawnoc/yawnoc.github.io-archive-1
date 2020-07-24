{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/svg-styles.cmd +}

%%
  %title Projectile motion: optimal launch angle from a platform
  %date-created 2019-04-13
  %date-modified 2020-04-26
  \resources:maths
  %description
    A derivation of the optimal launch angle (which maximises range) \
    for projectile motion (no air resistance) from a raised platform.
  %css a~~
    li {
      margin-bottom: 1.3em;
    }
  ~~
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:result
* \header-link:cite
====]]



# %title #



\noscript:maths

[||||
See also: [Projectile motion: optimal launch angle for weak quadratic drag](
  /math/projectile-weak-drag
)
||||]


----
In the absence of air resistance, a launch angle of 45° maximises range.
If the projectile is instead launched from a raised platform,
the optimal launch angle still has a closed-form expression,
although more algebra is required to compute it.
----


##{#solution}
  Solution
##

----
__Manuscript:__ [`platform.pdf`](
  https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
    manuscripts/platform.pdf
)
----

<##
                           Trajectory diagram
  ***********************************************************************
  We choose the parabola with initial height h and range R
  with peak along x == b.
  
  In the usual (non-reflected-y) coordinates, this is of the form
    y == C - 1/2 A (x - b)^2.
  From the initial and final points (x, y) = (0, h) and (x, y) = (R, 0),
  we have
    
    h == C - 1/2 A b^2
    0 == C - 1/2 A (R - b)^2
    
  which solves to give
    
    A == 2 h / [R (R - 2b)]
    C == h (R - b)^2 / [R (R - 2b)].
    
  Therefore the parabola is given by
    
    y == -h (R - x)/R * (x + R - 2b)/(R - 2b).
    
  Now y' == - A (x - b), so we have initial and final slopes
    
    y'(0) == A b == 2 h b / [R (R - 2b)]
    y'(R) == - A (R - b) == - 2 h (R - b) / [R (R - 2b)].
    
  The Bezier control point (x_c, y_c) for the required quadratic path (Q)
  is located at the intersection of the initial and final tangent lines,
  whence we have
    
    y_c == 2 h b / [R (R - 2b)] x_c + h
    y_c == - 2 h (R - b) / [R (R - 2b)] (x_c - R),
    
  which solves to give
    
    x_c == R/2
    y_c == h (R - b) / (R - 2b).
  
  For the actual values, we choose
    initial height h = 2
    range R == 5
    peak horizontal position b == 2
  yielding
    initial slope y'(0) == 1.6
    control point (x_c, y_c) == (2.5, 6).
  
  Henceforth we switch to SVG (reflected-y) coordinates.
  
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    h           initial height                         -2
    r           range                                   5
    b           x pos of peak                           2
    xc          x pos of bezier control point           2.5
    yc          y pos of bezier control point          -6
    m           slope of velocity vector                1.6
    wu          width of velocity vector                1
    hu          height of velocity vector               1.6
    wp          width of platform                       0.5
    xleft       left x pos                             -1
    xright      right x pos                             6.5
    w           total width                             7.5
    ytop        top y pos                              -4
    ybottom     bottom y pos                            0.5
    h           total height                            4.5
  ***********************************************************************
      y
      |    _ u
      |    /|
      |   /  __
      |  / _    _
      | //         \
      |/phi            \
   h _|_                  \
      |                     \
      |                       \
      |                         \
      |                            \
      |                               \
      |_________________________________|__ x
                                        R
  ***********************************************************************
##>

[svg-styles/
  text {
    \svg-style:text-declarations
  }
  line, path {
    \svg-style:stroke-declarations
  }
  \svg-style:maths-font-rulesets
/]

||||{.centred-block}
<svg width="360px" height="100%" viewBox="-1 -4 7.5 4.5"
  \accessible-svg-attributes[trajectory-diagram-title]\
>
  [accessible-svg-title/trajectory-diagram-title
    Projectile motion from a raised platform at height h along the y-axis. \
    The initial speed is u and the initial angle is phi. \
    The projectile takes a parabolic path \
    and strikes the ground at range R along the x-axis.
  /]
  
  [accessible-svg-content/
    
    {: \maths-italic : class="maths-italic" :}
    {: \font-size : font-size="0.45" :}
    
    <## Marker definitions ##>
    <defs>
      <## velocity arrowhead ##>
      <marker
        id="arrowhead" viewBox="0 -0.15 0.5 0.3"
        refX="0.5" refY="0"
        markerUnits="userSpaceOnUse"
        markerWidth="0.5" markerHeight="0.15"
        orient="auto-start-reverse">
        <path d="M 0, -0.15 L 0, 0.15 L 0.5, 0 z"/>
      </marker>
    </defs>
    
    <## x-axis ##>
    <line x1="0" y1="0" x2="5.5" y2="0"/>
    <text \maths-italic x="5.5" y="0" \font-size
      dx="0.5em" dy="0.3em">x</text>
    
    <## y-axis ##>
    <line x1="0" y1="0" x2="0" y2="-3.5"/>
    <text \maths-italic x="0" y="-3.5" \font-size
      dy="-0.5em">y</text>
    
    <## initial height h ##>
    <line x1="-0.2" y1="-2" x2="0.7" y2="-2"/>
    <text \maths-italic x="-0.25" y="-2" \font-size
      dx="-0.5em" dy="0.3em">h</text>
    
    <## trajectory ##>
    <path d="M 0,-2 Q 2.5,-6 5,0" fill="none"/>
    
    <## launch angle phi ##>
    <text \maths-italic x="0" y="-2" \font-size
      dx="1em" dy="-0.35em">ϕ</text>
    
    <## range R ##>
    <text \maths-italic x="5" y="0" \font-size
      dy="1em">R</text>
    
    <## velocity vector u ##>
    <line x1="0" y1="-2" x2="1" y2="-3.6" marker-end = "url(#arrowhead)"/>
    <text \maths-italic x="1" y="-3.6" \font-size
      dx="0.5em">u</text>
  
  /]
  
</svg>
||||

----
Suppose the projectile is launched at speed $u$ and angle $\phi$
from height $h$ above the ground,
which has gravitational field strength $g$,
so that the motion is given by
----
$$
  \begin{aligned}
    x (t) &= u t \cos\phi \\
    y (t) &= u t \sin\phi - \frac{1}{2} g t^2 + h.
  \end{aligned}
$$

----
The flight time is the positive solution to the quadratic $y (t) = 0$,
which is
----
$$
  t =
    \frac{u}{g}
    \roundbr{
      \sin\phi + \sqrt{\sin^2\phi + C}
    },
$$
----
where $C = 2 g h / u^2$ is the dimensionless ratio
between the initial potential and kinetic energies of the projectile.
Substituting the flight time into $x (t)$ gives the range
----
$$
  R =
    \frac{u^2 \cos\phi}{g}
    \roundbr{
      \sin\phi + \sqrt{\sin^2\phi + C}
    }.
$$

----
To maximise the range $R$ with respect to the launch angle $\phi$,
we compute the derivative $\pd R / {\pd\phi}$.
After some algebra, we obtain
----
$$
  \frac{\pd R}{\pd\phi} =
    \frac{2h}{C}
    \colb{\roundbr{
      \beta + \sqrt{\beta^2 + C}
    }}
    \colr{\squarebr{
      \frac{1 - \beta^2}{\sqrt{\beta^2 + C}} - \beta
    }},
$$
----
where for brevity $\beta = \sin\phi$.
We then carefully consider the ways in which $\pd R / {\pd\phi}$ can vanish:
----

++++
  
1.
  If $C = \infty$, then
  $$
    \frac{\pd R}{\pd\phi}
    = \frac{2h}{C}
      \colb{\roundbr{\sqrt{C}}}
      \colr{\squarebr{-\beta}}
    = - 2\beta \cdot \frac{h}{\sqrt{C}},
  $$
  which vanishes assuming $h$ is finite.
  But since $C = 2 g h / u^2$ is infinite, this only occurs if
  $g = \infty$ (infinitely strong gravity) or
  $u = 0$ (zero launch speed),
  and in either case the range is zero, i.e.~$R$ is minimised.

2.
  If $\colb C = 0$ and $\colb \beta < 0$, then
  $$
    \begin{aligned}
      \frac{\pd R}{\pd\phi}
      &=
        \frac{2h}{C}
        \colb{\roundbr{
          \beta
            +
          (-\beta) \roundbr{1 + \frac{C}{2 \beta^2}}
        }}
        \colr{\squarebr{
          \frac{1 - \beta^2}{-\beta}
            + 
          \frac{\beta^2}{-\beta}
        }}
          \\[\tallspace]
      &=
        \frac{2h}{C}
        \colb{\roundbr{
          - \frac{C}{2 \beta}
        }}
        \colr{\squarebr{
          - \frac{1}{\beta}
        }}
          \\[\tallspace]
      &= \frac{h}{\beta^2},
    \end{aligned}
  $$
  which vanishes only if $h = 0$.
  But since $\phi = \sin^{-1}\beta < 0$, this corresponds to
  launching the projectile downwards starting from ground level,
  and again the range is zero.

3.
  If $
    \colr{
      \squarebr{\frac{1 - \beta^2}{\sqrt{\beta^2 + C}} - \beta} = 0
    }
  $,
  then $\pd R / {\pd\phi}$ vanishes unconditionally, and we have
  $$
    \begin{aligned}
      (1 - \beta^2)^2 &= \beta^2 (\beta^2 + C) \\
      \beta &= \frac{1}{\sqrt{C + 2}},
    \end{aligned}
  $$
  which indeed corresponds to the positive maximum range, which is
  $$
    \begin{aligned}
      R
      &=
        \frac{u^2}{g}
        \sqrt{1 - \beta^2}
        \roundbr{\beta + \sqrt{\beta^2 + C}}
          \\[\tallspace]
      &=
        \frac{u^2}{g}
        \sqrt{C + 1}.
    \end{aligned}
  $$

++++


##{#result}
  Result
##


----
Hence the __optimal launch angle__ for a projectile
launched at speed $u$ from height $h$
in a gravitational field of strength $g$ is
----
$${.important}
  \phi = \sin^{-1} \frac{1}{\sqrt{2 g h / u^2 + 2}},
$$
----
achieving a __maximum range__ of
----
$${.important}
  R = \frac{u^2}{g} \sqrt{2 g h / u^2 + 1}.
$$

----
In particular:
----
====

* For $h = 0$, we recover
  $\phi = \sin^{-1} (1/\sqrt{2}) = 45\degree$ and $R = u^2 / g$,
  which are the optimal angle and maximum range
  respectively for a projectile launched from ground level.
  For small $h$ we have
  $$
    \phi \asy 45\degree - \frac{g h}{2 u^2} \cdot \frac{180\degree}{\pi}
  $$
  and
  $$
    R \asy \frac{u^2}{g} + h.
  $$

* For $h = \infty$, the optimal angle is
    $\phi = \sin^{-1} (1 / \sqrt{\infty}) = 0$
  and the maximum range is
    $R = u^2 / g \cdot \sqrt{\infty} = \infty$.
  Projectiles should be launched almost horizontally
  from very tall platforms; asymptotically we have
  $$
    \phi \asy \frac{1}{\sqrt{2 g h / u^2}}
      = \frac{u}{\sqrt{2 g h}} \cdot \frac{180 \degree}{\pi}
  $$
  and
  $$
    R \asy \frac{u^2}{g} \sqrt{2 g h / u^2} = u \sqrt{\frac{2 h}{g}}.
  $$

====

----
Finally note that the optimal angle depends only on
the dimensionless ratio $C = 2 g h / u^2$.
In fact this may be shown using dimensional analysis
without actually having to solve the problem;
the only parameters are $u$, $g$ and $h$,
so the only dimensionless group (up to a power) is $g h / u^2$.
----

\cite-this-page[][projectile-platform][%title]

%footer-element
