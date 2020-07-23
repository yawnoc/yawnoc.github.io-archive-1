{%
  # FAQ links
  ^
  (?P<hashes> [#]{2,6} (?![#]) )
  \{
    [#]
    (?P<id_> [\S]+? )
  \}
  [\s]+
    (?P<content> [\s\S]*? )
  (?P=hashes)
%
  \g<0>
  {:: \\faq-link:\g<id_> :: [\g<content>](#\g<id_>) ::}
%}
