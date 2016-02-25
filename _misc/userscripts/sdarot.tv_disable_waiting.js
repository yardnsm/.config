// ==UserScript==
// @name          Sdarot.TV Disable Waiting
// @Description   This little code can disable the 30sec waiting time at Sdarot.TV
// @copyright     YardNsm
// @author        YardNsm
// @version       1.0
///////////////////////////////////////////////////////////
// @include       http://sdarot.tv/watch/*
// @include       https://sdarot.tv/watch/*
// @include       http://www.sdarot.tv/watch/*
// @include       https://www.sdarot.tv/watch/*

// @include       http://sdarot.wf/watch/*
// @include       https://sdarot.wf/watch/*
// @include       http://www.sdarot.wf/watch/*
// @include       https://www.sdarot.wf/watch/*

// @include       http://sdarot.pm/watch/*
// @include       https://sdarot.pm/watch/*
// @include       http://www.sdarot.pm/watch/*
// @include       https://www.sdarot.pm/watch/*
// ==/UserScript==
clearInterval(counter);
counter = false;
addon = 2;
download["hd"] = true;
download["sd"] = true;
var fullload = true;
loadEpisode(fullload);;
