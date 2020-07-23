{+ resources/syntax/general.cmd +}

{+ resources/syntax/chinese-lang.cmd +}
{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}
{+ resources/syntax/translations.cmd +}

%%
  %title Conway's site
  %title-suffix <## nothing ##>
  %date-created 2019-03-09
  %date-modified 2020-07-13
  \resources:rendering
  %description Conway's site: Literary Chinese and applied mathematics.
  %footer-remark
    And if the current year is greater than %year-modified:
    no, the footer is not "out of date".
    It means that I haven't thought up
    or gotten around to adding content since %year-modified-next;
    possibly I have died.
  %css a~~
    .page-link-container > li {
      margin-bottom: 0.7em;
    }
    .page-link-container > li > a {
      font-weight: bold;
    }
    .page-description {
      font-size: small;
      margin: 0.2em 0;
    }
  ~~
%%


[[====
* \header-link-here:home
* \header-link:top
* [Math.](#applied-maths  Applied mathematics \(or, physics\))
* [Lit.](#literary-chinese  English translations of Literary Chinese)
* [Code](#code  Useful code)
* \header-link:cite
====]]


# Conway's site #


[||||
Feedback welcome: `yawnoc@pm.me`
||||]

----
Assorted musings of a remnant of the 20th~century,
with the cynicism of Daria and the metabolism of Sir~Doris the Hamster.
----


##{#pages}
  Pages to read
##

###{#general}
  General material
###

===={.page-link-container}
* [Conway's Romanisation for Cantonese](/cantonese/conway-romanisation)
  ||||{.page-description}
    Wade--Giles-style initials and length-indicative finals.
  ||||

* [FAQ](/faq)
  ||||{.page-description}
    Frequently asked questions.
  ||||

* [Debian on Pinebook Pro via Daniel's installer](/pinebook-pro)
  ||||{.page-description}
    Installation and customisation of Debian Bullseye
    using [Daniel Thompson's unofficial installer].
  ||||
  @@[Daniel Thompson's unofficial installer]
    https://github.com/daniel-thompson/pinebook-pro-debian-installer
  @@

* [A cynic's 7.30 (and other programs)](/cynics-730/)
  ||||{.page-description}
    Mind reading: Australian politics.
  ||||

* [Mao on separatism: 27 Chinas](/mao-on-separatism)
  ||||{.page-description}
    Mao in 1920, on why China ought to be split into 27 separate countries.
  ||||

====


###{#applied-maths}
  Applied mathematics (or, physics)
###

===={.page-link-container}
* [Daytime: dependence on latitude and season](/math/daytime)
  ||||{.page-description}
    The sun's path through the sky
    and the duration of daytime (among other quantities).
  ||||

* [Projectile motion: optimal launch angle for weak quadratic drag](
    /math/projectile-weak-drag
  )
  ||||{.page-description}
    Launching projectiles in weak air resistance
    proportional to the square of speed.
  ||||

* [Projectile motion: optimal launch angle from a platform](
    /math/projectile-platform
  )
  ||||{.page-description}
    Launching projectiles from a raised platform.
  ||||

====


###{#literary-chinese}
  English translations of Literary Chinese
###


####{#literary-chinese-maths}
  Mathematics
####

======{.page-link-container}
* [
    《孫子算經》 \+
    "\sun-tzu's Computational Classic"
  ][""]
  ====
  * [《序》 "Preface"] ["p"]
  * [《卷上》 "Volume~I"] ["i"]
  * [《卷中》 "Volume~II"] ["ii"] (incomplete)
  * 《卷下》 "Volume~III" (haven't started)
  ====
  ||||{.page-description}
    An annotated translation of the entire _Sunzi Suanjing_ (once completed).
  ||||

* [
    《海島算經》 \+
    ".[The] Sea Island Computational Classic"
  ](/lit/sea-island)
  ||||{.page-description}
    The first problem in _Haidao Suanjing_.
  ||||

======


####{#literary-chinese-not-maths}
  Not mathematics
####

===={.page-link-container}
* ["The Need to Win"](/lit/need-to-win)
  ||||{.page-description}
    On _The Turning_ (Tim Winton), quoting Thomas Merton,
    paraphrasing Chuang Tz(uu), on Confucius, on (probably) archery.
  ||||

* [
    《孔子問答：小兒論》 \+
    "Q .[\&] A .[with] Confucius: .[the] Little Child's Discourse"
  ](/lit/little-child)
  ||||{.page-description}
    Confucius getting his arse whooped by a little kid.
  ||||

* [
    《太平山獅子亭記》 \+
    "Record of .[the] Lion's Pavilion, Victoria Peak"
  ](/lit/lion-pavilion)
  ||||{.page-description}
     Plaque text commemorating the Lion's Pavilion.
  ||||

* [
    《狐假虎威》 \+
    ".[The] Fox Feigneth .[the] Tiger's Authority"
  ](/lit/fox-tiger)
  ||||{.page-description}
     The original second half of _The Gruffalo_.
  ||||

* [
    《施氏食獅史》 \+
    ".[An] History of Mr Shih's Eating of Lions"
  ](/lit/lion-eating)
  ||||{.page-description}
     The original Mandarin "lion tongue twister".
  ||||

====


##{#code}
  Useful code
##


###{#code-web}
  Website building
###

====
* __Conway's markdown:__
  [Python converter (GitHub)][cmd],
  [Documentation (GitHub pages)][cmd-docs]
* Links to ping the sitemap: [Google], [Bing]
====

@@[cmd]
  https://github.com/conway-markdown/conway-markdown
  GitHub: Conway's fence-style markdown (CMD), implemented in Python.
@@
@@[cmd-docs]
  https://conway-markdown.github.io/
  Conway's markdown (CMD)
@@
@@[google]
  https://www.google.com/ping?sitemap=https://yawnoc.github.io/sitemap.txt
@@
@@[bing]
  https://www.bing.com/ping?sitemap=https://yawnoc.github.io/sitemap.txt
@@


###{#code-maths}
  Mathematical stuff
###

====
* [\oct Image to ASCII art converter (GitHub)](
    https://github.com/yawnoc/ascii-art
  )
* [\py Big Two (鋤大弟) scoring statistics (GitHub)](
    https://github.com/yawnoc/big-two-stats
  )
* [\py Cantonese Diceware (GitHub)](
    https://github.com/yawnoc/cantonese-diceware
  )
* [\py \sun-tzu square root algorithm (GitHub)](
    https://github.com/yawnoc/yawnoc.github.io/blob/master/sun-tzu/code/sqrt.py
  )
* [\ma \sun-tzu multiplication \& division animations](
    /sun-tzu/code/animations
  )
====

{: \py : \[Python\] :}
{: \oct : \[GNU Octave\] :}
{: \ma : \[Mathematica\] :}


###{#code-emails}
  Email typing
###

====
* [Unicode mathematical symbols](/code/unicode-maths)
* [Strikethrough formatter](/code/strikethrough)
====


\cite-this-page[][home-page][{Conway's} site]


%footer-element
