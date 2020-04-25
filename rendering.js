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
  
  let mathsElements = document.getElementsByClassName("js-maths");
  for (let i = 0; i < mathsElements.length; i++) {
    let elem = mathsElements[i]
    try {
      katex.render(
        elem.textContent,
        elem,
        {displayMode: elem.tagName == "DIV"}
      )
    }
    catch (error) {
      elem.textContent = error;
      elem.setAttribute("style", "color:red")
    }
  }
  
}

