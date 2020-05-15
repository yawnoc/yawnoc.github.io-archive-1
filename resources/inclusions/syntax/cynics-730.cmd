<!-- Thought bubbles [: :] -->

{%
  \[ [:]
  (?P<content> [\s\S]*? )
  [:] \]
%
  <span class="thought-bubble">\g<content></span>
%}


<!-- Abbreviations for classes -->

{: {h} : {host} :}
{: {ht} : {host thought-bubble} :}
{: {g} : {guest} :}
{: {gt} : {guest thought-bubble} :}


<!-- END of excerpt \END-excerpt -->

{: \END-excerpt :
  <div class="marker end">
    END of Excerpt
  </div>
:}


<!-- END of interview \END -->

{: \END :
  <div class="marker end">
    END
  </div>
:}


