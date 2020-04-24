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


<!-- END of interview \END -->
{: \END :
  <div class="signal">
    END
  </div>
:}


<!-- Literal dollar sign -->
{: \. : (! $ !) :}
