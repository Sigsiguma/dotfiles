autoload -Uz compinit
compinit

if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
    source ~/.zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

# setting common environment path
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init - --no-rehash)"


if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
