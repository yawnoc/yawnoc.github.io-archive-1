<## Superscript elements x ** n ##>

s{%
  (?P<base> [0-9]+ )
    [ ]
  [*]{2}
    [ ]
  (?P<power> [0-9]+ )
%
  \g<base><sup>\g<power></sup>
%}


