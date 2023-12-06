stty -ixon
shopt -s autocd

export LESS="--mouse -R"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim

alias se=sudoedit
alias ls=exa
alias ll="ls -la"

export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:/Library/PostgreSQL/16/bin/
export PATH=$PATH:/usr/local/opt/mysql/bin

eval "$(starship init bash)"
eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
