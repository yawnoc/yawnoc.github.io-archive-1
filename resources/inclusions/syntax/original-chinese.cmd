<!--
  ================================================================
  Load
    AFTER chinese-lang.cmd
  ================================================================
-->



<!--
  ----------------------------------------------------------------
  Bracketed original Chinese after romanisations  (( ))
  ----------------------------------------------------------------
  See chinese-lang.cmd for what is regarded as a Chinese character.
  Note that the brackets are not a part of the HTML,
  but are added cosmetically via CSS and are therefore not selectable.
  Replaces
    {leading whitespace} ((<span lang="zh-Hant">{content}</span>))
  with
    ~<span lang="zh-Hant" class="original-chinese">{content}</span>
  so that the match must be split before the first >.
-->

{%
  [ ]
  \(\(
    (?P<match_portion_1>
      <span[ ]lang="zh-Hant"
    )
    (?P<match_portion_2>
      >
        [\S]*?
      </span>
    )
  \)\)
%
  ~\g<match_portion_1> class="original-chinese"\g<match_portion_2>
%}


