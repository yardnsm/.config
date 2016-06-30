// ==UserScript==
// @name          Trello show labels
// @description   Shows labels name in trello when not in card details
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @include       http://trello.com/b/*
// @include       https://trello.com/b/*
// @include       http://www.trello.com/b/*
// @include       https://ww.trello.com/b/*
// ==/UserScript==

var styles = '.card-label.mod-card-front { height:23px;text-align:center;padding:0px 10px;width:auto;line-height:16pt; }';
var styleElem = document.createElement('style');
styleElem.type = 'text/css';
styleElem.appendChild(document.createTextNode(styles));
document.head.appendChild(styleElem);
