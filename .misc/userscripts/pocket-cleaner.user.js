// ==UserScript==
// @name          Pocket cleaner
// @description   I hate Pocket's premium bloats.
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @match         https://app.getpocket.com/*
// ==/UserScript==

(() => {
  'use strict';

  window.onload = () => {

    // Yeah, I'm using MutationObserver and I don't give a shit on performance and error handling.
    const observer = new MutationObserver(() => {

      Promise.resolve().then(() => document.querySelector('[type="upgrade"]').remove());
      Promise.resolve().then(() => document.querySelector('[data-positioned] a[href*="premium"]').remove());
      Promise.resolve().then(() => document.querySelector('p + a[href*="premium"]').parentElement.previousElementSibling.remove());
      Promise.resolve().then(() => document.querySelector('p + a[href*="premium"]').parentElement.remove());
      Promise.resolve().then(() => document.querySelector('a[href="https://getpocket.com/jobs"]').remove());
      Promise.resolve().then(() => document.querySelector('a[href="https://getpocket.com/sponsor"]').remove());

    });

    observer.observe(document.getElementById('root'), { childList: true, subtree: true });
  };

})();
