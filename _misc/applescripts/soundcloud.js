#!/usr/bin/env osascript -l JavaScript

/*
 * Yeah, it's ugly and weird, but it works.
 */

let result = '';
// result = 'SoundCloud is not active';
if (Application('Google Chrome').running()) {

  const appWindow = Application('Google Chrome').windows[0];

  if (appWindow.title().indexOf('\uD83D\uDD0A') !== -1) { // 🔊
    appWindow.tabs().some((tab) => {
      if (tab.url().toString().indexOf('soundcloud.com') !== -1) {

        const tabName = tab.name();

        const isNotInPlayMode = [
          'Your stream on',
          'Hear your',
          'Hear the tracks',
          'Free Listening on',
          'Recommended for you'
        ].some((val) => tabName.indexOf(val) !== -1);

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
  result;
}
