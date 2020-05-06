(+ res/general-syntax.cmd +)

%%
  %title Strikethrough formatter
  %title-suffix \title-suffix
  %author Conway
  %date-created 2020-03-02
  %date-modified 2020-04-25
  %resources
    (+ res/main-resources.cmd +)
  %css a~~
    .container {
      border: 2px solid black;
      margin: 1em 0.3em;
      padding: 0.4em;
    }
    #input {
      box-sizing: border-box;
      display: block;
      padding: 0.5em;
      resize: vertical;
      width: 100%;
    }
  ~~
  %onload-js a~~
    passInputToOutput()
  ~~
%%


[[====
* \header-link:home
* \header-link:top
====]]


# %title #

[||||
||||]

||||{container}
a~~
  <textarea
    autofocus
    id="input"
    oninput="passInputToOutput()"
    placeholder="Enter input here"
  >
  </textarea>
~~
||||

||||{container}
  \noscript[the strikethrough formatter]
  a~~ <s id="output"></s> ~~
||||

%footer-element

a~~
  <script>
  function passInputToOutput() {
    let inputString = document.getElementById('input').value
    output.textContent = (
      /\S/.test(inputString)
      ? inputString
      : 'Output shall appear here'
    )
  }
  </script>
~~
