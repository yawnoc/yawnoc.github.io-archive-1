/*
  conway-render.js
  Modified: 20191030
  
  ----------------------------------------------------------------
  Section 1
  ----------------------------------------------------------------
  Edited from js.cookie.js found at
    https://github.com/js-cookie/js-cookie
    https://github.com/js-cookie/js-cookie/blob/latest/src/js.cookie.js
  Edited so that the minified version will contain a link to the unminified
  version (which will contain the MIT license).
  
  ----------------------------------------------------------------
  Section 2
  ----------------------------------------------------------------
  Assorted rendering functions:
    dateRender()
    mathsRender()
  
  ----------------------------------------------------------------
  Section 3
  ----------------------------------------------------------------
  Romanisation preference settings:
    romanisationInitialise()
    romanisationShow(romanisation)
*/

/*
  ----------------------------------------------------------------
  Section 1
  ----------------------------------------------------------------
  Changed (++++) MIT license !-comment to normal comment
  and created new !-comment with link to unminified version
*/

// ++++ Removed ending ! at the end of the next line:
/*
 * JavaScript Cookie v2.2.0
 * https://github.com/js-cookie/js-cookie
 *
 * Copyright 2006, 2015 Klaus Hartl & Fagner Brack
 * Released under the MIT license
 */
