{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/svg-styles.cmd +}

%%
  %title Projectile motion: optimal launch angle for weak quadratic drag
  %date-created 2019-06-21
  %date-modified 2020-06-10
  \resources:maths
  %description
    A derivation of the optimal launch angle (which maximises range) \
    for projectile motion in weak quadratic drag using perturbation theory.
%%

[[====
* \header-link:home
* \header-link:top
* \header-link:result
* [Numerics](#numerics  Numerical verification)
* \header-link:cite
====]]


# %title #



\noscript:maths

[||||
See also: [Projectile motion: optimal launch angle from a platform](
  /math/projectile-platform
)
||||]


----
In the absence of air resistance, a launch angle of 45° maximises range.
When there is drag linear in speed,
the equations of motion can be integrated analytically,
and closed-form expressions in terms of the [Lambert W-function][lambert-w]
can be obtained for the optimal launch angle;
see [Packel \&~Yuen (2004)][packel-yuen].
However, a more realistic model of air resistance
has drag proportional to the *square* of speed,
for which the equations of motion are nonlinear and
analytic solutions cannot be obtained.
----

@@[lambert-w]
  http://mathworld.wolfram.com/LambertW-Function.html
@@
@@[packel-yuen]
  https://www.researchgate.net/publication/\
    228851314_Projectile_Motion_with_Resistance_and_the_Lambert_W_Function
  Projectile Motion with Resistance and the Lambert W Function
@@

----
In high school there was this rather horrible investigation where
we had to (experimentally) compare the optimal launch angle of
a golf ball and a ping-pong ball.
At the time I believed that nothing much could be done in terms of modelling
other than solving the equations of motion numerically,
but back then I knew nothing of scaling and perturbation theory.
Now armed with some basic knowledge of these very useful tools,
I have been able to derive an asymptotic expansion
for the optimal launch angle when air resistance is relatively weak.
----

[svg-styles/
  text {
    \svg-style:text-declarations
  }
  \svg-style:maths-font-rulesets
  line, polyline {
    \svg-style:stroke-declarations
  }
  polyline {
    fill: none;
  }
  polyline.points {
    fill: none;
    stroke: none;
  }
/]


##{#solution}
  Solution
##

----
__Manuscript:__ [`resistance.pdf`~(983~KB)][manuscript]
----

@@[manuscript]
  https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
    manuscripts/resistance.pdf
@@

<##
                          Trajectory diagram
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    r           range                                  10
    m           slope of velocity vector                2
    wu          width of velocity vector                1
    hu          height of velocity vector               2
    xleft       left x pos                            - 2
    xright      right x pos                            12
    w           total width                            14
    ytop        top y pos                             - 9
    ybottom     bottom y pos                            1
    h           total height                           10
  ***********************************************************************
##>

||||{.centred-block}
<svg width="360px" height="100%" viewBox="-2 -9 14 10"
  \accessible-svg-attributes[trajectory-diagram-title]\
>
  [accessible-svg-title/trajectory-diagram-title
    Projectile motion from the origin in weak quadratic drag. \
    The initial speed is u and the initial angle is phi. \
    The projectile takes an asymmetric path, \
    similar to a parabola but squashed horizontally to the right,
    and strikes the ground at range R along the x-axis.
  /]
  
  [accessible-svg-content/
    
    {:: \font-size:diagram :: font-size="0.8" ::}
    {: \maths-italic : class="maths-italic" :}
    
    <## Marker definitions ##>
    <defs>
      <## velocity arrowhead ##>
      <marker id="arrowhead" viewBox="0 -0.3 1 0.6"
        refX="1" refY="0"
        markerUnits="userSpaceOnUse"
        markerWidth="1" markerHeight="0.3"
        orient = "auto-start-reverse">
        <path d="M 0, -0.3 L 0, 0.3 L 1, 0 z"/>
      </marker>
    </defs>
    
    <## x-axis ##>
    <line x1="0" y1="0" x2="11" y2="0"/>
    <text \maths-italic x="11" y="0" \font-size:diagram
      dx="0.6em" dy="0.3em">x</text>
    
    <## y-axis ##>
    <line x1="0" y1="0" x2="0" y2="-8"/>
    <text \maths-italic x="0" y="-8" \font-size:diagram
      dy="-0.5em">y</text>
    
    <## trajectory
      See svg_points_trajectory_script.m
      https://github.com/yawnoc/projectile-motion-numerics/
        blob/master/svg_points_trajectory_script.m
    ##>
    <polyline points="\
      0,-0
      0.245,-0.486
      0.48,-0.944
      0.706,-1.38
      0.924,-1.78
      1.13,-2.17
      1.34,-2.54
      1.53,-2.88
      1.72,-3.21
      1.91,-3.52
      2.09,-3.81
      2.26,-4.09
      2.44,-4.35
      2.6,-4.59
      2.77,-4.83
      2.93,-5.05
      3.08,-5.26
      3.23,-5.45
      3.39,-5.63
      3.53,-5.81
      3.68,-5.97
      3.82,-6.12
      3.96,-6.26
      4.1,-6.38
      4.24,-6.5
      4.37,-6.61
      4.5,-6.71
      4.63,-6.8
      4.76,-6.88
      4.89,-6.95
      5.02,-7.02
      5.14,-7.07
      5.26,-7.11
      5.39,-7.15
      5.51,-7.18
      5.63,-7.2
      5.75,-7.21
      5.86,-7.21
      5.98,-7.2
      6.1,-7.19
      6.21,-7.17
      6.32,-7.14
      6.44,-7.1
      6.55,-7.05
      6.66,-7
      6.77,-6.94
      6.88,-6.87
      6.98,-6.79
      7.09,-6.71
      7.19,-6.62
      7.3,-6.52
      7.4,-6.41
      7.5,-6.3
      7.6,-6.18
      7.7,-6.05
      7.8,-5.92
      7.89,-5.78
      7.99,-5.64
      8.08,-5.48
      8.17,-5.33
      8.27,-5.16
      8.36,-4.99
      8.44,-4.82
      8.53,-4.64
      8.62,-4.45
      8.7,-4.26
      8.78,-4.06
      8.86,-3.86
      8.94,-3.66
      9.02,-3.45
      9.1,-3.23
      9.18,-3.01
      9.25,-2.79
      9.32,-2.56
      9.39,-2.33
      9.46,-2.1
      9.53,-1.86
      9.6,-1.62
      9.67,-1.37
      9.73,-1.12
      9.8,-0.87
      9.86,-0.615
      9.92,-0.357
      9.98,-0.0964
      10,-3.29e-16
    "/>
    
    <## launch angle phi ##>
    <text \maths-italic x="1.2" y="-0.1" \font-size:diagram
      dx="-0.5em" dy="-0.35em">ϕ</text>
    
    <## range R ##>
    <text \maths-italic x="10" y="0" \font-size:diagram
      dy="1em">R</text>
    
    <## velocity vector u ##>
    <line x1="0" y1="0" x2="1" y2="-2" marker-end="url(#arrowhead)"/>
    <text \maths-italic x="1" y="-2" \font-size:diagram
      dx="-0.6em">u</text>
  
  /]
  
</svg>
||||

###{#motion}
  Equations of motion
###

----
Suppose a projectile of mass $m$ is launched at
speed $u$ and angle $\phi$ from the ground,
which has gravitational field strength $g$,
and let there be drag proportional to the square of the projectile's speed,
with constant of proportionality $b$.
Let dots denote time derivatives.
The drag force on the projectile has magnitude
$b \norm{\dot{\vec{x}}}^2$, and it acts
in the direction opposite to the projectile's velocity,
i.e.~in the direction $-\dot{\vec{x}} / \norm{\dot{\vec{x}}}$.
Therefore the drag force is $-b \dot{\vec{x}} \norm{\dot{\vec{x}}}$,
and so in components the equations of motion are
----

$$
  \begin{alignedat}{4}
    m \ddot{x} &=      && - b \dot{x} \sqrt{\dot{x}^2 + \dot{y}^2},
      \quad & \dot{x} (0) &= u \cos\phi, \quad & x (0) &= 0, \\
    m \ddot{y} &= -m g && - b \dot{y} \sqrt{\dot{x}^2 + \dot{y}^2},
      \quad & \dot{y} (0) &= u \sin\phi, \quad & y (0) &= 0.
  \end{alignedat}
$$

###{#scaling}
  Scaling
###

----
Since we shall be making a perturbation from the dragless $b = 0$ case,
it is appropriate to choose the length scale and time scale thereof.
In the dragless case the mass $m$ is irrelevant,
and the only parameters are the initial speed $u$
and gravitational acceleration $g$, yielding the length scale
----
$$
  L = u^2 / g
$$
----
and the time scale
----
$$
  T = u / g.
$$

----
Therefore we put $\hat{x} = x / L$,
$\hat{y} = y / L$ and $\hat{t} = t / T$ to obtain
scaled (dimensionless) variables $\hat{x}$,
$\hat{y}$ and $\hat{t}$.
Dropping the hats, the equations of motion become
----
$$
  \begin{alignedat}{4}
    \ddot{x} &=    && - B \dot{x} \sqrt{\dot{x}^2 + \dot{y}^2},
      \quad & \dot{x} (0) &= \cos\phi, \quad & x (0) &= 0, \\
    \ddot{y} &= -1 && - B \dot{y} \sqrt{\dot{x}^2 + \dot{y}^2},
      \quad & \dot{y} (0) &= \sin\phi, \quad & y (0) &= 0,
  \end{alignedat}
$$
----
where
----
$$
  B \defeq \frac{b u^2}{m g}
$$
----
is the initial drag-to-weight ratio,
the only dimensionless group in the problem.
By definition, the projectile's terminal speed $c$ is given by
----
$$
  1 = \frac{b c^2}{m g}.
$$
----
Dividing these, we see that
----
$$
  B = \roundbr{\frac{u}{c}}^2.
$$

----
Now the optimal angle is dimensionless, so it can depend only on
the sole dimensionless group $B$.
Thus, **the optimal angle depends only on $\sqrt{B} = u / c$,
the ratio between the initial and terminal speeds**.
(I wish I knew this back in Year~12.)
----

###{#perturbation}
  Perturbed trajectory
###

----
By "weak drag" I mean that $B \ll 1$, i.e.~$u^2 \ll c^2$.
We make an asymptotic expansion in powers of $B$ about $B = 0$:
----
$$
  \gdef\grey#1{\textcolor{grey}{#1}}
  \gdef\plusorder#1{\mathbin{\grey{+}} \grey{\order\roundbr{#1}}}
  \gdef\coeffbr#1{\Bigl(#1\Bigr)}
  \begin{aligned}
    \dot{x} &= \dot{x}_0 + \dot{x}_1 B + \dot{x}_2 B^2 \plusorder{B^3}, \\
    \dot{y} &= \dot{y}_0 + \dot{y}_1 B + \dot{y}_2 B^2 \plusorder{B^3}.
  \end{aligned}
$$

----
Substituting these into the equations of motion and equating coefficients,
we obtain successive 2nd-order ordinary differential equations
for $x_0$, $y_0$, $x_1$, $y_1$, etc.
Thus $\dot{x}_0$, $x_0$, $\dot{y}_0$, $y_0$, $\dot{x}_1$, ..., $y_2$
can be determined by straight integration,
the details of which I leave to the [manuscript] (page~3 onwards).
----

----
You might be wondering why we have stopped at order $B^2$.
Initially I thought that integration could be performed to arbitrary order
(although the amount of algebra required grows *very* quickly).
However I was wrong; it turns out that the following integrals
appear at cubic order, which have no closed-form expression:
----
$$
  \begin{aligned}
    &
    \int
      \frac{
        \tau \log \roundbr{\tau + \sqrt{\alpha^2 + \tau^2}}
      }{
        \alpha^2 + \tau^2
      }
    \td\tau,
      \\[\tallspace]
    &
    \int
      \frac{
        \log^2 \roundbr{\tau + \sqrt{\alpha^2 + \tau^2}}
      }{
        (\alpha^2 + \tau^2)^{3/2}
      }
    \td\tau.
  \end{aligned}
$$
----
If you are able to evaluate either of the two integrals above,
please contact me at `yawnoc@pm.me`.
On the other hand, quartic terms, even if they could be found,
would be of little practical use, since the expansion is asymptotic
and as such probably does not converge.
----


###{#time}
  Flight time
###

----
Having determined the trajectory,
we then determine the flight time, given by $y (t) = 0$.
To quadratic order, i.e.~with
----
$$
  \begin{aligned}
    y &= y_0 + y_1 B + y_2 B^2 \plusorder{B^3}, \\
    t &= t_0 + t_1 B + t_2 B^2 \plusorder{B^3},
  \end{aligned}
$$
----
this becomes
----
$$
  y_0 (t_0)
    + \coeffbr{t_1 \dot{y}_0 (t_0) + y_1 (t_0)} B
    + \coeffbr{
        t_2 \dot{y}_0 (t_0)
        + \tfrac{1}{2} {t_1}^2 \ddot{y}_0 (t_0)
        + t_1 \dot{y}_1 (t_0)
        + y_2 (t_0)
      }
      B^2
    \plusorder{B^3}
  = 0.
$$

----
The unperturbed (dragless) flight time is given by the positive solution to
$y_0 (t_0) = t_0 (\sin\phi - t_0 / 2) = 0$, which is
----
$$
  t_0 = 2 \sin\phi.
$$

----
From the linear and quadratic terms
we then obtain $t_1$ and $t_2$
(see page~20 onwards of [manuscript]).
----

###{#range}
  Range
###

----
Substituting the flight time into the horizontal component of the trajectory
gives the range
----
$$
  \begin{aligned}
    R
    &= x (t) \\
    &=
      x_0 (t_0)
        + \coeffbr{t_1 \dot{x}_0 (t_0) + x_1 (t_0)} B
        + \coeffbr{
            t_2 \dot{x}_0 (t_0)
            + t_1 \dot{x}_1 (t_0)
            + x_2 (t_0)
          }
          B^2
        \plusorder{B^3}
      \\
    &\defeq R_0 + R_1 B + R_2 B^2 \plusorder{B^3},
  \end{aligned}
$$
----
where $R_0$, $R_1$, and $R_2$ are (horribly complicated) functions of $\phi$
(see page~24 onwards of [manuscript]).
----

###{#angle}
  Optimal launch angle
###

----
Let primes denote $\phi$ derivatives.
Then the optimal launch angle is given by $R' (\phi) = 0$,
or, to quadratic order,
----
$$
  R'_0 (\phi_0)
    + \coeffbr{\phi_1 R''_0 (\phi_0) + R'_1 (\phi_0)} B
    + \coeffbr{
        \phi_2 R''_0 (\phi_0)
        + \tfrac{1}{2} {\phi_1}^2 R'''_0 (\phi_0)
        + \phi_1 R''_1 (\phi_0)
        + R'_2 (\phi_0)
      }
      B^2
    \plusorder{B^3}
  = 0.
$$
----
From the constant term we have $R'_0 (\phi_0) = 2 \cos (2 \phi_0) = 0$,
yielding the familiar
----
$$
  \phi_0 = \frac{\pi}{4}
$$
----
in the absence of air resistance.
From the linear and quadratic terms we obtain
after much differentiation and algebra (pages~27--35 of [manuscript])
the constants $\phi_1$ and $\phi_2$,
and hence the result:
----


##{#result}
  Result
##


----
  For small initial drag-to-weight ratios
  (or small initial-to-terminal kinetic energy ratios)
----
$$
  B \defeq \frac{b u^2}{m g} = \frac{u^2}{c^2} \ll 1,
$$
----
  the __optimal launch angle__ has the __asymptotic expansion__
----
$${.important}
  \begin{aligned}
    \phi =
      \frac{\pi}{4}
      & + \coeffbr{
            - \tfrac{3}{32} \sqrt{2}
            + \tfrac{1}{64} \log \tfrac{1 + 1 / \sqrt{2}}{1 - 1 / \sqrt{2}}
          }
          B
            \\
      & + \coeffbr{
            - \tfrac{1393}{3840}
            + \tfrac{81}{512} \sqrt{2}
              \log \tfrac{1 + 1 / \sqrt{2}}{1 - 1 / \sqrt{2}}
            + \tfrac{17}{2048}
              \log^2 \tfrac{1 + 1 / \sqrt{2}}{1 - 1 / \sqrt{2}}
          }
          B^2
            \\
      & \plusorder{B^3},
  \end{aligned}
$$
----
or
----
$${.important}
  \begin{aligned}
    \phi
    &= 45 \degree - 6.018 \degree B + 3.290 \degree B^2 \plusorder{B^3} \\
    &= 45 \degree
    - 6.018 \degree \frac{u^2}{c^2}
    + 3.290 \degree \frac{u^4}{c^4} \plusorder{\frac{u^6}{c^6}}.
  \end{aligned}
$$


##{#numerics}
  Numerical verification
##


----
__Code:__  [\[GNU Octave\] Projectile motion numerics (GitHub)][numerics-repo]
----

@@[numerics-repo]
  https://github.com/yawnoc/projectile-motion-numerics/
@@


----
In the following table we compare numerically computed optimal launch angles
(see [GitHub repository][numerics-repo])
with those from the asymptotic [result above](#result):
----
<##
  See table_b_phi_script.m
  https://github.com/yawnoc/projectile-motion-numerics/
    blob/master/table_b_phi_script.m
##>
||||||{.centred-block}
||||{.overflowing}
''''
|^
  ==
    ;{r2} $B$
    ;{c3} Optimal $\phi$
  ==
    ; Numerical
    ; Asymptotic
    ; Rel.~error
|:
  ==
    , \0\0\0\00
    , 45.0°
    , 45.0°
    , \00
  ==
    , \0\0\0\00.1
    , 44.4°
    , 44.4°
    , \00.005%
  ==
    , \0\0\0\00.2
    , 43.9°
    , 43.9°
    , \00.04%
  ==
    , \0\0\0\00.3
    , 43.4°
    , 43.5°
    , \00.1%
  ==
    , \0\0\0\00.4
    , 43.0°
    , 43.1°
    , \00.3%
  ==
    , \0\0\0\00.5
    , 42.6°
    , 42.8°
    , \00.5%
  ==
    , \0\0\0\00.6
    , 42.2°
    , 42.6°
    , \00.8%
  ==
    , \0\0\0\00.7
    , 41.9°
    , 42.4°
    , \01.2%
  ==
    , \0\0\0\00.8
    , 41.6°
    , 42.3°
    , \01.7%
  ==
    , \0\0\0\00.9
    , 41.3°
    , 42.2°
    , \02.4%
  ==
    , \0\0\0\01
    , 41.0°
    , 42.3°
    , \03.2%
  ==
    , \0\0\0\02
    , 38.8°
    , 46.1°
    , 19%
  ==
    , \0\0\0\03
    , 37.3°
    ,{.not-applicable r16 c2}
  ==
    , \0\0\0\04
    , 36.2°
  ==
    , \0\0\0\05
    , 35.3°
  ==
    , \0\0\0\06
    , 34.6°
  ==
    , \0\0\0\07
    , 34.0°
  ==
    , \0\0\0\08
    , 33.5°
  ==
    , \0\0\0\09
    , 33.0°
  ==
    , \0\0\010
    , 32.6°
  ==
    , \0\0\015
    , 31.1°
  ==
    , \0\0\020
    , 30.1°
  ==
    , \0\0\050
    , 27.1°
  ==
    , \0\0100
    , 25.2°
  ==
    , \0\0200
    , 23.5°
  ==
    , \0\0500
    , 22.9°
  ==
    , \01000
    , 19.7°
  ==
    , 10000
    , 18.1°
''''
||||
||||||

----
Indeed the asymptotic expansion is very accurate for $B < 0.5$
(or equivalently $u / c < 0.7$).
----

<##
                Optimal launch angle plot (in terms of B)
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    xleft       left x pos                            - 2.5
    xright      right x pos                            23
    w           total width                            25.5
    ytop        top y pos                             -48
    ybottom     bottom y pos                          -32
    h           total height                           16
  ***********************************************************************
  Horizontal scale is 4:1.
##>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-2.5 -48 25.5 16"
  \accessible-svg-attributes[optimal-angle-phi-vs-b-plot-title]
>
  [accessible-svg-title/optimal-angle-phi-vs-b-plot-title
    Plot showing numerical and asymptotic optimal launch angle phi \
    versus the dimensionless group B. \
    There is good agreement from B = 0 (where phi = 45 degrees) \
    up to about B = 0.5, \
    after which the asymptotic curve bends away from the numerical curve.
  /]
  
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
    
    {:: \font-size:plot :: font-size="1" ::}
    
    <## B-axis ##>
    <line x1="0" y1="-35" x2="21" y2="-35"/>
    <text \maths-italic x="21" y="-35" \font-size:plot
      dx="0.6em" dy="0.3em">B</text>
    
    <## Horizontal axis coarse ticks ##>
    <polyline class="points" points="0,-35 4,-35 8,-35 12,-35 16,-35 20,-35"
      \ticks:coarse-horizontal/>
    <text \maths-italic x="0" y="-35" \tick-labels:horizontal>0</text>
    <text \maths-italic x="4" y="-35" \tick-labels:horizontal>1</text>
    <text \maths-italic x="8" y="-35" \tick-labels:horizontal>2</text>
    <text \maths-italic x="12" y="-35" \tick-labels:horizontal>3</text>
    <text \maths-italic x="16" y="-35" \tick-labels:horizontal>4</text>
    <text \maths-italic x="20" y="-35" \tick-labels:horizontal>5</text>
    
    {:: \tick-labels:horizontal :: font-size="1" dy="1.35em" ::}
    
    <## Horizontal axis fine ticks ##>
    <polyline class="points"
      points="0.8,-35 1.6,-35 2.4,-35 3.2,-35 4.8,-35 5.6,-35 6.4,-35 7.2,-35
        8.8,-35 9.6,-35 10.4,-35 11.2,-35 12.8,-35 13.6,-35 14.4,-35 15.2,-35
        16.8,-35 17.6,-35 18.4,-35 19.2,-35 20.8,-35"
      \ticks:fine-horizontal/>
    
    <## phi-axis ##>
    <line x1="0" y1="-35" x2="0" y2="-46.8"/>
    <text \maths-italic x="0" y="-46.8" \font-size:plot
      dy="-0.5em">ϕ</text>
    
    <## Vertical axis coarse ticks ##>
    <polyline class="points"
      points="0,-35 0,-40 0,-45"
      \ticks:coarse-vertical/>
    <text \maths-italic x="0" y="-35" \tick-labels:vertical>35°</text>
    <text \maths-italic x="0" y="-40" \tick-labels:vertical>40°</text>
    <text \maths-italic x="0" y="-45" \tick-labels:vertical>45°</text>
    
    {:: \tick-labels:vertical :: font-size="1" dx="-1.4em" dy="0.3em" ::}
    
    <## Vertical axis fine ticks ##>
    <polyline class="points"
      points="0,-36 0,-37 0,-38 0,-39 0,-41 0,-42 0,-43 0,-44 0,-46"
      \ticks:fine-vertical/>
    
    <## numerical
      See svg_points_b_phi_script.m
      https://github.com/yawnoc/projectile-motion-numerics/
        blob/master/svg_points_b_phi_script.m
    ##>
    <polyline points="0,-45
    0.4,-44.43
    0.8,-43.91
    1.2,-43.44
    1.6,-43.01
    2,-42.61
    2.4,-42.24
    2.8,-41.89
    3.2,-41.57
    3.6,-41.26
    4,-40.98
    4.4,-40.71
    4.8,-40.45
    5.2,-40.21
    5.6,-39.97
    6,-39.75
    6.4,-39.54
    6.8,-39.34
    7.2,-39.14
    7.6,-38.96
    8,-38.78
    8.4,-38.61
    8.8,-38.44
    9.2,-38.28
    9.6,-38.13
    10,-37.98
    10.4,-37.83
    10.8,-37.69
    11.2,-37.56
    11.6,-37.42
    12,-37.3
    12.4,-37.17
    12.8,-37.05
    13.2,-36.94
    13.6,-36.82
    14,-36.71
    14.4,-36.6
    14.8,-36.5
    15.2,-36.39
    15.6,-36.29
    16,-36.2
    16.4,-36.1
    16.8,-36
    17.2,-35.91
    17.6,-35.82
    18,-35.74
    18.4,-35.65
    18.8,-35.57
    19.2,-35.49
    19.6,-35.4
    20,-35.32
    "/>
    <text x="10" y="-37.98" \font-size:plot
      dx="2.5em" dy="-0.5em">Numerical</text>
    <## asymptotic
      See svg_points_b_phi_asymptotic_script.m
      https://github.com/yawnoc/projectile-motion-numerics/
        blob/master/svg_points_b_phi_asymptotic_script.m
    ##>
    <polyline points="0,-45
    0.2,-44.71
    0.4,-44.43
    0.6,-44.17
    0.8,-43.93
    1,-43.7
    1.2,-43.49
    1.4,-43.3
    1.6,-43.12
    1.8,-42.96
    2,-42.81
    2.2,-42.69
    2.4,-42.57
    2.6,-42.48
    2.8,-42.4
    3,-42.34
    3.2,-42.29
    3.4,-42.26
    3.6,-42.25
    3.8,-42.25
    4,-42.27
    4.2,-42.31
    4.4,-42.36
    4.6,-42.43
    4.8,-42.52
    5,-42.62
    5.2,-42.74
    5.4,-42.87
    5.6,-43.02
    5.8,-43.19
    6,-43.37
    6.2,-43.58
    6.4,-43.79
    6.6,-44.03
    6.8,-44.28
    7,-44.54
    7.2,-44.83
    7.4,-45.13
    7.6,-45.44
    7.8,-45.77
    8,-46.12
    8.2,-46.49
    "/>
    
    <text x="8.2" y="-46.49" \font-size:plot
      dx="-3.5em" dy="1em">Asymptotic</text>
  
  /]
  
</svg>
||||

----
The true optimal launch angle is a decreasing function of $B$.
Thus, very crudely, the asymptotic expansion becomes useless
when it stops decreasing, which occurs at
----
$$
  B \approx \frac{-\phi_1}{2 \phi_2} = 0.9.
$$

----
Finally, here is a plot of the optimal launch angle in terms of
$\sqrt{B} = u / c$, the initial-to-terminal speed ratio:
----
<##
             Optimal launch angle plot (in terms of u / c)
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    xleft       left x pos                            - 2.5
    xright      right x pos                            23
    w           total width                            25.5
    ytop        top y pos                             -48
    ybottom     bottom y pos                          -27
    h           total height                           21
  ***********************************************************************
  Horizontal scale is 5:1.
##>

||||{.centred-block}
<svg width="480px" height="100%" viewBox="-2.5 -48 25.5 21"
  \accessible-svg-attributes[optimal-angle-phi-vs-u-on-c-plot-title]
>
  [accessible-svg-title/optimal-angle-phi-vs-u-on-c-plot-title
    Plot showing numerical and asymptotic optimal launch angle phi \
    versus the initial-to-terminal speed ratio u divided by c. \
    There is good agreement from B = 0 (where phi = 45 degrees) \
    up to about B = 0.6, \
    after which the asymptotic curve bends away from the numerical curve.
  /]
  
  [accessible-svg-content/
    
    <## u/c-axis ##>
    <line x1="0" y1="-30" x2="20.5" y2="-30"/>
    <text \maths-italic x="20.5" y="-30" \font-size:plot
      dx="1.2em" dy="0.3em">u\,/\,c</text>
    
    <## Horizontal axis coarse ticks ##>
    <polyline class="points"
      points="0,-30 5,-30 10,-30 15,-30 20,-30"
      \ticks:coarse-horizontal/>
    <text \maths-italic x="0" y="-30" \tick-labels:horizontal>0</text>
    <text \maths-italic x="5" y="-30" \tick-labels:horizontal>1</text>
    <text \maths-italic x="10" y="-30" \tick-labels:horizontal>2</text>
    <text \maths-italic x="15" y="-30" \tick-labels:horizontal>3</text>
    <text \maths-italic x="20" y="-30" \tick-labels:horizontal>4</text>
    
    <## Horizontal axis fine ticks ##>
    <polyline class="points"
      points="1,-30 2,-30 3,-30 4,-30 6,-30 7,-30 8,-30 9,-30
        11,-30 12,-30 13,-30 14,-30 16,-30 17,-30 18,-30 19,-30"
      \ticks:fine-horizontal/>
    
    <## phi-axis ##>
    <line x1="0" y1="-30" x2="0" y2="-46.8"/>
    <text \maths-italic x="0" y="-46.8" \font-size:plot dy="-0.5em">ϕ</text>
    <## Vertical axis coarse ticks ##>
    <polyline class="points"
      points="0,-30 0,-35 0,-40 0,-45"
      \ticks:coarse-vertical/>
    <text \maths-italic x="0" y="-30" \tick-labels:vertical>30°</text>
    <text \maths-italic x="0" y="-35" \tick-labels:vertical>35°</text>
    <text \maths-italic x="0" y="-40" \tick-labels:vertical>40°</text>
    <text \maths-italic x="0" y="-45" \tick-labels:vertical>45°</text>
    
    <## Vertical axis fine ticks ##>
    <polyline class="points"
      points="0,-31 0,-32 0,-33 0,-34 0,-36 0,-37 0,-38 0,-39
        0,-41 0,-42 0,-43 0,-44 0,-46"
      \ticks:fine-vertical/>
    
    <## numerical
      See svg_points_u_phi_script.m
      https://github.com/yawnoc/projectile-motion-numerics/
        blob/master/svg_points_u_phi_script.m
    ##>
    <polyline points="0,-45
    0.5,-44.94
    1,-44.76
    1.5,-44.48
    2,-44.11
    2.5,-43.67
    3,-43.18
    3.5,-42.65
    4,-42.1
    4.5,-41.54
    5,-40.98
    5.5,-40.42
    6,-39.89
    6.5,-39.36
    7,-38.85
    7.5,-38.36
    8,-37.89
    8.5,-37.44
    9,-37.01
    9.5,-36.59
    10,-36.2
    10.5,-35.82
    11,-35.45
    11.5,-35.1
    12,-34.77
    12.5,-34.45
    13,-34.15
    13.5,-33.85
    14,-33.57
    14.5,-33.29
    15,-33.03
    15.5,-32.78
    16,-32.54
    16.5,-32.3
    17,-32.07
    17.5,-31.86
    18,-31.65
    18.5,-31.44
    19,-31.25
    19.5,-31.06
    20,-30.87
    "/>
    
    <text x="10" y="-36.2" \font-size:plot
      dx="2.5em" dy="-0.5em">Numerical</text>
    
    <## asymptotic
      See svg_points_u_phi_asymptotic.m
      https://github.com/yawnoc/projectile-motion-numerics/
        blob/master/svg_points_u_phi_asymptotic.m
    ##>
    <polyline points="0,-45
    0.25,-44.98
    0.5,-44.94
    0.75,-44.87
    1,-44.76
    1.25,-44.64
    1.5,-44.48
    1.75,-44.31
    2,-44.12
    2.25,-43.92
    2.5,-43.7
    2.75,-43.48
    3,-43.26
    3.25,-43.04
    3.5,-42.84
    3.75,-42.66
    4,-42.5
    4.25,-42.37
    4.5,-42.28
    4.75,-42.25
    5,-42.27
    5.25,-42.36
    5.5,-42.53
    5.75,-42.79
    6,-43.16
    6.25,-43.63
    6.5,-44.22
    6.75,-44.96
    7,-45.84
    7.25,-46.89
    "/>
    <text x="7.25" y="-46.89" \font-size:plot
      dx="-3.2em" dy="1em">Asymptotic</text>
  
  /]
  
</svg>
||||

\cite-this-page[][projectile-weak-drag][%title]

%footer-element
