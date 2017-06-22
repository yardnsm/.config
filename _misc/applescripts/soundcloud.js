#!/usr/bin/env osascript -l JavaScript

/*
 * Yeah, it's ugly and weird, but it works.
 */

let result = '';

if (Application('Google Chrome').running()) {

  Application('Google Chrome').windows().forEach((appWindow) => {

    if (appWindow.title().includes('\uD83D\uDD0A')) { // 🔊

      appWindow.tabs().some((tab) => {

        if (tab.url().includes('soundcloud.com')) {

          const tabName = tab.name();

          const isNotInPlayMode = [
            'Your stream on',
            'Hear your',
            'Hear the tracks',
            'Free Listening on',
            'Recommended for you'
          ].some((val) => tabName.includes(val));

          if (isNotInPlayMode) {
            return false;
          }

          result = tabName.length < 30 ?
            tabName :
            (tabName.substring(0, 30) + '...');

          return true;
        }
      });
    }
  });

  result;
}
