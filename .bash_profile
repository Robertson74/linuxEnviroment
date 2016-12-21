# _              _                        __ _ _
# | |__  __ _ ___| |__    _ __  _ __ ___  / _(_) | ___
# | '_ \ / _` / __| '_ \  | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | (_| \__ \ | | | | |_) | | | (_) |  _| | |  __/
# |_.__/ \__,_|___/_| |_| | .__/|_|  \___/|_| |_|_|\___|
#                         |_|

# When Bash starts, it executes the commands in this script
# http://en.wikipedia.org/wiki/Bash_(Unix_shell)

# Written by Philip Lamplugh, Instructor General Assembly (2013)
# Updated by PJ Hughes, Instructor General Assembly (2013)

# =====================
# Resources
# =====================

# http://cli.learncodethehardway.org/bash_cheat_sheet.pdf
# http://ss64.com/bash/syntax-prompt.html
# https://dougbarton.us/Bash/Bash-prompts.html
# http://sage.ucsc.edu/xtal/iterm_tab_customization.html

# ====================
# TOC
# ====================
# --------------------
# System Settings
# --------------------
#  Path List
#  Settings
#  History
#  Aliases
#  Other System Settings
# --------------------
# Application Settings
# --------------------
#  Application Aliases
#  rbenv
#  nvm
# --------------------
# Other Settings
# --------------------
#  Shortcuts
#  Source Files
#  Environmental Variables and API Keys
#  Colophon

# -----------------------------------------------------------------------------
# Path
# A list of all directories in which to look for commands, scripts and programs
# -----------------------------------------------------------------------------

PATH="$HOME/.rbenv/bin:$PATH"                                       # RBENV
PATH="/usr/local/share/npm/bin:$PATH"                               # NPM
PATH="/usr/local/bin:/usr/local/sbin:$PATH"                         # Homebrew
PATH="/usr/local/heroku/bin:$PATH"                                  # Heroku Toolbelt
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"                # Coreutils
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"          # Manual pages

# =================
# Settings
# =================

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"
#Hide computer name 
export PS1="\u \w \n $ "
# # Adds colors to LS!!!!
# export CLICOLOR=1
# # http://geoff.greer.fm/lscolors/
# # Describes what color to use for which attribute (files, folders etc.)
# export LSCOLORS=exfxcxdxbxegedabagacad # PJ: turned off
# export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# =================
# History
# =================

# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"

# ====================
# Aliases
# ====================


# LS lists information about files.
# show slashes for directories.
alias ls='ls -F'

# long list format including hidden files and include unit size
alias ll='ls -la'

# go back one directory
alias b='cd ..'

# History lists your previously entered commands
alias h='history'

# If we make a change to our bash profile we need to reload it
alias reload="clear; source ~/.bash_profile"

# confirm before executing and be verbose
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias cdw='cd ~/Documents/code'
alias gpum='git pull upstream master'
alias repos='cd ~/vms/dev/repos'
alias ccp='cd ~/vms/dev/repos/ccp_fe/'
# =================
# Additional Aliases
# =================

#Open project files
alias work-start="cd vms/dev && vagrant up"

# Hide/show all desktop icons (useful when presenting)
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Hide/show hidden files in Finder
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# List any open internet sockets on several popular ports.
# Useful if a rogue server is running
# http://www.akadia.com/services/lsof_intro.html
# http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
alias rogue='lsof -i TCP:3000 -i TCP:4567 -i TCP:8000 -i TCP:8888 -i TCP:6379'


# ================
# Application Aliases
# ================

#Repo Directory
alias repodir='cd ~/vms/dev/repos'

# Sublime should be symlinked. Otherwise use one of these
# alias subl='open -a "Sublime Text"'
# alias subl='open -a "Sublime Text 2"'
alias chrome='open -a "Google Chrome"'

# =================
# rbenv
# =================

# start rbenv (our Ruby environment and version manager) on open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# =================
# nvm (load io.js as node)
# =================

#export NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh
#nvm use iojs-v1.6.2 2&> /dev/null

# =================
# Functions
# =================

#######################################
# Start an HTTP server from a directory
# Arguments:
#  Port (optional)
#######################################

server() {
 local port="${1:-8000}"
 open "http://localhost:${port}/"
 # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
 # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)

 # Simple Pythong Server:
 python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

 # Simple Ruby Webrick Server:
 ruby -e "require 'webrick';server = WEBrick::HTTPServer.new(:Port=>${port},:DocumentRoot=>Dir::pwd );trap('INT'){ server.shutdown };server.start"
}

# =================
# Tab Improvements
# =================

## Tab improvements
# ## Might not need?
# bind 'set completion-ignore-case on'
# # make completions appear immediately after pressing TAB once
# bind 'set show-all-if-ambiguous on'
# bind 'TAB: menu-complete'

# =================
# Sourced Scripts
# =================

# Builds the prompt with git branch notifications.
if [ -f ~/.bash_prompt.sh ]; then
 source ~/.bash_prompt.sh
fi

# A welcome prompt with stats for sanity checks
if [ -f ~/.welcome_prompt.sh ]; then
 source ~/.welcome_prompt.sh
fi

# bash/zsh completion support for core Git.
if [ -f ~/.git-completion.bash ]; then
 source ~/.git-completion.bash
fi

#########################
# CD BACKSLASH SHORTHAND
#########################
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# ====================================
# Environmental Variables and API Keys
# ====================================

# ====================================
# Michael's additions
# ====================================

##########################################################################config
alias dirs="dirs -v"
set -o vi
cd /var/www/html/repos
set completion-ignore-case on | sudo tee -a /etc/inputrc

alias la='ls -lah $LS_COLOR'
function cl(){ cd "$@" && la; }
alias copypath='pwd|pbcopy'

########################################################################## Quick Directories
alias vup='cd ~/vms/dev; vagrant up'
alias vssh='cd ~/vms/dev; vagrant ssh'
# Below here is an area for other commands added by outside programs or
# commands. Attempt to reserve this area for their use!
##########################################################################
# Adding path for vim 8
PATH=/opt/local/bin:$PATH
alias resource="source ~/.bash_profile"
##########################################################vim related
alias ccpwork='cd /var/www/html/repos/ccp_be; vim .'
alias agentwork='cd /var/www/html/repos/agentportal; vim .'
alias vimbash='cd ~;vim .bash_profile'
alias vimtest=' cd ~/test;vim test.text'
alias vimprivate='cd /Users/mroberston/Library/Application\ Support/Karabiner;vim private.xml'

##########################################################Git alias
alias gch="git checkout"
alias gcb="git checkout -b"
alias gcp="git checkout -"
alias gbv="git branch -v"
alias gst="git status"
alias gps="git push"
alias gpl="git pull"
alias gme="git merge"
alias gco="git commit -m"
