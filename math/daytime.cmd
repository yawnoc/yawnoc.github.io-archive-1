{+ resources/syntax/general.cmd +}

{+ resources/syntax/accessible-svgs.cmd +}
{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/svg-styles.cmd +}

%%
  %title Daytime: dependence on latitude and season
  %date-created 2019-07-12
  %date-modified 2020-04-28
  \resources:maths
  %description
    A simple mathematical model for the sun's path through the sky \
    and the amount of daytime at different times of the year.
  %css a~~
    .timeanddate {
      color: #057;
    }
    .model {
      color: #50a;
    }
    .with-correction {
      background: lightyellow;
    }
  ~~
%%

<##
  Spans of various classes:
    [tad/   /]  timeanddate
    [mod/   /]  model
    [modc/  /]  model with-correction
##>
{%
  \[
  (?P<abbreviated_class> tad | mod[c]? )/
    [ ]*
    (?P<content> [\s\S]*?)
    [ ]*
  /
  \]
%
  <span class="\g<abbreviated_class>">\g<content></span>
%}
{: "tad"  : "timeanddate" :}
{: "mod"  : "model" :}
{: "modc" : "model with-correction" :}


[[====
* \header-link:home
* \header-link:top
* [Verification](#verification  Verification)
* \header-link:result
* \header-link:cite
====]]


# %title #


\noscript:maths

[||||
||||]

[====
* [Assumptions](#assumptions)
* [Coordinates](#coordinates)
* [Sun's position](#sun)
* [Observer's position](#observer)
* [Direction to sun](#direction)
* [Daytime](#daytime)
* [Angles](#angles)
* [Refraction correction](#correction)
* [Verification](#verification)
* [Code](#code)
* [Result](#result)
====]

----
This is a simplistic model for the sun's path through the sky, and the
dependence of the amount of daytime upon latitude and time of year.
Skipped steps/algebra may be found in the manuscript.
----

----
__Manuscript:__ [`daytime.pdf`~(624~KB)](
  https://github.com/yawnoc/yawnoc.github.io-archive-1/blob/master/\
    manuscripts/daytime.pdf
)
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


##{#assumptions}
  Assumptions
##


----
Approximations must be made, that this problem be doable.
In roughly decreasing order of accuracy (according to my gut):
----

++++
1.
  The size of the observer is negligible compared to the size of the earth.

2.
  The difference between a [tropical year (or solar year)] [tropical year]
  and a [sidereal year] is negligible,
  i.e.~Earth's [axial precession] is negligible.
  @@[tropical year]
    https://en.wikipedia.org/wiki/Tropical_year
  @@
  @@[sidereal year]
    https://en.wikipedia.org/wiki/Sidereal_year
  @@
  @@[axial precession]
    https://en.wikipedia.org/wiki/Axial_precession
  @@

3.
  The radius of the earth is negligible compared to the earth--sun distance.

4.
  The earth is spherical.

5.
  The earth's orbit around the sun is circular (and hence uniform in speed).

6.
  The linear angle subtended by the sun in the sky is negligible,
  i.e.~the sun is taken to be a point.

7.
  Light propagates in straight lines, i.e.~no atmospheric refraction.
  
++++

----
The last assumption of no refraction is the weakest,
usually affecting sunrise and sunset times by several minutes.
Later on I give a first-order correction to account for this.
----


##{#coordinates}
  Coordinate systems
##


----
<small>
I have settled for hand-drawn perspective 3D diagrams because
the corresponding SVGs would simply be too time consuming to make.
</small>
----

||||{.centred-block}
![
  Diagram of equatorial coordinates and the solar year.
  The earth lies at the centre of the equatorial coordinate system, \
  and spins once about its own axis in a day.
  The equator is in the xy-plane; the north pole is the positive z-axis.
  The sun goes once around the ecliptic \
  (relative to the fixed stars) in a solar year.
  The path of the sun, the ecliptic, \
  lies not in the equatorial xy-plane but in the ecliptic plane, \
  which is tilted by tilt tau about the positive x-axis \
  in a right-handed sense.
  When the sun crosses the positive x-axis, it is northern spring equinox; \
  above the positive y-axis, northern summer solstice; \
  the negative x-axis, northern autumnal equinox; \
  below the negative y-axis, northern winter solstice.
][
  equatorial coordinates and solar year
]
||||

@@[equatorial coordinates and solar year]{w480}
  equatorial-coordinates-solar-year.png
@@

----
The [__equatorial coordinate system__][equatorial coords] has
  origin at the centre of the earth,
  $x$-axis pointing towards the northern spring (or March) equinox~(春分),
  and $xy$-plane the plane of the earth's equator~(赤道).
Thus the $z$-axis is the north pole.
The earth spins once (relative to the fixed stars) about this axis
every [sidereal day].
The sun revolves once (relative to the fixed stars)
every [solar year][tropical year],
but its path, the ecliptic~(黃道),
lies not in the plane of the equator but in the ecliptic plane,
which is tilted with respect to the equatorial
$xy$-plane by earth's [axial tilt] $\tau = 23\degree \, 26'$.
----

@@[equatorial coords]
  https://en.wikipedia.org/wiki/Equatorial_coordinate_system
@@
@@[sidereal day]
  https://en.wikipedia.org/wiki/Sidereal_time
@@
@@[axial tilt]
  https://en.wikipedia.org/wiki/Axial_tilt
@@

||||{.centred-block}
![
  Diagram of equatorial spherical coordinates.
  r is the distance from the origin, the centre of the earth.
  theta is the angle from the north pole, the z-axis.
  phi is the angle east from the x-axis.
  Declination delta is the complement of theta, \
  i.e.~delta and theta sum to a right angle.
][
  equatorial coordinates spherical
]
||||

@@[equatorial coordinates spherical]{w240}
  equatorial-coordinates-spherical.png
@@

----
We also have the associated right-handed spherical coordinates
$(r, \theta, \phi)$, given by
----
$$
  \begin{aligned}
    x &= r \sin\theta \cos\phi \\
    y &= r \sin\theta \sin\phi \\
    z &= r \cos\theta.
  \end{aligned}
$$

----
Thus $r$ is the distance from the centre of the earth,
$\theta$ the angle from the north pole and
$\phi$ the angle east from the spring equinox.
Note that $\theta = \pi/2 - \delta$,
where $\delta$ is the astronomer's [declination],
and that $\phi$ is equivalent to the astronomer's [right ascension].
----

@@[declination]
  https://en.wikipedia.org/wiki/Declination
@@
@@[right ascension]
  https://en.wikipedia.org/wiki/Right_ascension
@@

||||{.centred-block}
![
  Diagram of ecliptic coordinates.
  The ecliptic coordinate axes (with tildes) are tilted \
  with respect to the equatorial coordinate axes \
  by tilt tau about the positive x-axis, \
  in a right-handed sense.
][
  ecliptic coordinates
]
||||

@@[ecliptic coordinates]{w260}
  equatorial-ecliptic-coordinates.png
@@

----
Finally we have
the [__ecliptic coordinate system__][ecliptic coords]
$(\tilde{x}, \tilde{y}, \tilde{z})$,
whose $\tilde{x}$-axis coincides with the equatorial $x$-axis,
but whose $\tilde{y}$- and $\tilde{z}$-axes are tilted by tilt $\tau$
in the right-handed sense about the positive $x$-axis:
----
$$
  \begin{aligned}
    x &= \tilde{x} \\
    y &= \tilde{y} \cos\tau - \tilde{z} \sin\tau \\
    z &= \tilde{y} \sin\tau + \tilde{z} \cos\tau.
  \end{aligned}
$$

@@[ecliptic coords]
  https://en.wikipedia.org/wiki/Ecliptic_coordinate_system
@@


##{#sun}
  Sun's position
##


----
Let $t$ be the __time__ since the northern spring (or March) equinox.
The sun goes once around the ecliptic every __solar year~(yr)__,
equal to 365.242~days.
Defining what I call the __year angle__
----
$$
  Y \defeq \frac{2 \pi t}{\unit{yr}},
$$
----
which moves through a full turn each solar year,
the sun's position is therefore given in ecliptic coordinates by
----
$$
  (\tilde{x}, \tilde{y}, \tilde{z})_\mathrm{sun} =
  (R_\mathrm{es} \cos Y, R_\mathrm{es} \sin Y, 0),
$$
----
where $R_\mathrm{es}$ is the earth--sun distance.
----
----
In the northern hemisphere,
$Y = 0\degree, 90\degree, 180\degree, 270\degree$ correspond to
spring equinox~(春分), summer solstice~(夏至),
autumnal equinox~(秋分), and winter solstice~(冬至) respectively.
----


##{#observer}
  Observer's position
##


----
We consider an observer at latitude $\delta$ measured north from the equator.
In equatorial spherical coordinates, the observer has radius
$r_\mathrm{obs} = R_\mathrm{e}$ (the radius of the earth)
and zenith angle $\theta_\mathrm{obs} = \pi/2 - \delta$.
----

----
Now a mean __solar day~(day)__, 24~hours,
is the time it takes for the earth to spin once relative to the sun,
whereas a __sidereal day~(sd)__
is the time it takes for the earth to spin once relative to the fixed stars.
Since the sun revolves once around the ecliptic every solar year,
the number of sidereal days per year is
one more than the number of solar days:
----
$$
  \begin{gathered}
    \frac{\unit{yr}}{\unit{sd}} = 1 + \frac{\unit{yr}}{\unit{day}}
      \\[\tallspace]
    \unit{sd}
    = \frac{\unit{yr}}{1 + \unit{yr} / {\unit{day}}}
    = \frac{365.242 \times 24 \unit{hr}}{1 + 365.242}
    = 23 \unit{hr} \, 56' \, 4''.
  \end{gathered}
$$

----
Therefore you would be correct in saying that
the observer's azimuthal angle is $\phi_\mathrm{obs} = 2 \pi t / {\unit{sd}}$,
which moves through a full turn every sidereal day.
However, I won't be doing this.
Instead, I shall use the fact that a day (whether solar or sidereal)
is much shorter than a year, so that over the course of a day,
the year angle $Y$ is almost constant
(it only changes by order $\unit{day} / {\unit{yr}} = 1 / 365.242 = 0.3\%$).
----

||||{.important}
Thus, to make the maths simpler, I shall assert that
$Y$ actually is constant over a day,
and compensate for the associated error by instead putting
$\phi_\mathrm{obs} = 2 \pi t / {\unit{day}}$.
You may doubt me if you like, but my intuition says that this will work.
||||

----
Defining what I call the __day angle__
----
$$
  D = \frac{2 \pi t}{\unit{day}}
$$
----
which moves through a full turn every solar day,
the observer's position is given in equatorial spherical coordinates by
----
$$
  (r, \theta, \phi)_\mathrm{obs} =
  (R_\mathrm{e}, \pi/2 - \delta, D).
$$


##{#direction}
  Direction from the observer to the sun
##


----
Moving the sun's position
from ecliptic $(\tilde{x}, \tilde{y}, \tilde{z})$ coordinates
to equatorial $(x, y, z)$ coordinates, we obtain
----
$$
  \begin{pmatrix}
    x \\ y \\ z
  \end{pmatrix}_\mathrm{sun}
  =
  R_\mathrm{es}
  \begin{pmatrix}
    \cos Y \\ \cos\tau \sin Y \\ \sin\tau \sin Y
  \end{pmatrix}.
$$

----
Now the distance from the origin to the observer
is the earth's radius $R_\mathrm{e}$,
and by assumption this is infinitesimally small
compared to the earth--sun distance $R_\mathrm{es}$.
Thus the direction (or unit vector) from the observer towards the sun is
----
$$
  \vec{u} = u_x \basisvec{x} + u_y \basisvec{y} + u_z \basisvec{z},
$$
----
  where
----
$$
  \begin{aligned}
    u_x &= \cos Y \\
    u_y &= \cos\tau \sin Y \\
    u_z &= \sin\tau \sin Y,
  \end{aligned}
$$
----
and $\basisvec{x}, \basisvec{y}, \basisvec{z}$ are the Cartesian basis vectors.
But since we are interested in what the observer sees,
we must transform this into the local spherical basis, i.e.~put
----
$$
  \vec{u} =
    u_r \basisvec{r} + u_\theta \basisvec{\theta} + u_\phi \basisvec{\phi},
$$
----
where
  $\basisvec{r}$ points up~(上),
  $\basisvec{\theta}$ points south~(南) and
  $\basisvec{\phi}$ points east~(東).
----

||||{.centred-block}
![
  Diagram of the local basis of equatorial spherical coordinate.
  The r-vector points up,
  the theta-vector points south,
  and the phi-vector points east.
][
  equatorial coordinates spherical basis
]
||||

@@[equatorial coordinates spherical basis]{w320}
  equatorial-coordinates-spherical-basis.png
@@

----
Unlike the Cartesian basis,
the spherical basis is dependent upon (the observer's) position,
and the components transform as follows:
----
$$
  \begin{aligned}
    \begin{pmatrix}
      u_r \\ u_\theta \\ u_\phi
    \end{pmatrix}
    &=
    \begin{pmatrix}
      \sin\theta \cos\phi & \sin\theta \sin\phi &  \cos\theta \\
      \cos\theta \cos\phi & \cos\theta \sin\phi & -\sin\theta \\
                -\sin\phi &            \cos\phi &  0
    \end{pmatrix}_\text{obs}
    \begin{pmatrix}
      u_x \\ u_y \\ u_z
    \end{pmatrix} \\[\tallspace]
    &=
    \begin{pmatrix}
      \cos\delta \cos D & \cos\delta \sin D &  \sin\delta \\
      \sin\delta \cos D & \sin\delta \sin D & -\cos\delta \\
                -\sin D &            \cos D &  0
    \end{pmatrix}
    \begin{pmatrix}
      \cos Y \\ \cos\tau \sin Y \\ \sin\tau \sin Y
    \end{pmatrix}.
  \end{aligned}
$$

----
This looks rather horrible.
To simplify it, I define what I call the
__tilt-reduced unit radius__ and the __tilt-reduced year angle__,
----
$$
  \begin{aligned}
    \rho &= \sqrt{\cos^2 Y + \cos^2\tau \sin^2 Y} \\
    \varphi &= \tan^{-1} \frac{\cos\tau \sin Y}{\cos Y},
  \end{aligned}
$$
----
where $\tan^{-1} (y/x)$ is an abuse of notation
meaning $\mathrm{atan2} (y, x)$
(in other words $\varphi$ is always in the same quadrant as $Y$).
----

<##
                    Tilt-reduced quantities diagram
  ***********************************************************************
  Constant    Description                           Value
  ***********************************************************************
    run         run                                     8
    rise        rise                                    4
    xleft       left x pos                            - 0.5
    xright      right x pos                            11.5
    w           total width                            12
    ytop        top y pos                             - 4.1
    ybottom     bottom y pos                            1
    h           total height                            5.1
  ***********************************************************************
##>

||||{.centred-block}
<svg width="320px" height="100%" viewBox="-0.5 -4.1 12 5.1"
  \accessible-svg-attributes[tilt-reduced-quantities-diagram]\
>
  [accessible-svg-title/tilt-reduced-quantities-diagram
    Fundamental diagram of tilt-reduced quantities.
    A right-angled triangle with
      hypotenuse rho (which is the tilt-reduced unit radius),
      azimuthal angle curly-phi (which is the tilt-reduced year angle),
      base cos Y (adjacent to curly-phi),
      and height cos tau sin Y (opposite curly-phi).
  /]
  
  [accessible-svg-content/
    {: \maths-italic : class="maths-italic" :}
    {: \maths-regular : class="maths-regular" :}
    {: \font-size : font-size="0.7" :}
    
    <## hypotenuse (radius) ##>
    <line x1="0" y1="0" x2="8" y2="-4" />
    <text \maths-italic x="4" y="-2" \font-size dy="-0.6em">ρ</text>
    
    <## angle ##>
    <text \maths-italic x="1.8" y="-0.3" \font-size>φ</text>
    
    <## run ##>
    <line x1="0" y1="0" x2="8" y2="0" />
    <text x="4" y="0.8" \font-size>
      <tspan \maths-regular>cos</tspan>
      <tspan \maths-italic>Y</tspan>
    </text>
    
    <## rise ##>
    <line x1="8" y1="0" x2="8" y2="-4" />
    <text x="9.8" y="-1.8" \font-size>
      <tspan \maths-regular>cos</tspan>
      <tspan \maths-italic>τ</tspan>
      <tspan \maths-regular>sin</tspan>
      <tspan \maths-italic>Y</tspan>
    </text>
    
    <## right angle ##>
    <line x1="7.5" y1="0" x2="7.5" y2="-0.5" />
    <line x1="7.5" y1="-0.5" x2="8" y2="-0.5" />
  
  /]
  
</svg>
||||

----
After some algebra, the components of the direction
from the observer towards the sun simplify to
----
$$
  \def\componentreminder#1{\textcolor{gray}{\text{#1}}}
  \begin{pmatrix}
    u_r \\ u_\theta \\ u_\phi
  \end{pmatrix}
  =
  \rho
  \begin{pmatrix}
    \cos\delta \cos (D - \varphi) + \tan\tau \sin\delta \sin\varphi \\
    \sin\delta \cos (D - \varphi) - \tan\tau \cos\delta \sin\varphi \\
              -\sin (D - \varphi)
  \end{pmatrix}
    \quad
  \begin{matrix}
    \componentreminder{(up)} \\
    \componentreminder{(south)} \\
    \componentreminder{(east)}.
  \end{matrix}
$$

----
Let us ponder these for a moment.
Since $Y$ is constant over the course of a day,
so are $\rho$ and $\varphi$.
Thus the components are sinusoidal in $D$,
with a period of one (solar) day.
Since $\cos\delta$ is nonnegative,
the upward component $u_r$ is maximised at $D = \varphi$.
I would wager (but can't be bothered showing)
that the sun's angle of elevation
$\tan^{-1} (u_r / \sqrt{{u_\theta}^2 + {u_\phi}^2})$
is also maximised at $D = \varphi$,
corresponding to __solar noon__ (or __high noon__).
This makes perfect sense; notice that the eastward component
$u_\phi$ is zero and decreasing   at $D = \varphi$,
i.e.~the sun is crossing the local meridian (north-south arc of the sky)
towards the west.
(Similarly we have solar midnight at $D = \varphi + \pi$,
when the sun is closest to the nadir, the local downward direction.)
----

----
__ Note. __ Solar noon (or high noon) almost never occurs at 12~pm.
There are several reasons for this:
----
++++
1. __ Earth's axial tilt. __ \+
  This has been accounted for by our model;
  notice that solar noon occurs at $D = \varphi$
  rather than $D = Y$.

2. __ Earth's orbit is elliptical, not circular. __ \+
  The sun moves faster and slower at different times of the year.

3. __ Time zones. __ \+
  Clock time jumps discontinuously over their boundaries (which are arbitrary),
  whereas local solar time is a smooth function of location.

++++


##{#daytime}
  Daytime duration
##


----
__Sunrise__ and __sunset__ occur
when the sun passes through the horizon,
i.e.~when the upward component $u_r$ vanishes, or
----
$$
  \cos\delta \cos (D - \varphi) + \tan\tau \sin\delta \sin\varphi = 0.
$$

----
This solves to give
----
$$
  \gdef\bigbr#1{\bigl(#1\bigr)}
  D = D_\pm =
  \varphi \pm
  \left[
    \frac{\pi}{2} + \sin^{-1} \bigbr{\tan\tau \tan\delta \sin\varphi}
  \right],
$$
----
where $D = D_-$ corresponds to sunrise, and $D = D_+$ to sunset.
(Noon, $D = \varphi$, is halfway between the two.)
The day angle which elapses between sunrise and sunset is therefore
----
$$
  D_+ - D_- =
  \pi + 2 \sin^{-1} \bigbr{\tan\tau \tan\delta \sin\varphi}.
$$

----
Multiplying this by $\unit{day} / (2 \pi)$
gives the amount of time between sunrise and sunset,
----
$$
  T =
    \squarebr{
      \frac{1}{2}
        +
      \frac{1}{\pi} \sin^{-1} \bigbr{\tan\tau \tan\delta \sin\varphi}
    }
    \unit{day}.
$$

----
__ Note. __ The argument to the arcsine will exceed unity in magnitude
at some time during the year if $\abs{\tan\tau \tan\delta} > 1$, or
----
$$
  \abs{\delta} > \frac{\pi}{2} - \tau.
$$

----
In such a case there is no real solution to the sunrise/sunset equation.
This corresponds to midnight sun~(24~hr daylight)
and polar night~(24~hr darkness), which occur for observers
north of the Arctic Circle and south of the Antarctic Circle
(give or take due to refraction).
----

||||{.centred-block}
![
  Diagram of earth's polar regions.
  Midnight sun and polar night possible
  where the absolute value of delta exceeds pi on two minus tau.
  The Arctic Circle is delta equals pi on two minus tau.
  The Antarctic Circle is delta equals the negative, of pi on two minus tau.
][
  polar regions
]
||||

@@[polar regions]{w360}
  earth-polar-regions.png
@@


----
Yet it is very interesting to note that taking the real part of the above
expression for $T$ will give the correct daytimes, that is,
$\Re \curlybr{T} = 24 \unit{hr}$ for midnight sun and
$\Re \curlybr{T} = 0$ for polar night.
This is because
----
$$
  \Re \curlybr{\sin^{-1} w} =
  \begin{cases}
    + \pi/2, & w > +1 \\
    - \pi/2, & w < -1.
  \end{cases}
$$


##{#angles}
  Assorted angles
##


----
  Let
----
$$
  \begin{aligned}
    U = u_r / \rho &=
      \cos\delta \cos (D - \varphi) + \tan\tau \sin\delta \sin\varphi \\
    S = u_\theta / \rho &=
      \sin\delta \cos (D - \varphi) - \tan\tau \cos\delta \sin\varphi \\
    E = u_\phi / \rho &=
      -\sin (D - \varphi).
  \end{aligned}
$$

||||{.centred-block}
![
  Diagram of components of the direction towards the sun.
  This direction makes an angle alpha to the horizontal plane (the ground).
  After scaling out by the tilt-reduced unit radius rho, \
  the local components of the direction from the observer towards the sun \
  are U (up), S (south) and E (east).
][
  sun components
]
||||

@@[sun components]{w280}
  sun-components.png
@@

----
Then the sun's __altitude__ (or __elevation angle__) is given by
----
$$
  \alpha = \tan^{-1} \frac{U}{\sqrt{S^2 + E^2}}.
$$

----
At solar noon this becomes
----
$$
  \alpha_\mathrm{noon} =
  \tan^{-1} \frac{
    \cos\delta + \tan\tau \sin\delta \sin\varphi
  }{
    \abs{\sin\delta - \tan\tau \cos\delta \sin\varphi}
  }.
$$

----
The sun's __bearing__ (measured clockwise from north) is given by
----
$$
  \beta = \tan^{-1} \frac{E}{-S},
$$
----
and at sunrise/sunset this becomes
----
$$
  \beta_\pm = \tan^{-1} \frac{
    \mp \sqrt{1 - \tan^2\tau \tan^2\delta \sin^2\varphi}
  }{
    \tan\tau \sec\delta \sin\varphi
  },
$$
----
where the lower signs are for sunrise and the upper signs are for sunset.
This goes imaginary for midnight sun and polar night,
i.e.~when $\abs{\tan\tau \tan\delta \sin\varphi} > 1$.
----


##{#correction}
  Refraction correction
##


----
At the time of writing (of the manuscript) it is Sunday 7~July~2019.
The northern spring equinox fell on Thursday 21~March this year
at 05:58 (UTC+08:00). Thus we have
----
$$
  \begin{aligned}
     t &= 108 \unit{day} \\
     Y &= 106.45 \degree \\
    \varphi &= 107.84 \degree.
  \end{aligned}
$$

{: \tad : T\&D :}
{% \\tad[-]url[ ]* % https://www.timeanddate.com/ %}

----
Before proceeding any further,
we briefly compare our [mod/ model /] for daytime
against [timeanddate.com][timeanddate] ([tad/ \tad /])
for Hong Kong and Perth:
----

@@[timeanddate]
  \tad-url
@@

<## Strip spaces around thin space \, ##>
{% [ ]*\\[,][ ]* % \\, %}

||||||{.centred-block}
||||{.overflowing}
''''{.no-wrapping}
|^
==
  ;{r2} Location \+ ($\delta$)
  ;{c3} Daytime
==
  ; [tad/   \tad    /]
  ; [mod/   Model   /]
  ; [mod/   Error   /]
|:
==
  ; [Hong Kong](\tad-url sun/hong-kong/hong-kong) \+
    (+22°19')
  , [tad/   13 \, hr \, 26' \, 41"  /]
  , [mod/   13 \, hr \, 18'         /]
  , [mod/   −9.' (−1.1%)            /]
==
  ; [Perth](\tad-url sun/australia/perth) \+
    (−31°57')
  , [tad/   10 \, hr \, \08' \, 18" /]
  , [mod/   10 \, hr \, \01'        /]
  , [mod/   −7.' (−1.2%)            /]
''''
||||
||||||

----
The errors are just over 1%;
not bad for something derived with pen and paper.
----

----
Nevertheless our model underestimates daytime by around 10 minutes.
The weakest assumptions in our model are
the ignoring of atmospheric refraction
and the treating of the sun as a point.
Because light bends through the atmosphere,
the sun is visible even though it is slightly below the horizon.
Also sunrise/sunset occur when the leading/trailing edge of the sun passes
through the horizon, rather than its centre.
----

----
According to [this Hong Kong Observatory article by Tong Yu-fai](
  https://www.hko.gov.hk/m/article_e.htm?title=ele_00493
  Effect of atmospheric refraction on the times of sunrise and sunset
)
(which the Wayback Machine could not save at the time of writing),
refraction contributes around 0°34' of angular discrepancy, and
the apparent radius of the sun, 0°16', so that altogether,
the sun is 0°50' below the horizon at sunrise/sunset.
----

----
<small>
These figures appear to have been pulled off [Wikipedia][refraction],
which is possibly(?) referring to [p.~125][allen 125]
  (<var>z</var><sub>a</sub> = 90.0°, <var>z</var><sub>t</sub> = 90°35',
  i.e.~refraction of 0°35' at the horizon)
and [p.~162][allen 162]
  (semi-diameter of sun at mean earth distance = 959.63", i.e.~0°16')
of Allen's _Astrophysical Quantities_ (1973).
In any case I think the final angle of 0°50' is reliable;
[this Hong Kong Observatory document] [hko pdf]
([archived version] [hko pdf archived])
uses it for computing sunrise/sunset times.
</small>
----

@@[refraction]
  https://en.wikipedia.org/wiki/Atmospheric_refraction
@@
@@[allen 125]
  https://archive.org/details/AstrophysicalQuantities/page/n134/mode/1up
@@
@@[allen 162]
  https://archive.org/details/AstrophysicalQuantities/page/n171/mode/1up
@@
@@[hko pdf]
  http://www.hko.gov.hk/gts/astron2017/2017simp-paths-sun.pdf
  Paths of the Sun throughout the Year (Simplified Version), 2017
@@
@@[hko pdf archived]
  https://web.archive.org/web/20190712080536/\
    http://www.hko.gov.hk/gts/astron2017/2017simp-paths-sun.pdf
  Paths of the Sun throughout the Year (Simplified Version), 2017
@@


----
A correction to daytime which accounts for refraction and
the sun's apparent radius can be obtained by seeking the times at which the
sun's altitude $\alpha$ dips to
----
$$
  \alpha = -\alpha_\mathrm{ref},
$$
----
where $\alpha_\mathrm{ref} = 0\degree \, 50'$.
Presumably these times will not be far from the approximate sunrise/sunset
times we have already calculated, so we seek $\eps_\pm$ such that
----
$$
  \left.
    \tan^{-1} \frac{U}{\sqrt{S^2 + E^2}}
  \right|_{D = D_\pm + \eps_\pm}
  = -\alpha_\mathrm{ref}.
$$

----
Assuming $\eps_\pm \ll 2 \pi$, we obtain (to first order)
----
$$
  \eps_\pm =
  \pm \frac{
    \tan\alpha_\mathrm{ref} \sqrt{1 + \tan^2\tau \sin^2\varphi}
  }{
    \cos\delta \sqrt{1 - \tan^2\tau \tan^2\delta \sin^2\varphi}
  }
$$
----
so that the amount of daytime is to be corrected by
----
$$
  \frac{\eps_+ - \eps_-}{2 \pi} \unit{day} =
  \frac{
    \tan\alpha_\mathrm{ref} \sqrt{1 + \tan^2\tau \sin^2\varphi}
  }{
    \pi \cos\delta \sqrt{1 - \tan^2\tau \tan^2\delta \sin^2\varphi}
  }
  \unit{day}.
$$

----
For the 7~July example above, this evaluates to
+8~minutes for Hong Kong and +9~minutes for Perth,
and in both cases
the [modc/ refraction-corrected model /] is able to predict daytime
to within two minutes:
----

||||||{.centred-block}
||||{.overflowing}
''''{.no-wrapping}
|^
==
  ;{r2} Location \+ ($\delta$)
  ;{c3} Daytime
==
  ; [tad/   \tad    /]
  ; [modc/  Model   /]
  ; [modc/  Error   /]
|:
==
  ; [Hong Kong](\tad-url sun/hong-kong/hong-kong) \+
    (+22°19')
  , [tad/   13 \, hr \, 26' \, 41"  /]
  , [modc/  13 \, hr \, 26'         /]
  , [modc/  −1.' (−0.1%)            /]
==
  ; [Perth](\tad-url sun/australia/perth) \+
    (−31°57')
  , [tad/   10 \, hr \, \08' \, 18"   /]
  , [modc/  10 \, hr \,  10'          /]
  , [modc/  +2.' (+0.3%)              /]
''''
||||
||||||


##{#verification}
  Verification
##

----
Here I have extended the 7~July example above to more locations,
again using values from [timeanddate.com][timeanddate] for reference
(although I haven't bothered with adjusting the date of the March equinox
for different time zones).
The entries in the table are of the form
----

||||||{.centred-block}
||||{.overflowing}
''''{.no-wrapping}
==
  , [tad/ timeanddate.com /]  \+
    [mod/ Model (Error)   /]  \+
    [modc/ Model with refraction correction (Error) /].
''''
||||
||||||

----
No refraction correction is used for the sun's noon altitude.
----

||||||{.centred-block}
||||{.overflowing}
''''{.no-wrapping}
|^
==
  ;{r2} Location \+ ($\delta$)
  ;{r2} Daytime
  ;{r2} Sun's altitude \+ at noon
  ;{c2} Sun's bearing at
==
  ; sunrise
  ; sunset
|:
==
  ; [Station Nord](\tad-url sun/greenland/station-nord) \+
    (+81°36')
  ,
    [tad/   24 \, hr  /]  \+
    [mod/   24 \, hr  /]  \+
    [modc/  24 \, hr  /]
  ,
    [tad/   31.0°           /]  \+
    [mod/   30.8° (−0.2°)   /]  \+
    ~
  ,{.merged-cell c2}
    N/A \+
    (midnight sun)
==
  ; [Reykjavik](\tad-url sun/iceland/reykjavik) \+
    (+64°9')
  ,
    [tad/   20 \, hr \, 26' \, 51"    /]  \+
    [mod/   19 \, hr \, 47' (−3.2%)   /]  \+
    [modc/  20 \, hr \, 19' (−0.6%)   /]
  ,
    [tad/   48.4°           /]  \+
    [mod/   48.3° (−0.1°)   /]  \+
    ~
  ,
    [tad/   24°  /]  \+
    [mod/   29.0° (+5.°)  /]  \+
    [modc/  25.4° (+1.°)  /]
  ,
    [tad/   335°  /]  \+
    [mod/   331.0° (−4.°)  /]  \+
    [modc/  334.6° (−0.°)  /]
==
  ;
    [London](\tad-url sun/uk/london) \+
    (+51°30')
  ,
    [tad/   16 \, hr \, 25' \, 57"    /]  \+
    [mod/   16 \, hr \, 10' (−1.6%)   /]  \+
    [modc/  16 \, hr \, 24' (−0.2%)   /]
  ,
    [tad/   61.1°           /]  \+
    [mod/   60.9° (−0.2°)   /]  \+
    ~
  ,
    [tad/   51°           /]  \+
    [mod/   52.2° (+1.°)  /]  \+
    [modc/  50.9° (−0.°)  /]
  ,
    [tad/   309°            /]  \+
    [mod/   307.8° (−1.°)   /]  \+
    [modc/  309.1° (+0.°)   /]
==
  ;
    [Hong Kong](\tad-url sun/hong-kong/hong-kong) \+
    (+22°19')
  ,
    [tad/   13 \, hr \, 26' \, 41"    /]  \+
    [mod/   13 \, hr \, 18' (−1.1%)   /]  \+
    [modc/  13 \, hr \, 26' (−0.1%)   /]
  ,
    [tad/   89.7°           /]  \+
    [mod/   89.9° (+0.2°)   /]  \+
    ~
  ,
    [tad/   65°           /]  \+
    [mod/   65.7° (+1.°)  /]  \+
    [modc/  65.3° (+0.°)  /]
  ,
    [tad/   295°            /]  \+
    [mod/   294.3° (−1.°)   /]  \+
    [modc/  294.7° (−0.°)   /]
==
  ;
    [Singapore](\tad-url sun/singapore/singapore) \+
    (+1°17')
  ,
    [tad/   12 \, hr \,  11' \, 31"   /]  \+
    [mod/   12 \, hr \, \04' (−1.0%)  /]  \+
    [modc/  12 \, hr \,  11' (−0.1%) /]
  ,
    [tad/   68.7°           /]  \+
    [mod/   68.9° (+0.2°)   /]  \+
    ~
  ,
    [tad/   67°  /]  \+
    [mod/   67.6° (+1.°)  /]  \+
    [modc/  67.6° (+1.°)  /]
  ,
    [tad/   293°  /]  \+
    [mod/   292.4° (−1.°)  /]  \+
    [modc/  292.4° (−1.°)  /]
==
  ;
    [Perth](\tad-url sun/australia/perth) \+
    (−31°57')
  ,
    [tad/   10 \, hr \, \08' \, 18"   /]  \+
    [mod/   10 \, hr \, \01' (−1.2%)  /]  \+
    [modc/  10 \, hr \,  10' (+0.3%)  /]
  ,
    [tad/  35.5°          /]  \+
    [mod/  35.6° (+0.1°)  /]  \+
    ~
  ,
    [tad/   64°           /]  \+
    [mod/   63.3° (−1.°)  /]  \+
    [modc/  63.9° (−0.°)  /]
  ,
    [tad/   296°            /]  \+
    [mod/   296.7° (+1.°)  /]  \+
    [modc/  296.1° (+0.°)  /]
==
  ;
    [Enderby Land \+@6630103](\tad-url sun/@6630103) \+
    (−67°30')
  ,
    [tad/   \02 \, hr \, \03' \, 28"  /]  \+
    [mod/   \00 \, hr \, 41' (−\067%) /]  \+
    [modc/  \04 \, hr \, 14' (+106%)  /]
  ,
    [tad/   \00.4°          /]  \+
    [mod/   \00.1° (−0.3°)  /]  \+
    ~
  ,
    [tad/    14°            /]  \+
    [mod/   \04.7° (−\09°)  /]  \+
    [modc/   29.1° (+15°)   /]
  ,
    [tad/   346°            /]  \+
    [mod/   355.3° (+\09°)  /]  \+
    [modc/  330.9° (−15°)   /]
==
  ;
    [Concordia Station](\tad-url sun/antarctica/concordia-station) \+
    (−75°6')
  ,
    [tad/  \00 \, hr  /]  \+
    [mod/  \00 \, hr  /]  \+
    [modc/ \00 \, hr  /]
  ,
    [tad/  −7.7°          /]  \+
    [mod/  −7.5° (+0.2°)  /]  \+
    ~
  ,{.merged-cell c2}
    N/A \+
    (polar night)
''''
||||
||||||

----
With the exception of Enderby Land, the model does quite well;
the correction brings daytimes to within 0.5%,
and sunrise/sunset bearings to within 1°.
The model performs poorly for Enderby Land because polar night has
recently ended on 26~June (just 11~days earlier),
so the sun is spending a rather large proportion of the day near the horizon
(where refraction is significant); the correction for Enderby Land
actually makes things worse
(I think this is because the associated value of $\abs{\eps_\pm} = 0.46$
is not small enough for the perturbation to work properly).
----

----
Note that the refraction correction is a first-order perturbation about
the no-refraction sunrise and sunset times, and as such it cannot predict
the early start and late end of midnight sun,
nor the late start and early end of polar night,
compared to a hypothetical Earth with no atmosphere.
----


###{#code}
  Code for computing modelled quantities
###

----
__Code:__  [\[GNU Octave\] Daytime model (GitHub)][sun.m]
----

@@[sun.m]
  https://github.com/yawnoc/yawnoc.github.io/blob/master/math/sun.m
@@

----
Usage examples:
----

====
* $\delta = 60\degree, Y = 45\degree$
  ````
    sun (60, 45);
  ````
* Location: 41°16'S \+
  Time of year: 41~days before the northern spring (or March) equinox
  ````
    sun (-[41, 16], -41, "day");
  ````
* Hong Kong, winter solstice
  ````
    sun ("hong-kong", 270);
  ````
====

----
Script for printing the model values used in the table [above](#verification):
----

````
  places = {
    "station-nord",
    "reykjavik",
    "london",
    "hong-kong",
    "singapore",
    "perth",
    "enderby-land",
    "concordia-station"
  };
  
  for n = 1 : numel (places)
    sun (places{n}, 108, "day");
  endfor
````


##{#result}
  Result
##


----
The amount of __daytime__ (without refraction) is
----
$${.important}
  \Re \curlybr{T} =
    \Re \curlybr{
      12 +
      \frac{24}{\pi} \sin^{-1} \bigbr{\tan\tau \tan\delta \sin\varphi}
    }
    \unit{hr},
$$
----
where
----
$$
  \begin{aligned}
    \varphi &= \tan^{-1} \frac{\cos\tau \sin Y}{\cos Y} \\[\tallspace]
    Y &= \frac{2 \pi t}{\unit{yr}} \\[\tallspace]
    \unit{yr} &= 365.242 \unit{day},
  \end{aligned}
$$

====
* $\tan^{-1} (y/x)$ an abuse of notation used throughout this page,
    meaning $\mathrm{atan2} (y, x)$,
* $\tau = 23\degree \, 26'$ is Earth's axial tilt,
* $\delta$ is the observer's latitude measured north from the equator,
    and
* $t$ is the time since the northern spring (or March) equinox.
====

----
The sun's __bearing at sunrise/sunset__ (measured clockwise from north)
is given by
----
$${.important}
  \beta_\pm = \tan^{-1} \frac{
    \mp \sqrt{1 - \tan^2\tau \tan^2\delta \sin^2\varphi}
  }{
    \tan\tau \sec\delta \sin\varphi
  },
$$
----
where the lower signs are for sunrise and the upper signs are for sunset.
----

----
A first-order __correction to daytime__ which accounts
__for refraction__ by angle $\alpha_\text{ref}$
(taken to be 0°50') is given by
----
$${.important}
  \frac{
    24 \tan\alpha_\text{ref} \sqrt{1 + \tan^2\tau \sin^2\varphi}
  }{
    \pi \cos\delta \sqrt{1 - \tan^2\tau \tan^2\delta \sin^2\varphi}
  } \unit{hr}.
$$

----
The corresponding __corrected bearings at sunrise/sunset__ may be computed
by evaluating $\beta = \tan^{-1} (E / {-S})$ at $D = D_\pm + \eps_\pm$,
where $D_\pm$ is given in the section [Daytime duration](#daytime) above,
$S$ \& $E$ in [Assorted angles](#angles) and
$\eps_\pm$ in [Refraction correction](#correction).
----

----
The sun's __altitude__ (or __elevation angle__) at noon is given by
----
$${.important}
  \alpha_\text{noon} =
  \tan^{-1} \frac{
    \cos\delta + \tan\tau \sin\delta \sin\varphi
  }{
    \abs{\sin\delta - \tan\tau \cos\delta \sin\varphi}
  }.
$$

\cite-this-page[][daytime][%title]

%footer-element
