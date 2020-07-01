<##
  ----------------------------------------------------------------
  Bracketed original Chinese after romanisations  (( ))
  ----------------------------------------------------------------
  See chinese-lang.cmd for what is regarded as a Chinese character.
  Note that the brackets are not a part of the HTML,
  but are added cosmetically via CSS and are therefore not selectable.
  Replaces
    {single space} ((<span lang="zh-Hant">{content}</span>))
  with
    &nbsp;<span lang="zh-Hant" class="original-chinese">{content}</span>
  so that the match must be split before the first >.
##>

Z{%
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
  &nbsp;\g<match_portion_1> class="original-chinese"\g<match_portion_2>
%}


