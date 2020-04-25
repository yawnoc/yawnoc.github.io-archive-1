(+ res/general-syntax.cmd +)

%%
  %title Projectile motion: optimal launch angle from a platform
  %title-suffix \title-suffix
  %author Conway
  %date-created 2019-04-13
  %date-modified 2020-04-26
  %resources
    (+ res/main-resources.cmd +)
    (+ res/rendering-javascript.cmd +)
    (+ res/maths-resources.cmd +)
  %description
    A derivation of the optimal launch angle (which maximises range) \
    for projectile motion (no air resistance) from a raised platform.
%%

[[====
* \link:home
* \link:top
* \link:result
* \link:cite
====]]



# %title #



\noscript[]

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


##solution
  Solution
##

----
__Manuscript:__ [`platform.pdf`](/manuscripts/platform.pdf)
----

<!--                       Projectile diagram
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    h           initial height                         -2
    r           range                                   5
    xb          x pos of bezier control point           1.5
    yb          y pos of bezier control point          -5
    m           slope of velocity vector                2
    wu          width of velocity vector                0.8
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
  -->

[svg-styles/
  text {
    \svg-style:text-declarations
  }
  line, path {
    \svg-style:stroke-declarations
  }
  \svg-style:maths-font-rulesets
/]

||||{centred-block}
<svg class="fit-width" width="360px" viewBox="-1 -4 7.5 4.5">
  
  {: {it} : class="maths-italic" :}
  {: {fs} : font-size="0.45" :}
  
  <!-- Marker definitions -->
  <defs>
    <!-- velocity arrowhead -->
    <marker
      id="arrowhead" viewBox="0 -0.15 0.5 0.3"
      refX="0.5" refY="0"
      markerWidth="0.5" markerHeight="0.15"
      orient="auto-start-reverse">
      <path d="M 0, -0.15 L 0, 0.15 L 0.5, 0 z"/>
    </marker>
  </defs>
  
  <!-- x-axis -->
  <line x1="0" y1="0" x2="5.5" y2="0"/>
  <text {it} x="5.5" y="0" {fs} dx="0.5em" dy="0.3em">x</text>
  
  <!-- y-axis -->
  <line x1="0" y1="0" x2="0" y2="-3.5"/>
  <text {it} x="0" y="-3.5" {fs} dy="-0.5em">y</text>
  
  <!-- initial height h -->
  <line x1="-0.25" y1="-2" x2="0.5" y2="-2"/>
  <text {it} x="-0.25" y="-2" {fs} dx="-0.5em" dy="0.3em">h</text>
  
  <!-- trajectory -->
  <path d="M 0,-2 Q 1.5,-5 5,0" fill="none"/>
  
  <!-- launch angle phi -->
  <text {it} x="0.6" y="-2" {fs} dx="-0.5em" dy="-0.35em">ϕ</text>
  
  <!-- range R -->
  <text {it} x="5" y="0" {fs} dy="1em">R</text>
  
  <!-- velocity vector u -->
  <line x1="0" y1="-2" x2="0.8" y2="-3.6" marker-end = "url(#arrowhead)"/>
  <text {it} x="0.8" y="-3.6" {fs} dx="0.5em">u</text>
  
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
The flight time is the positive solution to the quadratic
$y (t) = 0$, i.e.
----
$$
  \begin{aligned}
    t
    &=
      \frac{1}{g}
      \left(
        u \sin\phi
      + \sqrt{u^2 \sin^2\phi + 2 g h}
      \right) \\
    &=
      \frac{u}{g}
      \left(
        \sin\phi
      + \sqrt{\sin^2\phi + C}
      \right)
  \end{aligned}
$$
----
where $C = 2 g h / u^2$ is the dimensionless ratio
between the initial potential and kinetic energies of the projectile.
Substituting the flight time into $x (t)$ gives the range
----
$$
  R =
    \frac{u^2 \cos\phi}{g}
    \left(
      \sin\phi
    + \sqrt{\sin^2\phi + C}
    \right).
$$
----

To maximise the range $R$ with respect to the launch angle $\phi$,
we compute
----
$$
  \begin{aligned}
    \frac{\pd R}{\pd\phi}
    &=
      \frac{u^2}{g}
      \left[
        \cos\phi \cdot \cos\phi
      - \sin\phi \cdot \sin\phi
      + \cos\phi
        \cdot
        \frac{2 \sin\phi \cos\phi}{2 \sqrt{\sin^2\phi + C}}
      - \sin\phi \sqrt{\sin^2\phi + C}
      \right] \\
    &=
      \frac{u^2}{g}
      \left[
        \cos^2\phi
        \left(
          1 + \frac{\sin\phi}{\sqrt{\sin^2\phi + C}}
        \right)
      - \sin\phi
        \left(
          \sin\phi + \sqrt{\sin^2\phi + C}
        \right)
      \right].
  \end{aligned}
