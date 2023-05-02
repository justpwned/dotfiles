if grep -qi microsoft /proc/version; then
    export BROWSER="/mnt/c/WINDOWS/explorer.exe"
    WIN_PATH="/mnt/c/Program Files/Docker/Docker/resources/bin:/mnt/c/ProgramData/DockerDesktop/version-bin:/mnt/c/Users/justp/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/justp/AppData/Local/GitHubDesktop/bin"
    export PATH="$PATH:$WIN_PATH"
    alias open="/mnt/c/WINDOWS/explorer.exe"
    alias macos-run="sudo HEADLESS=1 /mnt/c/users/justp/Documents/OneClick-macOS-Simple-KVM/basic.sh"
fi

# Disable <c-s> terminal mapping
stty -ixon
shopt -s autocd
export LESS="--mouse"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim

nvimconf() {
    pushd ~/.config/nvim/ > /dev/null
    nvim init.lua
    popd > /dev/null
}

alias se="sudoedit"
alias ta="tmux a -t"
alias tls="tmux ls"
alias t="tmux"

if [ -n "$(command -v pyenv)" ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
fi

export PATH=$PATH:/usr/local/go/bin:~/go/bin
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env" 
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"
[ -x "$(command -v fzf)" ] && . /usr/share/doc/fzf/examples/key-bindings.bash
