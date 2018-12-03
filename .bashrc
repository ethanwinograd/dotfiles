# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500000
#HISTFILESIZE=400000
HISTTIMEFORMAT="%m/%d/%y %T "
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$K8ENV\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias api='cd ~/projects/kamioka/kamioka_api'
alias jupc='cd ~/projects/jupiter/JupiterClient'
alias jups='cd ~/projects/jupiter/JupiterServer'
alias ont='cd ~/projects/ontology_api'
alias util='cd ~/projects/utility_scripts'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


USER=winograde

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

#JAVA_HOME=/usr/bin/javac
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/usr/local/bin/
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/sbt/bin # add sbt to path
PATH=$PATH:$HOME/clojure_stuff/bin # add lein to path
PATH=$PATH:~/projects/utility_scripts
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

export KAMIOKA_DIR=/Users/winograde/projects/kamioka/kamioka_api/
export ONTOLOGY_DIR=/Users/winograde/projects/ontology_api/

source ~/.git-completion.bash

#show the git branch in the prompt
source ~/.bash_git
PS1='\[\e]0;\u@\h: \W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;31m\](`kubectl config view|grep current-context|tail -c +18`)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]:`__git_ps1`\$ '

# personal alias

export AWS_REPO_URL=660262356760.dkr.ecr.us-east-1.amazonaws.com
export AWS_CA_BUNDLE=/Users/winograde/.ssh/UPMC/UPMC-Root-CA.PEM


[[ -s "/home/ethan/.gvm/scripts/gvm" ]] && source "/home/ethan/.gvm/scripts/gvm"

# kubectl completion
source <(kubectl completion bash)

# toit completion
/Users/winograde/projects/utility_scripts/toit_helpers.sh
export NVM_DIR="/Users/winograde/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
