#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -la'
alias grep='grep --color=auto'
alias dropbox='python2 ~/.dropbox-dist/dropbox.py'
PS1='\u \w $ '
