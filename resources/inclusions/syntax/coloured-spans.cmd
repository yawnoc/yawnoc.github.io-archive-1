<!-- Must be loaded AFTER automatic-lang-chinese.cmd -->

<!--
  ----------------------------------------------------------------
  Coloured spans  [c/ /]
  ----------------------------------------------------------------
  c is the colour letter, one of r, g, b, v.
-->


{%
  \[ (?P<colour_letter> [rgbv] )
    /
      [\s]*
      (?P<content> [\s\S] *? )
      [\s]*
    /
  \]
%
  <span class="colour-\g<colour_letter>">\g<content></span>
%}


