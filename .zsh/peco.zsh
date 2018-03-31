# history search 
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ghq repository search
function peco-ghq() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}

zle -N peco-ghq
bindkey '^E' peco-ghq

# git select branch
function peco-branch () {
    local branch=$(git branch -a | peco | tr -d ' ' | tr -d '*')
    if [ -n "$branch" ]; then
      if [ -n "$LBUFFER" ]; then
        local new_left="${LBUFFER%\ } $branch"
      else
        local new_left="$branch"
      fi
      BUFFER=${new_left}${RBUFFER}
      CURSOR=${#new_left}
    fi
}
zle -N peco-branch
bindkey '^B' peco-branch # C-x b でブランチ選択

# git commit id
function peco-git-hash() {
    local res
    res=$(git log --oneline --decorate=full | peco | awk '{print $1}')
  BUFFER=${LBUFFER}${res}
  CURSOR=$#BUFFER
}
zle -N peco-git-hash
bindkey '^H' peco-git-hash
