alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# uv
export PATH="/home/phuc/.local/bin:$PATH"

autoload -Uz promptinit && promptinit
prompt fade blue

# Default WORDCHARS without '-' and '/'
WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

bindkey "^[[1;3C" forward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5D" backward-word
