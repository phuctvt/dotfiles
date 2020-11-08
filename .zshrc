# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# My customization

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  

autoload -U select-word-style
autoload -U colors && colors
select-word-style bash
zstyle ':completion:*' rehash true

NEWLINE=$'\n'
# export PS1="%{$fg[yellow]%}%n %{$fg[cyan]%}%~${NEWLINE}%{$fg[blue]%}> %{$reset_color%}"
export PS1="%F{219}l%F{224}e%F{229}o %F{147}%~${NEWLINE}%F{87}> %f"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias paci="sudo pacman -S"
alias pacu="sudo pacman -Rs"
alias getvol="pamixer --get-volume"
alias bc="berryc"
alias rlemon="~/.config/lemonbar/restart.sh"
# End customization