// ++++ New comment:
/*!
  WARNING
  Contains traces of the MIT license. See the unminified version:
  https://yawnoc.github.io/conway-render.js
  https://github.com/yawnoc/yawnoc.github.io/blob/master/conway-render.js
*/
;(function (factory) {
	var registeredInModuleLoader = false;
	if (typeof define === 'function' && define.amd) {
		define(factory);
		registeredInModuleLoader = true;
	}
	if (typeof exports === 'object') {
		module.exports = factory();
		registeredInModuleLoader = true;
	}
	if (!registeredInModuleLoader) {
		var OldCookies = window.Cookies;
		var api = window.Cookies = factory();
		api.noConflict = function () {
			window.Cookies = OldCookies;
			return api;
		};
	}
}(function () {
	function extend () {
		var i = 0;
		var result = {};
		for (; i < arguments.length; i++) {
			var attributes = arguments[ i ];
			for (var key in attributes) {
				result[key] = attributes[key];
			}
		}
		return result;
	}

	function init (converter) {
		function api (key, value, attributes) {
			var result;
			if (typeof document === 'undefined') {
				return;
			}

			// Write

			if (arguments.length > 1) {
				attributes = extend({
					path: '/'
				}, api.defaults, attributes);

				if (typeof attributes.expires === 'number') {
					var expires = new Date();
					expires.setMilliseconds(expires.getMilliseconds() + attributes.expires * 864e+5);
					attributes.expires = expires;
				}

				// We're using "expires" because "max-age" is not supported by IE
				attributes.expires = attributes.expires ? attributes.expires.toUTCString() : '';

				try {
					result = JSON.stringify(value);
					if (/^[\{\[]/.test(result)) {
						value = result;
					}
				} catch (e) {}

				if (!converter.write) {
					value = encodeURIComponent(String(value))
						.replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g, decodeURIComponent);
				} else {
					value = converter.write(value, key);
				}

				key = encodeURIComponent(String(key));
				key = key.replace(/%(23|24|26|2B|5E|60|7C)/g, decodeURIComponent);
				key = key.replace(/[\(\)]/g, escape);

				var stringifiedAttributes = '';

				for (var attributeName in attributes) {
					if (!attributes[attributeName]) {
						continue;
					}
					stringifiedAttributes += '; ' + attributeName;
					if (attributes[attributeName] === true) {
						continue;
					}
					stringifiedAttributes += '=' + attributes[attributeName];
				}
				return (document.cookie = key + '=' + value + stringifiedAttributes);
			}

			// Read

			if (!key) {
				result = {};
			}

			// To prevent the for loop in the first place assign an empty array
			// in case there are no cookies at all. Also prevents odd result when
			// calling "get()"
			var cookies = document.cookie ? document.cookie.split('; ') : [];
			var rdecode = /(%[0-9A-Z]{2})+/g;
			var i = 0;

			for (; i < cookies.length; i++) {
				var parts = cookies[i].split('=');
				var cookie = parts.slice(1).join('=');

				if (!this.json && cookie.charAt(0) === '"') {
					cookie = cookie.slice(1, -1);
				}

				try {
					var name = parts[0].replace(rdecode, decodeURIComponent);
					cookie = converter.read ?
						converter.read(cookie, name) : converter(cookie, name) ||
						cookie.replace(rdecode, decodeURIComponent);

					if (this.json) {
						try {
							cookie = JSON.parse(cookie);
						} catch (e) {}
					}

					if (key === name) {
						result = cookie;
						break;
					}

					if (!key) {
						result[name] = cookie;
					}
				} catch (e) {}
			}

			return result;
		}

		api.set = api;
		api.get = function (key) {
			return api.call(api, key);
		};
		api.getJSON = function () {
			return api.apply({
				json: true
			}, [].slice.call(arguments));
		};
		api.defaults = {};

		api.remove = function (key, attributes) {
			api(key, '', extend(attributes, {
				expires: -1
			}));
		};

		api.withConverter = init;

		return api;
	}

	return init(function () {});
}));

/*
  ----------------------------------------------------------------
  Section 2
  ----------------------------------------------------------------
*/

/*
  dateRender()
  For rendering today's date. Use
    yyyy
    month
    mm
    dd
    d
  inside span elements with class "date".
*/
function dateRender() {
  // Get date strings
  const DATE   = new Date();
  const MONTHS = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  let yyyy  = DATE.getFullYear();
  let m     = DATE.getMonth() + 1;
  let mm    = ('0' + m).slice(-2);
  let month = MONTHS[m - 1];
  let d     = DATE.getDate();
  let dd    = ('0' + d).slice(-2);
  // For all elements with class "date"
  let elems = document.getElementsByClassName("date");
  for (let i = 0; i < elems.length; i++) {
    let elem = elems[i];
    /*
      Replace
        yyyy  with 4-digit year
        month with month name
        mm    with 2-digit month
        dd    with 2-digit date
        d     with date
    */
    elem.textContent = elem.textContent.replace(/yyyy/g,  yyyy);
    elem.textContent = elem.textContent.replace(/month/g, month);
    elem.textContent = elem.textContent.replace(/mm/g,    mm);
    elem.textContent = elem.textContent.replace(/dd/g,    dd);
    elem.textContent = elem.textContent.replace(/d/g,     d);
  }
}

/*
  mathsRender()
  Rendering for KaTeX equations.
  Useful for reference:
    http://sixthform.info/katex/guide.html
    http://sixthform.info/katex/smrender.js
  Use
    <span class="maths">...</span> for inline maths,
  and
    <div class="maths">...</div> for display maths.
*/
function mathsRender() {
  // Conway's commonly used macros
  const MACROS = {
    '\\del' : '\\mathop{}\\!\\boldsymbol{\\nabla}',
    '\\dotp': '\\boldsymbol{\\cdot}',
    '\\ee'  : '\\mathrm{e}',
    '\\eps' : '\\varepsilon',
    '\\ii'  : '\\mathrm{i}',
    '\\pd'  : '\\mathop{}\\!\\partial',
    '\\td'  : '\\mathop{}\\!\\mathrm{d}',
    '\\unit': '\\mathop{}\\!\\text{#1}',
    '\\vec' : '\\mathbf{#1}',
    '\\veca': '\\mathop{}\\!\\vec{a}'
  };
  // For all elements with class "maths"
  let elems = document.getElementsByClassName("maths");
  for (let i = 0; i < elems.length; i++) {
    let elem = elems[i];
    // Render:
    try {
      katex.render(
        elem.textContent,
        elem,
        {
          // display maths for div, inline otherwise
          displayMode: elem.tagName == "DIV",
          // macros
          macros: MACROS
        }
      );
    }
    // Display errors
    catch(err) {
      elem.style.color      = "yellow";
      elem.style.background = "black";
      elem.style.padding    = "0.2em 0.5em";
      elem.textContent      = err;
    }
  }
}

/*
  ----------------------------------------------------------------
  Section 3
  ----------------------------------------------------------------
  See: Romanisation, whose display may be toggled in conway.css
  Romanisations are none, conway, wadegiles, pinyin.
  Button ids and classes have prefix 'romanisation-'.
  See 'Romanisations for English text radio box <^^>' and
  'Romanisations for English text <^>' in cch-to-html.py.
*/

/*
  romanisationInitialise()
  Initialises romanisation.
  Stack Overflow
  JavaScript - onClick to get the ID of the clicked button
  https://stackoverflow.com/a/4825406
  How to get value of selected radio button?
  https://stackoverflow.com/a/15839451
*/
function romanisationInitialise() {
  // Create style sheet for showing/hiding romanisations
  // (changing its innerHTML is much quicker than looping through all of the
  //  romanisation elements and adding/removing classes)
  romanisationSheet = document.createElement('style');
  document.head.appendChild(romanisationSheet);
  // Romanisations
  const ROMANISATIONS = [
    'none',
    'conway',
    'wadegiles',
    'pinyin'
  ];
  // Functions for adding and removing 'romanisation-' prefix
  const PREFIX = 'romanisation-';
  let addPrefix = function (string) {
    return PREFIX + string;
  };
  let removePrefix = function (string) {
    return string.slice(PREFIX.length);
  };
  // Handler for when F9 is down (cycle through romanisations)
  let romanisationOnF9 = function () {
    // Get current romanisation
    let romanisation =
      removePrefix(
        document.querySelector('input[name="romanisation"]:checked').id
      );
    // Get romanisation index
    let index = ROMANISATIONS.indexOf(romanisation);
    // New romanisation index
    index = (index + 1) % ROMANISATIONS.length;
    // New romanisation
    romanisation = ROMANISATIONS[index];
    // Set romanisation cookie
    Cookies.set('romanisation', romanisation, {expires: 365});
    // Check radio button corresponding to cookie
    let elem = addPrefix(romanisation);
    document.getElementById(elem).checked = true;
    // Show selected romanisation
    romanisationShow(romanisation);
  };
  // Set handler for F9
  window.addEventListener('keydown',
    function (event) {
      if (event.code === 'F9') {
        romanisationOnF9();
      }
    }
  );
  // Handler for when romanisation radio button is clicked.
  let romanisationOnClick = function() {
    // Get romanisation
    let romanisation = removePrefix(this.id);
    // Set romanisation cookie
    Cookies.set('romanisation', romanisation, {expires: 365});
    // Show selected romanisation
    romanisationShow(romanisation);
  };
  // Set handler for all romanisation radio buttons
  for (let i = 0; i < ROMANISATIONS.length; i++) {
    let elem = addPrefix(ROMANISATIONS[i]);
    document.getElementById(elem).onclick = romanisationOnClick;
  }
  // Get romanisation cookie
  let romanisation = Cookies.get('romanisation');
  // If romanisation cookie is not among romanisations
  if (!ROMANISATIONS.includes(romanisation)) {
    // Set romanisation and romanisation cookie to 'conway'
    romanisation = 'conway';
    Cookies.set('romanisation', romanisation, {expires: 365});
  }
  // Check radio button corresponding to cookie
  let elem = addPrefix(romanisation);
  document.getElementById(elem).checked = true;
  // Show selected romanisation
  romanisationShow(romanisation);
}

/*
  romanisationShow(romanisation)
  Show selected romanisation.
  In conway.css:
    selector "span.romanisation" has "display: none;"
    selector "span.romanisation-conway" has "display: inline;"
  Thus romanisation defaults to 'romanisation-conway'.
  Other romanisations are shown by overriding this using the style sheet
  romanisationSheet created in romanisationInitialise().
*/
function romanisationShow(romanisation) {
  // If romanisation is 'conway'
  if (romanisation === 'conway') {
    // This is shown by default
    romanisationSheet.innerHTML = "";
  }
  // Otherwise
  else {
    // Hide 'conway'
    let sheetCode = "span.romanisation-conway{display:none}";
    // If romanisation is not 'none'
    if (romanisation !== 'none') {
      // Show romanisation
      sheetCode += "span.romanisation-" + romanisation + "{display:inline}";
    }
    // Update style sheet
    romanisationSheet.innerHTML = sheetCode;
  }
}