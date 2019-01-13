# Common Setting
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt prompt_subst

bindkey -v

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

# load common zsh aliases
source ~/.zsh/zsh_aliases.zsh

# load peco functions
source ~/.zsh/peco.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/2.5.0/bin:$PATH

eval "$(pyenv init -)"

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
