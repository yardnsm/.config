// ==UserScript==
// @name          New tab cleaner
// @description   New tab cleaner
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @match           http://*/*
// @match           https://*/*
// ==/UserScript==

var REGEXP = /^https?:\/\/www.google.[a-z.]+\/\_\/chrome\/newtab.*/;
var isDefaultNewTab = REGEXP.test(top.location.href);
var newTabURL = 'about:blank';

if (isDefaultNewTab) {
  document.documentElement.innerHTML = '<head></head><body></body>';
  location.replace(newTabURL);  // Redirect to a specified new tab
}
