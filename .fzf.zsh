# Setup fzf
# ---------
if [[ ! "$PATH" == */home/krusty/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/krusty/.fzf/bin"
fi

source <(fzf --zsh)
