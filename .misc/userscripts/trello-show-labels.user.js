// ==UserScript==
// @name          Trello show labels
// @description   Shows labels name in trello when not in card details
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @match         http://trello.com/*
// @match         https://trello.com/*
// @match         http://www.trello.com/*
// @match         https://ww.trello.com/*
// ==/UserScript==

(() => {
  'use strict';

  window.onload = () => {

    const styles = `
      .card-label.mod-card-front {
        height:23px;
        text-align: center;
        padding: 0px 10px;
        width: auto;
        line-height: 16pt;
      }
    `;

    const styleElem = document.createElement('style');

    styleElem.type = 'text/css';
    styleElem.appendChild(document.createTextNode(styles));

    document.head.appendChild(styleElem);
  };

})();
