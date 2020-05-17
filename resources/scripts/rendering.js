/*
  ----------------------------------------------------------------
  Sections
  ----------------------------------------------------------------
  Render date
  Render maths
  
*/


/* ---------------------------------------------------------------- */
/* Render date                                                      */
/* ---------------------------------------------------------------- */


/*
  Pad integer with zeroes into a two-digit string.
*/

function padIntoTwoDigitString(integer) {
  
  return integer.toString().padStart(2, '0');
  
}


/*
  Replace text content of an element.
*/

function replaceTextContent(elem, regex, replacement) {
  
  elem.textContent = elem.textContent.replace(regex, replacement)
  
}


/*
  Render today's date (yyyy, mm, dd) in the class "js-date".
*/

function renderDate() {
  
  let dateNow = new Date();
  
  let yyyy = dateNow.getFullYear();
  let mm = padIntoTwoDigitString(dateNow.getMonth() + 1);
  let dd = padIntoTwoDigitString(dateNow.getDate());
  
  let dateElements = document.getElementsByClassName("js-date");
  
  for (let i = 0; i < dateElements.length; i++) {
    let elem = dateElements[i]
    replaceTextContent(elem, /yyyy/g, yyyy);
    replaceTextContent(elem, /mm/g, mm);
    replaceTextContent(elem, /dd/g, dd);
  }
  
}


/* ---------------------------------------------------------------- */
/* Render maths                                                     */
/* ---------------------------------------------------------------- */


/*
  Render maths in the class "js-maths".
*/

function renderMaths() {
  
  let macros = {
    
    // Space before an operator (e.g. total differential)
    '\\mathopspace': '\\mathop{}\\!',
    
    // More vertical space for lines containing fractions etc.
    '\\tallspace': '0.8em',
    
    // Asymptotically
    '\\asy': '\\sim',
    
    // Equality by definition
    '\\defeq': '\\equiv',
    
    // Bold vectors
    '\\vec': '\\boldsymbol{\\mathbf{#1}}',
    
    // Delimiters
    '\\delimleft': '\\mathopen{}\\mathclose\\bgroup\\left#1',
    '\\delimright': '\\right#1\\egroup',
    '\\delimwrap': '\\delimleft{#1}{#2}\\delimright{#3}',
    
    // Bracketing
    '\\curlybr': '\\delimwrap{\\{}{#1}{\\}}',
    '\\roundbr': '\\delimwrap{(}{#1}{)}',
    '\\squarebr': '\\delimwrap{[}{#1}{]}',
    
    // Fencing
    '\\abs': '\\delimwrap{\\lvert}{#1}{\\rvert}', /* or, '\\situps' */
    '\\norm': '\\delimwrap{\\lVert}{#1}{\\rVert}',
    
    // Del operator
    '\\del': '\\mathopspace\\vec{\\nabla}',
    
    // Partial differential
    '\\pd': '\\mathopspace\\partial',
    
    // Total differential
    '\\td': '\\mathopspace\\mathrm{d}',
    
    // Cross product
    '\\crossp': '\\boldsymbol\\times',
    
    // Dot product
    '\\dotp': '\\boldsymbol\\cdot',
    
    // Basis vectors
    '\\basisvec': '\\mathopspace\\vec{a}_{#1}',
    
    // Units
    '\\unit': '\\mathopspace\\text{#1}',
    
    // Text quantities
    '\\textq': '\\{\\text{#1}\\}',
    
    // Generic constant
    '\\const': '\\mathrm{const}',
    
    // Natural exponential base
    '\\ee': '\\mathrm{e}',
    
    // Imaginary unit
    '\\ii': '\\mathrm{i}',
    
    // Real and imaginary parts
    '\\Re': '\\mathopspace\\mathrm{Re}',
    '\\Im': '\\mathopspace\\mathrm{Im}',
    
    // Order (Big-O)
    '\\order': '\\mathopspace O',
    
    // Colours
    '\\colr': '\\textcolor{ee0000}{#1}',
    '\\colg': '\\textcolor{green}{#1}',
    '\\colb': '\\textcolor{blue}{#1}',
    '\\colv': '\\textcolor{darkviolet}{#1}',
    
    // Epsilon
    '\\eps': '\\varepsilon',
    
  }
  
  let mathsElements = document.getElementsByClassName("js-maths");
  
  for (let i = 0; i < mathsElements.length; i++) {
    let elem = mathsElements[i]
    katex.render(
      elem.textContent,
      elem,
      {
        displayMode: elem.tagName == "DIV",
        macros: macros,
        throwOnError: false,
      }
    )
  }
  
}

