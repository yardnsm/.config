// ==UserScript==
// @name          Mashove Picture Change
// @description   Change the ugly user picture in web.mashov.info
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @match         http://web.mashov.info/*
// @match         https://web.mashov.info/*
// @match         http://www.web.mashov.info/*
// @match         https://ww.web.mashov.info/*
// ==/UserScript==

(() => {
  'use strict';

  window.onload = () => {

    // setInterval? Are u nuts?
    setInterval(() => {
      var img = document.getElementsByClassName('img-thumbnail')[0];
      img.src = '';
    }, 100);
  };

})();
