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
export PATH="$HOME/bin:$PATH"

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
export CLICOLOR=1
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
# alias gpum='git pull upstream master'
alias repos='cd ~/vms/dev/repos'
# =================
# Additional Aliases
# =================

#Open project files

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
export VISUAL=vim
export EDITOR="$VISUAL"
alias dirs="dirs -v"
set -o vi
# cd /var/www/html/repos

alias la='ls -lah $LS_COLOR'
function cl(){ cd "$@" && la; }
function mcd(){ mkdir "$@" && cd $_; }
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
alias vimbash='vim ~/.bash_profile'
alias vimtest='vim ~/test.text'

##########################################################Git alias
alias gch="git checkout"
alias gcb="git checkout -b"
alias gc="git checkout -"
alias gbv="git branch -v"
alias gb="parse_git_branch"
alias gbc="copy_git_branch"
alias gst="git status"
alias gpsh="git push"
alias gpsho="git push origin"
alias gpll="git pull"
alias gpllo="git pull origin"
alias gme="git merge"
alias gco="git commit -m"
alias gop="git open"
alias v="vim ."
alias sshcadent='ssh -i ~/iotyourproduct.pem ec2-user@ec2-13-56-186-252.us-west-1.compute.amazonaws.com'
alias sftpcadent='sftp -i ~/iotyourproduct.pem ec2-user@ec2-13-56-186-252.us-west-1.compute.amazonaws.com'
alias sshchoredinate='cd ~/.ssh/chordinate && ssh -i "chordinate.pem" ubuntu@ec2-54-176-21-219.us-west-1.compute.amazonaws.com'
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

copy_git_branch() {
  echo "`git branch -v | grep ^* | sed -e 's/^.........//' | sed -e 's/ .*//'`" | pbcopy
}

get_current_branch() {
  echo `git branch -v | grep ^* | sed -e 's/^.........//' | sed -e 's/ .*//'`
}

# export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\W $ "
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source ~/.git-completion.bash
export PATH="$PATH:/usr/local/opt/imagemagick@6/bin"
export LDFLAGS="-L/usr/local/opt/imagemagick@6/lib"
export CPPFLAGS="-I/usr/local/opt/imagemagick@6/include"
export PKG_CONFIG_PATH="$PATH:/usr/local/opt/imagemagick@6/lib/pkgconfig"

alias newtag="sh ~/Documents/repos/tools/new-git-tag-command-generator.sh"
alias work="(nohup npm run dev &) && vim . || (nohup npm run start &) && vim ."

# fun
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=/Users/michael.robertson/Library/Android/sdk/


export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/
export PATH="${JAVA_HOME}/bin:${PATH}"
  
#export JAVA_OPTS="-Xms512m -Xmx1024m -XX:PermSize=512m -XX:MaxPermSize=1024m -Djdk.tls.client.protocols=TLSv1.2"
  
export MYSQL_HOME=/usr/local/mysql
export PATH="${MYSQL_HOME}/bin:${PATH}"
  
export GRAILS_HOME=/Users/michaelrobertson/Oportun/Installed/grails-1.3.6
export PATH="${GRAILS_HOME}/bin:${PATH}"
  
export GROOVY_HOME=/Users/michaelrobertson/Oportun/Installed/groovy-2.4.5
export PATH="${GROOVY_HOME}/bin:${PATH}"
  
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
export PATH="${DYLD_LIBRARY_PATH}:${PATH}"
  
export GRADLE_HOME=/Users/michaelrobertson/Oportun/Installed/gradle-2.5
export PATH="${GRADLE_HOME}/bin:${PATH}"
  
#export GRADLE_OPTS="-XX:MaxPermSize=128m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8777"
  
export ACTIVEMQ_HOME=/Users/michaelrobertson/Oportun/Installed/apache-activemq-5.5.1
export PATH="${ACTIVEMQ_HOME}/bin:${PATH}"
 
export PATH=$PATH:/Users/michaelrobertson/Oportun/Installed/mongodb-osx-x86_64-3.2.10/bin


bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"


