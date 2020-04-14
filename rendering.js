/*
  ----------------------------------------------------------------
  Sections
  ----------------------------------------------------------------
  Render date
  
*/


/* ---------------------------------------------------------------- */
/* Render date                                                      */
/* ---------------------------------------------------------------- */


/*
  Pad (with zeroes) into a two-digit string.
  Assumes input is a one- or two-digit integer or string.
*/

function padIntoTwoDigitString(integer) {
  
  return ('0' + integer).slice(-2);
  
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
  
  var NOW = new Date();
  
  let yyyy = NOW.getFullYear();
  let mm = padIntoTwoDigitString(NOW.getMonth() + 1);
  let dd = padIntoTwoDigitString(NOW.getDate() + 1);
  
  let date_elements = document.getElementsByClassName("js-date");
  for (let i = 0; i < date_elements.length; i++) {
    let elem = date_elements[i]
    replaceTextContent(elem, /yyyy/g, yyyy);
    replaceTextContent(elem, /mm/g, mm);
    replaceTextContent(elem, /dd/g, dd);
  }
  
}

