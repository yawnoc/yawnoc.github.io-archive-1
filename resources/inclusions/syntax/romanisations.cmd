<!--
  ================================================================
  Load
    BEFORE chinese-lang.cmd
  ================================================================
-->



<!--
  ----------------------------------------------------------------
  Sun Tzu
  ----------------------------------------------------------------
-->

{: \sun-tzu : Sun Tz(uu) :}



<!--
  ----------------------------------------------------------------
  Romanisation indicators  \C  \pm  \M  \gr
  ----------------------------------------------------------------
-->

{% \\C [\s]* %
  [Cantonese](
    /cantonese/conway-romanisation
    Conway's Romanisation for Cantonese
  ):~
%}

{% \\pm [\s]* %
  [post-merger](
    /cantonese/conway-romanisation#ts-vs-ch
    {ts vs ch}, {ts' vs ch'}, and {s vs sh}
  ):~
%}

{% \\M [\s]* % Mandarin:~ %}
{% \\gr [\s]* % Government-regulated 統讀:~ %}
{% \\nc [\s]* % Nominally-Communist 統讀:~ %}



<!--
  ----------------------------------------------------------------
  Romanisation spans  [^ ]  [_ ]
  ----------------------------------------------------------------
-->

<!-- Pre-merger initials [^ ] -->

{%
  \[
  [\^]
  [\s]*
    (?P<content> [\s\S]*? )
  [\s]*?
  \]
%
  <span class="pre-merger initial">\g<content></span>
%}

<!-- Post-merger initials [_ ] -->

{%
  \[
  [_]
  [\s]*
    (?P<content> [\s\S]*? )
  [\s]*?
  \]
%
  <span class="post-merger initial">\g<content></span>
%}



<!--
  ----------------------------------------------------------------
  Romanisation special characters
  ----------------------------------------------------------------
-->

<!-- Common -->

{: (u")  : ü :}  <!-- U+00FC LATIN SMALL LETTER U WITH DIAERESIS -->

<!-- Conway only -->

{: (oe)  : œ :}  <!-- U+0153 LATIN SMALL LIGATURE OE -->

<!-- Wade--Giles only -->

{: (e^)  : ê :}  <!-- U+00EA LATIN SMALL LETTER E WITH CIRCUMFLEX -->
{: (uu)  : ŭ :}  <!-- U+016D LATIN SMALL LETTER U WITH BREVE -->

<!-- Pinyin tone 1 (陰平 dark level) only -->

{: (a-)  : ā :}  <!-- U+0101 LATIN SMALL LETTER A WITH MACRON -->
{: (e-)  : ē :}  <!-- U+0113 LATIN SMALL LETTER E WITH MACRON -->
{: (i-)  : ī :}  <!-- U+012B LATIN SMALL LETTER I WITH MACRON -->
{: (o-)  : ō :}  <!-- U+014D LATIN SMALL LETTER O WITH MACRON -->
{: (u-)  : ū :}  <!-- U+016B LATIN SMALL LETTER U WITH MACRON -->
{: (u"-) : ǖ :}  <!-- U+01D6 LATIN SMALL LETTER U WITH DIAERESIS AND MACRON -->

<!-- Pinyin tone 2 (陽平 light level) only -->

{: (a/)  : á :}  <!-- U+00E1 LATIN SMALL LETTER A WITH ACUTE -->
{: (e/)  : é :}  <!-- U+00E9 LATIN SMALL LETTER E WITH ACUTE -->
{: (i/)  : í :}  <!-- U+00ED LATIN SMALL LETTER I WITH ACUTE -->
{: (o/)  : ó :}  <!-- U+00F3 LATIN SMALL LETTER O WITH ACUTE -->
{: (u/)  : ú :}  <!-- U+00FA LATIN SMALL LETTER U WITH ACUTE -->
{: (u"/) : ǘ :}  <!-- U+01D8 LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE -->

<!-- Pinyin tone 3 (上 rising) only -->

{: (av)  : ǎ :}  <!-- U+01CE LATIN SMALL LETTER A WITH CARON -->
{: (ev)  : ě :}  <!-- U+011B LATIN SMALL LETTER E WITH CARON -->
{: (iv)  : ǐ :}  <!-- U+01D0 LATIN SMALL LETTER I WITH CARON -->
{: (ov)  : ǒ :}  <!-- U+01D2 LATIN SMALL LETTER O WITH CARON -->
{: (uv)  : ǔ :}  <!-- U+01D4 LATIN SMALL LETTER U WITH CARON -->
{: (u"v) : ǚ :}  <!-- U+01DA LATIN SMALL LETTER U WITH DIAERESIS AND CARON -->

<!-- Pinyin tone 4 (去 departing) only -->

{: (a\)  : à :}  <!-- U+00E0 LATIN SMALL LETTER A WITH GRAVE -->
{: (e\)  : è :}  <!-- U+00E8 LATIN SMALL LETTER E WITH GRAVE -->
{: (i\)  : ì :}  <!-- U+00EC LATIN SMALL LETTER I WITH GRAVE -->
{: (o\)  : ò :}  <!-- U+00F2 LATIN SMALL LETTER O WITH GRAVE -->
{: (u\)  : ù :}  <!-- U+00F9 LATIN SMALL LETTER U WITH GRAVE -->
{: (u"\) : ǜ :}  <!-- U+01DC LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE -->


