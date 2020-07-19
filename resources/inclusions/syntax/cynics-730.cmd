<## Thought bubbles [: :] ##>

l{%
  \[ [:]
  (?P<content> [\s\S]*? )
  [:] \]
%
  <span class="thought-bubble">\g<content></span>
%}


<## Abbreviations for classes ##>

b{: {.h} : {.host} :}
b{: {.ht} : {.host .thought-bubble} :}
b{: {.g} : {.guest} :}
b{: {.gt} : {.guest .thought-bubble} :}


<## END of excerpt \END-excerpt ##>

w{: \END-excerpt :
  <div class="marker end">
    END of Excerpt
  </div>
:}


<## END of interview \END ##>

w{: \END :
  <div class="marker end">
    END
  </div>
:}


<## Sic erat scriptum \sic ##>

s{: \sic : _sic_ :}


