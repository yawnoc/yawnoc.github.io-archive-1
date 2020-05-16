<!-- Superscript elements x ** n -->

{%
  (?<= [0-9])
    [ ]*
  [*]{2}
    [ ]*
  (?P<power> [0-9]+ )
%
  <sup>\g<power></sup>
%}


