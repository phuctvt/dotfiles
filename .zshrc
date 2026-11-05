# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/phuc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PATH="/home/phuc/.local/bin:$PATH"

autoload -Uz promptinit && promptinit
prompt fade blue

# Default WORDCHARS without '-' and '/'
WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

bindkey "^[[1;3C" forward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5D" backward-word
