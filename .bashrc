#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Above is the defaults
alias ll='ls -la'
alias grep='grep --color=auto'
alias dropbox='python2 ~/.dropbox-dist/dropbox.py'
alias gvol='pulsemixer --get-volume'
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.my-dotfiles --work-tree=$HOME'
alias cwallpaper='feh --bg-fill'
function svol() {
	pulsemixer --set-volume $1 --get-volume
}
function cvol() {
	pulsemixer --change-volume $1 --get-volume
}
if [ -e ~/git-prompt.sh ]; then
	. ~/git-prompt.sh
fi
if [ -e /usr/share/git/completion/git-completion.bash ]; then
	. /usr/share/git/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=1
PS1='\u \w$(__git_ps1 " (%s)") \$ '
PS1='\[\e[92m\]\u \[\e[96m\]\w\[\e[34m\]$(__git_ps1 " (%s)") \[\e[0m\]\$ '
