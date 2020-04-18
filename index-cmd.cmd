(+ res/abbreviatory-syntax.cmd +)

%%
  %title Conway's site
  %author Conway
  %date-created 2019-03-09
  %date-modified 2020-04-xx
  %resources
    (+ res/main-resources.cmd +)
    (+ res/rendering-js.cmd +)
  %description Conway's site: Literary Chinese and applied mathematics.
  %footer-remark
    And if the current year is greater than %year-modified:
    no, the footer is not "out of date".
    It means that I haven't thought up
    or gotten around to adding content since %year-modified-next;
    possibly I have died.
  %css
    .page-link-container li {
      margin-bottom: 0.7em;
    }
    .page-link-container a {
      font-weight: bold;
    }
    .page-description {
      font-size: small;
      margin: 0.2em 0;
    }
  %onload-js
    renderDate();
%%


[[====
* \link-here:home
* \link:top
* \link:cite
====]]


# Conway's site #


||||{page-properties}
First created: %date-created \\
Date modified: %date-modified \\
Feedback welcome: `leeconway@protonmail.com`
||||

----
Assorted musings of a remnant of the 20th~century,
with the cynicism of Daria and the metabolism of Sir Doris the Hamster.
----


##pages
  Pages to read
##

<!-- Abbreviations for classes -->
{: {plc} : {page-link-container} :}
{: {pd} : {page-description} :}

###general
  General material
###

===={plc}
* [Conway's Romanisation for Cantonese](/cantonese/conway-romanisation.html)
  ||||{pd}
    Wade--Giles-style initials and length-indicative finals.
  ||||

* [FAQ](/cantonese/conway-romanisation.html)
  ||||{pd}
    Frequently asked questions.
  ||||

* [A cynic's 7.30 (and other programs)](/cynics-730/)
  ||||{pd}
    Mind reading: Australian politics.
  ||||

* [Mao on separatism: 27 Chinas](/mao-on-separatism.html)
  ||||{pd}
    Mao in 1920, on why China ought to be split into 27 separate countries.
  ||||

====


###applied-maths
  Applied mathematics (or, physics)
###

===={plc}
* [Daytime: dependence on latitude and season](/math/daytime.html)
  ||||{pd}
    The sun's path through the sky
    and the duration of daytime (among other quantities).
  ||||

* [Projectile motion: optimal launch angle for weak quadratic drag](
    /math/projectile-weak-drag.html
  )
  ||||{pd}
    Launching projectiles in weak air resistance
    proportional to the square of speed.
  ||||

* [Projectile motion: optimal launch angle from a platform](
    /math/projectile-platform.html
  )
  ||||{pd}
    Launching projectiles from a raised platform.
  ||||

====


###literary-chinese
  English translations of Literary Chinese
###


####literary-chinese-maths
  Mathematics
####


####literary-chinese-not-maths
  Not mathematics
####


##code
  Useful code
##


###code-web
  Website building
###

====
* __Conway markdown:__
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


###code-maths
  Mathematical stuff
###

====
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
    /sun-tzu/code/animations.html
  )
====

{: \py : (! [Python] !) :}
{: \ma : (! [Mathematica] !) :}


###code-emails
  Email typing
###

====
* [Unicode mathematical symbols](/code/unicode-maths.html)
* [Strikethrough formatter](/code/strikethrough.html)
====


\cite-this-page[home-page][{Conway's} site]


%footer-element
