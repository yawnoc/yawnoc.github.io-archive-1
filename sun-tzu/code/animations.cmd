{+ resources/syntax/general.cmd +}

{+ resources/syntax/romanisations.cmd +}
{+ resources/syntax/sun-tzu.cmd +}

%%
  %title \[Mathematica\] \sun-tzu multiplication \& division animations
  %date-created 2019-05-26
  %date-modified 2020-03-20
  \resources:maths
  %description
    Mathematica code generating animations for the \
    Sunzi Suanjing multiplication \& division algorithms.
%%

[[====
* \header-link:home
* \header-link:top
* [Multiplication](#multiplication  Multiplication)
* [Division](#division  Division)
====]]


# %title #

\noscript:maths

[||||
||||]


----
__Code:__  [yawnoc/sun-tzu-arithmetic (GitHub)][repo]
----

@@[repo]
  https://github.com/yawnoc/sun-tzu-arithmetic
@@


----
Mathematica code for the animations in my
[translation of "\sun-tzu's Computational Classic"] [""];
see Vol.~I [\P8] ["i 8"] \&~[\P13] ["i 13"] (multiplication) 
and [\P9] ["i 9"] \&~[\P14] ["i 14"] (division).
----


@@[package file]
  https://github.com/yawnoc/sun-tzu-arithmetic/blob/master/SunTzu.wl
@@

----
First change to the directory of [`SunTzu.wl`][package file],
then load the package
----
``
  << SunTzu`
``
----
and run the following:
----



##{#multiplication}
  Multiplication
##


``
  {
    {81, 81},
    {1989, 64},
    {1024, 1024},
    {246, 97531}
  } /.
    {x_, y_} :> MultiplyAnimation[x, y, Export -> True]
``

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    ; $81 \times 81 = 6561$
    ; $1989 \times 64 = 127296$
    ; $1024 \times 1024 = 1048576$
    ; $246 \times 97531 = 23992626$
  ==
    , \multiplication-animation[81 * 81]
    , \multiplication-animation[1989 * 64]
    , \multiplication-animation[1024 * 1024]
    , \multiplication-animation[246 * 97531]
''''
||||
||||||



{%
  \\multiplication[-]animation
  \[
      (?P<a> [0-9]+ )
    [ ]
      [*]
    [ ]
      (?P<b> [0-9]+ )
  \]
%
  ![Animation for \\sun-tzu multiplication: \g<a> multiplied by \g<b>](
    /sun-tzu/code/multiply-\g<a>-\g<b>.gif
  )
%}

{%
  \\division[-]animation
  \[
      (?P<a> [0-9]+ )
    [ ]
      [/]
    [ ]
      (?P<b> [0-9]+ )
  \]
%
  ![Animation for \\sun-tzu division: \g<a> divided by \g<b>](
    /sun-tzu/code/divide-\g<a>-\g<b>.gif
  )
%}



##{#division}
  Division
##


``
  {
    {100, 6},
    {1989, 64},
    {6561, 9},
    {97531, 4}
  } /.
    {x_, y_} :> DivideAnimation[x, y, Export -> True]
``

||||||{.centred-block}
||||{.overflowing}
''''
  ==
    ; $100 \div 6 = 16 + \dfrac{4}{6}$
    ; $1989 \div 64 = 31 + \dfrac{5}{64}$
    ; $6561 \div 9 = 729$
    ; $97531 \div 4 = 24382 + \dfrac{3}{4}$
  ==
    , \division-animation[100 / 6]
    , \division-animation[1989 / 64]
    , \division-animation[6561 / 9]
    , \division-animation[97531 / 4]
''''
||||
||||||

%footer-element
