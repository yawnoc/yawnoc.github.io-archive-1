<!-- Thought bubbles [: :] -->
{%
  \[ [:]
  (?P<content> [\s\S]*? )
  [:] \]
%
  <span class="thought-bubble">\g<content></span>
%}
