// ==UserScript==
// @name          Mashove Picture Change
// @description   Change the ugly user picture in web.mashov.info
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @include       http://web.mashov.info/*
// @include       https://web.mashov.info/*
// @include       http://www.web.mashov.info/*
// @include       https://ww.web.mashov.info/*
// ==/UserScript==

setInterval(function() {
  var img = document.getElementsByClassName('img-thumbnail')[0];
  img.src = '';
}, 100);
