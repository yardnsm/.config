#!/usr/bin/env bash

# --------------------------------------------- #
# | Create workspace folders
# --------------------------------------------- #
create_folder "torrents"
create_folder "dev"

# Project that won't go anywhere
create_folder "dev/private"

# Projects for git remotes
create_folder "dev/github"
create_folder "dev/gitlab"

# When I'm bored
create_folder "dev/playground"

# Usually clones from github
create_folder "dev/sandbox"
