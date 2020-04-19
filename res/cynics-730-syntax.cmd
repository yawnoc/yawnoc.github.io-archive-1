<!-- Thought bubbles [: :] -->
{%
  \[ [:]
  (?P<content> [\s\S]*? )
  [:] \]
%
  <span class="thought-bubble">\g<content></span>
%}


<!-- END of interview \END -->
{: \END :
  <div class="signal">
    END
  </div>
:}
