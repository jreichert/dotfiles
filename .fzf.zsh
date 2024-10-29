# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

### This can probably be deleted ###
#  The above line seems to be the preferred way of handling this now
# # Auto-completion
# # ---------------
# source "/usr/local/opt/fzf/shell/completion.zsh"

# # Key bindings
# # ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
