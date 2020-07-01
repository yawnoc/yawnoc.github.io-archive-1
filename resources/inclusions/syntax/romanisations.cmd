<##
  ----------------------------------------------------------------
  Sun Tzu
  ----------------------------------------------------------------
##>

p{: \sun-tzu : Sun Tz(uu) :}



<##
  ----------------------------------------------------------------
  Romanisation indicators  \C  \pm  \M  \gr
  ----------------------------------------------------------------
##>

p{% \\C [ ] %
  [Cantonese](
    /cantonese/conway-romanisation
    Conway's Romanisation for Cantonese
  ):~
%}

p{% \\pm [ ] %
  [post-merger](
    /cantonese/conway-romanisation#ts-vs-ch
    {ts vs ch}, {ts' vs ch'}, and {s vs sh}
  ):~
%}

p{% \\M [ ] % Mandarin:~ %}
p{% \\gr [ ] % Government-regulated 統讀:~ %}
p{% \\nc [ ] % Nominally-Communist 統讀:~ %}



<##
  ----------------------------------------------------------------
  Romanisation spans  [^ ]  [_ ]
  ----------------------------------------------------------------
##>

<## Pre-merger initials [^ ] ##>

l{%
  \[
  [\^]
    (?P<content> [^_]*? )
  \]
%
  <span class="pre-merger initial">\g<content></span>
%}

<## Post-merger initials [_ ] ##>

l{%
  \[
  [_]
    (?P<content> [^_]*? )
  \]
%
  <span class="post-merger initial">\g<content></span>
%}



<##
  ----------------------------------------------------------------
  Romanisation special characters
  ----------------------------------------------------------------
##>

<## Common ##>

p{: (u")  : ü :}  <## U+00FC LATIN SMALL LETTER U WITH DIAERESIS ##>

<## Conway only ##>

p{: (oe)  : œ :}  <## U+0153 LATIN SMALL LIGATURE OE ##>

<## Wade--Giles only ##>

p{: (e^)  : ê :}  <## U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX ##>
p{: (uu)  : ŭ :}  <## U+016D LATIN SMALL LETTER U WITH BREVE ##>

<## Pinyin tone 1 (陰平 dark level) only ##>

p{: (a-)  : ā :}  <## U+0101 LATIN SMALL LETTER A WITH MACRON ##>
p{: (e-)  : ē :}  <## U+0113 LATIN SMALL LETTER E WITH MACRON ##>
p{: (i-)  : ī :}  <## U+012B LATIN SMALL LETTER I WITH MACRON ##>
p{: (o-)  : ō :}  <## U+014D LATIN SMALL LETTER O WITH MACRON ##>
p{: (u-)  : ū :}  <## U+016B LATIN SMALL LETTER U WITH MACRON ##>
p{: (u"-) : ǖ :}  <## U+01D6 LATIN SMALL LETTER U WITH DIAERESIS AND MACRON ##>

<## Pinyin tone 2 (陽平 light level) only ##>

p{: (a/)  : á :}  <## U+00E1 LATIN SMALL LETTER A WITH ACUTE ##>
p{: (e/)  : é :}  <## U+00E9 LATIN SMALL LETTER E WITH ACUTE ##>
p{: (i/)  : í :}  <## U+00ED LATIN SMALL LETTER I WITH ACUTE ##>
p{: (o/)  : ó :}  <## U+00F3 LATIN SMALL LETTER O WITH ACUTE ##>
p{: (u/)  : ú :}  <## U+00FA LATIN SMALL LETTER U WITH ACUTE ##>
p{: (u"/) : ǘ :}  <## U+01D8 LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE ##>

<## Pinyin tone 3 (上 rising) only ##>

p{: (av)  : ǎ :}  <## U+01CE LATIN SMALL LETTER A WITH CARON ##>
p{: (ev)  : ě :}  <## U+011B LATIN SMALL LETTER E WITH CARON ##>
p{: (iv)  : ǐ :}  <## U+01D0 LATIN SMALL LETTER I WITH CARON ##>
p{: (ov)  : ǒ :}  <## U+01D2 LATIN SMALL LETTER O WITH CARON ##>
p{: (uv)  : ǔ :}  <## U+01D4 LATIN SMALL LETTER U WITH CARON ##>
p{: (u"v) : ǚ :}  <## U+01DA LATIN SMALL LETTER U WITH DIAERESIS AND CARON ##>

<## Pinyin tone 4 (去 departing) only ##>

p{: (a\)  : à :}  <## U+00E0 LATIN SMALL LETTER A WITH GRAVE ##>
p{: (e\)  : è :}  <## U+00E8 LATIN SMALL LETTER E WITH GRAVE ##>
p{: (i\)  : ì :}  <## U+00EC LATIN SMALL LETTER I WITH GRAVE ##>
p{: (o\)  : ò :}  <## U+00F2 LATIN SMALL LETTER O WITH GRAVE ##>
p{: (u\)  : ù :}  <## U+00F9 LATIN SMALL LETTER U WITH GRAVE ##>
p{: (u"\) : ǜ :}  <## U+01DC LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE ##>