#######################################################################
#                             JAVA STUFF                              #
#######################################################################
# export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home/
export PATH="${JAVA_HOME}/bin:${PATH}"
  
#export JAVA_OPTS="-Xms512m -Xmx1024m -XX:PermSize=512m -XX:MaxPermSize=1024m -Djdk.tls.client.protocols=TLSv1.2"
export MYSQL_HOME=/usr/local/mysql
export PATH="${MYSQL_HOME}/bin:${PATH}"
  
export GRAILS_HOME=/Users/michael.robertson/Oportun/Installed/grails-1.3.6
export PATH="${GRAILS_HOME}/bin:${PATH}"
  
export GROOVY_HOME=/Users/michael.robertson/Oportun/Installed/groovy-2.4.5
export PATH="${GROOVY_HOME}/bin:${PATH}"
  
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
export PATH="${DYLD_LIBRARY_PATH}:${PATH}"
  
export GRADLE_HOME=/Users/michael.robertson/Oportun/Installed/gradle-2.5
export PATH="${GRADLE_HOME}/bin:${PATH}"
  
#export GRADLE_OPTS="-XX:MaxPermSize=128m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8777"
  
export ACTIVEMQ_HOME=/Users/michael.robertson/Oportun/Installed/apache-activemq-5.5.1
export PATH="${ACTIVEMQ_HOME}/bin:${PATH}"
 
export PATH=$PATH:/Users/michael.robertson/Oportun/Installed/mongodb-osx-x86_64-3.2.10/bin
export MONGO_HOME=/Users/michael.robertson/Oportun/installed/mongodb-osx-x86_64-3.2.10

# automatically switch to the correct node version if .nvmrc exists in dir
#
# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#
# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#
enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
    return
fi
 
PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
fi
}
 
export PROMPT_COMMAND=enter_directory
# allow backwards reverse image search
stty -ixon

alias lg="lazygit"
export GIT_EDITOR=vim
export BASH_SILENCE_DEPRECATION_WARNING=1

# dir shortcuts
alias api="cd ~/Documents/repos/keen-koala/api"
alias atk="cd ~/Documents/repos/keen-koala/atk"
alias bcadent="cd ~/dev/repos/cadent/iot/iot-be/"
alias client="cd ~/Documents/repos/keen-koala/client"
alias fcadent="cd ~/dev/repos/cadent/iot/iot-fe/"
alias fe="cd /Users/michael.robertson/Documents/repos/core/frontend"
alias gol="cd ~/dev/misc/game-of-life-lua && lua gol_play.lua"
alias la="cd ~/Oportun/code/loanapplication"
alias sandbox='cd ~/Documents/repos/sandbox/'
alias shc="cd ~/Documents/repos/keen-koala/shared-config"
alias ubssh="cd ~/dev/boxes/ub16/ && vagrant ssh"
alias wfd="cd ~/Documents/repos/keen-koala/waterfront-deployments/"
alias wfn="cd ~/Documents/repos/keen-koala/waterfront-notice"
alias wfp="cd ~/Documents/repos/keen-koala/waterfront-protractor"
alias wft="cd ~/Documents/repos/keen-koala/waterfront-translation/"
alias work-start="cd vms/dev && vagrant up"
alias sshfeature="ssh mrobertson.admin@dev-michael-robertson-7474.dev.pfops.com"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=/Users/michaelrobertson/Library/Android/sdk/

PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
alias sshdev='ssh -i ~/.ssh/dev/MichaelDev.pem ubuntu@ec2-13-52-252-71.us-west-1.compute.amazonaws.com'
alias lg="lazygit"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michaelrobertson/dev/repos/ally/google/google-cloud-sdk/path.bash.inc' ]; then . '/Users/michaelrobertson/dev/repos/ally/google/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michaelrobertson/dev/repos/ally/google/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/michaelrobertson/dev/repos/ally/google/google-cloud-sdk/completion.bash.inc'; fi

alias sshclientivity='ssh -i ~/.ssh/id_rsa ec2-user@ec2-13-52-147-59.us-west-1.compute.amazonaws.com'
