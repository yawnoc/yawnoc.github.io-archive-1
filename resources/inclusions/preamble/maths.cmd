<##
  ----------------------------------------------------------------
  Load CSS
  ----------------------------------------------------------------
##>

a~~
  <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css"
    integrity="sha384-\
      zB1R0rpPzHqg7Kpt0Aljp8JPLqbXI3bhnPWROx27a9N0Ll6ZP/+DiW/UqRcLbRjq\
    " \
    crossorigin \
    onerror="\
      this.removeAttribute('integrity');\
      this.removeAttribute('onerror');\
      this.setAttribute('href',\
        '/resources/katex/katex.min.css'\
      )\
    ">
~~


<##
  ----------------------------------------------------------------
  Load JS
  ----------------------------------------------------------------
##>

a~~
  <script defer
    src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js"
    integrity="sha384-\
      y23I5Q6l+B6vatafAwxRu/0oK/79VlbSz7Q9aiSZUvyWYIYsd+qj+o24G5ZU2zJz\
    " \
    crossorigin \
    onerror="\
      let a=document.createElement('script');\
      a.setAttribute('src',\
        '/resources/katex/katex.min.js'\
      );\
      a.setAttribute('onload', 'renderMaths()');\
      document.head.appendChild(a);
      this.remove()\
    "
    onload="renderMaths()"></script>
~~