$$

----
For brevity let $\beta = \sin\phi$. Then
----
$$
  \begin{aligned}
    \frac{\pd R}{\pd\phi}
    &=
      \frac{u^2}{g}
      \left[
        (1 - \beta^2)
        \left(
          1 + \frac{\beta}{\sqrt{\beta^2 + C}}
        \right)
      - \beta
        \left(
          \beta + \sqrt{\beta^2 + C}
        \right)
      \right] \\
    &=
      \frac{u^2}{g}
      \left(
        \beta + \sqrt{\beta^2 + C}
      \right)
      \left[
        \frac{1 - \beta^2}{\sqrt{\beta^2 + C}}
      - \beta
      \right] \\
    &=
      \frac{2h}{C}
      {\colb
        \left(
          \beta + \sqrt{\beta^2 + C}
        \right)
      }
      {\colr
        \left[
          \frac{1 - \beta^2}{\sqrt{\beta^2 + C}}
        - \beta
        \right]
      }.
  \end{aligned}
$$

----
We carefully consider the ways in which $\pd R / \pd\phi$ can vanish:
----

++++
  
1.
  If $C = \infty$, then
  $$
    \frac{\pd R}{\pd\phi}
    = \frac{2h}{C}
      {\colb \left( \sqrt{C} \right)}
      {\colr \left[ -\beta \right]}
    = - 2\beta \cdot \frac{h}{\sqrt{C}},
  $$
  which vanishes assuming $h$ is finite.
  But since $C = 2 g h / u^2$ is infinite, this only occurs if
  $g = \infty$ (infinitely strong gravity) or
  $u = 0$ (zero launch speed),
  and in either case the range is zero, i.e.~$R$ is minimised.

2.
  If $C = 0$ and $\beta < 0$, then
  $$
    \begin{aligned}
      \frac{\pd R}{\pd\phi}
      &=
        \frac{2h}{C}
        {\colb
          \left(
            \beta
          + (-\beta)
            \left(
              1
            + \frac{C}{2 \beta^2}
            \right)
          \right)
        }
        {\colr
          \left[
            \frac{1 - \beta^2}{-\beta}
          + \frac{\beta^2}{-\beta}
          \right]
        } \\
      &=
        \frac{2h}{C}
        {\colb
          \left(
          - \frac{C}{2 \beta}
          \right)
        }
        {\colr
          \left[
          - \frac{1}{\beta}
          \right]
        } \\
      &= \frac{h}{\beta^2},
    \end{aligned}
  $$
  which vanishes only if $h = 0$.
  But since $\phi = \sin^{-1}\beta < 0$, this corresponds to
  launching the projectile downwards starting from ground level,
  and again the range is zero.

3.
  If $\colr
    \left[
      \frac{1 - \beta^2}{\sqrt{\beta^2 + C}}
    - \beta
    \right] = 0$,
  then $\pd R / \pd\phi$ vanishes unconditionally, and we have
  $$
    \begin{aligned}
      (1 - \beta^2)^2 &= \beta^2 (\beta^2 + C) \\
      1 - 2 \beta^2 + \cancel{\beta^4}
        &= \cancel{\beta^4} + C \beta^2 \\
      1 &= (C + 2) \beta^2 \\
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
        \left(
          \beta
        + \sqrt{\beta^2 + C}
        \right) \\
      &=
        \frac{u^2}{g}
        \sqrt{1 - \frac{1}{C + 2}}
        \left(
          \frac{\cancel{\beta^2}}{\beta}
        + \frac{1 - \cancel{\beta^2}}{\beta}
        \right) \\
      &=
        \frac{u^2}{g}
        \sqrt{\frac{C + 1}{\cancel{C + 2}}}
          \cdot
        \frac{1}{\cancel{\beta}} \\
      &=
        \frac{u^2}{g}
        \sqrt{C + 1}.
    \end{aligned}
  $$

++++


##result
  Result
##


----
Hence the __optimal launch angle__ for a projectile
launched at speed $u$ from height $h$
in a gravitational field of strength $g$ is
----
$${important}
  \phi = \sin^{-1} \frac{1}{\sqrt{2 g h / u^2 + 2}},
$$
----
achieving a __maximum range__ of
----
$${important}
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
    $\phi = \sin^{-1} (1/\sqrt{\infty}) = 0$
  and the maximum range is
    $R = u^2/g \cdot \sqrt{\infty} = \infty$.
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
