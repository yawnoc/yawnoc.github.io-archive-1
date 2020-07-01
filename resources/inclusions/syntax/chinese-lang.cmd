<##
  ----------------------------------------------------------------
  Middle dot \.
  ----------------------------------------------------------------
##>

<## U+30FB KATAKANA MIDDLE DOT ##>

p{: \. : ・ :}



<##
  ----------------------------------------------------------------
  Automatic language declarations for Chinese
  ----------------------------------------------------------------
  This is a pretty liberal definition of "Chinese".
  See <https://en.wiktionary.org/wiki/Appendix:Unicode>
  and <https://en.wikipedia.org/wiki/Template:CJK_ideographs_in_Unicode>.
  
  * U+2E80 through U+2EFF (CJK Radicals Supplement)
  * U+2F00 through U+2FDF (Kangxi Radicals)
  * U+2FF0 through U+2FFF (Ideographic Description Characters)
  * U+3000 through U+303F (CJK Symbols and Punctuation)
    [⺀-〿]
  
  * U+30FB only (KATAKANA MIDDLE DOT)
    [・]
  
  * U+31C0 through U+31EF (CJK Strokes)
    [㇀-㇣]
    Stop early at U+31E3 (U+31E4 onwards not assigned).
  
  * U+3400 through U+4DBF (CJK Unified Ideographs Extension A)
  * U+4DC0 through U+4DFF (Yijing Hexagram Symbols)
  * U+4E00 through U+9FFF (CJK Unified Ideographs)
    [㐀-鿼]
    Stop early at U+9FFC (U+9FFD onwards not assigned).
  
  * U+F900 through U+FAFF (CJK Compatibility Ideographs)
    [豈-龎]
    Stop early at U+FAD9 (U+FADA onwards not assigned).
  
  * U+FF00 through U+FFEF (Halfwidth and Fullwidth Forms)
    [！-｠]
    Start late at U+FF01 (U+FF00 not assigned).
    Stop early at U+FF60 (U+FF61 onwards are halfwidth or currency etc.).
  
  * U+20000 through U+2A6DF (CJK Unified Ideographs Extension B)
  * U+2A700 through U+2B73F (CJK Unified Ideographs Extension C)
  * U+2B740 through U+2B81F (CJK Unified Ideographs Extension D)
  * U+2B820 through U+2CEAF (CJK Unified Ideographs Extension E)
  * U+2CEB0 through U+2EBEF (CJK Unified Ideographs Extension F)
  * U+2F800 through U+2FA1F (CJK Compatibility Ideographs Supplement)
  * U+30000 through U+3134F (CJK Unified Ideographs Extension G)
    [𠀀-𱍊]
    Stop early at U+3134A (U+3134B onwards not assigned).
  
  Also allowed are the following:
  
  * Simple delimiters
      [c/ /] where c is a lower-case letter
      [: :] defined per document (use flag later than i)
  * Double U+2014 EM DASH
      ——
  * Double U+2026 HORIZONTAL ELLIPSIS
      ……
  
##>

w{%
  (
    ( \[ [a-z] / ) ?
    ( \[: ) ?
    [⺀-〿・㇀-㇣㐀-鿼豈-龎！-｠𠀀-𱍊] +
    ( —{2} ) ?
    ( …{2} ) ?
    ( :\] ) ?
    ( /\] ) ?
  )+
%
  <span lang="zh-Hant">\g<0></span>
%}


