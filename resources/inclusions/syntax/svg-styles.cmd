<##
  ----------------------------------------------------------------
  SVG embedded styles
  ----------------------------------------------------------------
##>

w{:: \svg-style:stroke-declarations ::
  a~~
    stroke: black;
    vector-effect: non-scaling-stroke;
  ~~
::}

w{:: \svg-style:text-declarations ::
  a~~
    font-family: sans-serif;
    text-anchor: middle;
  ~~
::}

w{:: \svg-style:maths-font-rulesets ::
  a~~
    @font-face {
      font-display: swap;
      font-family: "KaTeX_Math-Italic";
      src:
        url("/resources/katex/fonts/KaTeX_Math-Italic.woff2") \
          format("woff2"),
        url("/resources/katex/fonts/KaTeX_Math-Italic.woff") \
          format("woff"),
        url("/resources/katex/fonts/KaTeX_Math-Italic.ttf") \
          format("truetype");
    }
    @font-face {
      font-display: swap;
      font-family: "KaTeX_Main-Regular";
      src:
        url("/resources/katex/fonts/KaTeX_Main-Regular.woff2") \
          format("woff2"),
        url("/resources/katex/fonts/KaTeX_Main-Regular.woff") \
          format("woff"),
        url("/resources/katex/fonts/KaTeX_Main-Regular.ttf") \
          format("truetype");
    }
    .maths-italic {
      font-family: "KaTeX_Math-Italic", "KaTeX_Main-Regular";
    }
    .maths-regular {
      font-family: "KaTeX_Main-Regular";
    }
  ~~
::}

w{:: \svg-style:stroke-colour-rulesets ::
  a~~
    line.colour-r {
      stroke: #e00;
    }
    line.colour-g {
      stroke: green;
    }
    line.colour-b {
      stroke: blue;
    }
    line.colour-v {
      stroke: darkviolet;
    }
    line[class^='colour-'] {
      stroke-width: 3;
    }
  ~~
::}

w{:: \svg-style:text-colour-rulesets ::
  a~~
    text.colour-r {
      fill: #e00;
    }
    text.colour-g {
      fill: green;
    }
    text.colour-b {
      fill: blue;
    }
    text.colour-v {
      fill: darkviolet;
    }
  ~~
::}

<## Container [svg-styles/ /] ##>

c{%
  \[
  svg[-]styles/
    (?P<content> [\s\S]*? )
  /
  \]
%
  <svg class="embedded-styles" aria-hidden="true">\\
    <style>\g<content></style>\\
  </svg>
%}


