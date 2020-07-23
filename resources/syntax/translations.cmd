<##
  ----------------------------------------------------------------
  Translation (parallel text)  <<{[class]}↵ || >>
  ----------------------------------------------------------------
##>

b{%
  ^ (?P<leading_whitespace> [ ]* )
  [<]{2,}
  (
    \{
      (?P<class> [^}]*? )
    \}
  )?
  \n
    
    (?P<chinese_content> [\s\S]*? )
    
  ^ (?P=leading_whitespace)
  (?P<pipes> [|]{2,} )
    
    (?P<english_content> [\s\S]*? )
    
  ^ (?P=leading_whitespace)
  [>]{2,}
%
  \g<pipes>||||{.translation .parallel-text \g<class>}
  
  \g<pipes>||{.chinese}
    \g<chinese_content>
  \g<pipes>||
  
  \g<pipes>||{.english}
    \g<english_content>
  \g<pipes>||
  
  \g<pipes>||||
%}


<##
  ----------------------------------------------------------------
  Translator-supplied italics  .[ ]
  ----------------------------------------------------------------
##>

l{%
  [.]
  \[
    (?P<content> [^]] *? )
  \]
%
  _{.translator-supplied}\g<content>_
%}


<##
  ----------------------------------------------------------------
  Translation-alternative markers  \or  \lit
  ----------------------------------------------------------------
##>

Z{: \or : <span class="alternative-marker">or</span> :}
Z{: \lit : <span class="alternative-marker">lit.</span> :}


