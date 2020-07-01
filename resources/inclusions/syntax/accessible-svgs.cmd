<##
  ----------------------------------------------------------------
  Accessible inline SVGs
  ----------------------------------------------------------------
  Inline SVGs do not have an equivalent of <img>'s alt attribute,
  which is really dumb.
  
  Basically how a screenreader treats an SVG
  will depend on the screenreader and the browser.
  
  Reading:
  
  * Heather Migliorisi (2016) for CSS-Tricks
    "Accessible SVGs"
    https://css-tricks.com/accessible-svgs/
  
  * Scott O'Hara (2019)
    "Contextually Marking up accessible images and SVGs"
    https://www.scottohara.me/blog/2019/05/22/\
      contextual-images-svgs-and-a11y.html
  
  * Scott O'Hara (2019)
    "SVG and Image markup tests"
    https://scottaohara.github.io/testing/img-svg-acc-name/img-svg-tests.html
    https://web.archive.org/web/20200426173932/{ibid}
  
  From Heather's article:
    """"
    According to the W3C specification,
    we shouldn’t have to do anything extra for SVGs
    beyond providing the `<title>` and possibly a `<desc>`
    because they should be available to the Accessibility API.
    Unfortunately, browser support is not quite there yet
    (bugs reported for: Chrome and Firefox).
    
    [...] Add the appropriate ID’s to the `<title>` and `<desc>` [...]
    
    [...] On the `<svg>` tag, add:
      `aria-labelledby="uniqueTitleID uniqueDescID"` [...]
    
    [...] On the `<svg>` tag, add:
      `role="img"` [...]
    """"
  Note that that article was last updated in 2016.
  
  From Scott's "SVG and Image markup tests",
  written in 2019 and accessed 2020-04-27,
  Test 11 is the most robust in terms of accessibility for inline SVGs
  (all tests pass but three exceptions for JAWS on IE11).
  
  The pattern for Test 11 is thus:
  ````
  <svg viewBox="..." height="..." width="..."
    role="img"
    focusable="false"
    aria-labelledby="id"
  >
    <title id="id">Accessible Name</title>
    <path aria-hidden="true" d="..."></path>
  </svg>
  ````
  
  Therefore I shall define the following:
  
  * \accessible-svg-attributes[{id}]
    role="img" focusable="false" aria-labelledby="{id}"
  
  * [accessible-svg-title/{id}  {content}  /]
    <title id="{id}">{content}</title>
  
  * [accessible-svg-content/  {content}  /]
    <g aria-hidden="true">{content}</g>
  
  If the labelling by id ever becomes unnecessary,
  then I will remove the {id} bits.
  
##>

<## \accessible-svg-attributes[{id}] ##>

w{%
  \\accessible[-]svg[-]attributes
  \[
    (?P<id_> [\S]+? )
  \]
%
  role="img" focusable="false" aria-labelledby="\g<id_>"
%}


<## [accessible-svg-title/{id}  {content}  /] ##>

w{%
  \[
  accessible[-]svg[-]title/
    (?P<id_> [\S]+ )
    [\s]*
    (?P<content> [\s\S]*? )
    [\s]*
  /
  \]
%
  <title id="\g<id_>">\g<content></title>
%}


<## [accessible-svg-content/  {content}  /] ##>

w{%
  \[
  accessible[-]svg[-]content/
    (?P<content> [\s\S]*? )
  /
  \]
%
  <g aria-hidden="true">\g<content></g>
%}


