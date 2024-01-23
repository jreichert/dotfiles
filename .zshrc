# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Library/Python/3.11/bin:$PATH

# set up homebrew path
eval $(/usr/local/bin/brew shellenv)

# set up iterm2 integration
zstyle :omz:plugins:iterm2 shell-integration yes

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# NOTE: zsh-vi-mode conflicts with fzf key bindings & completions, so you need to pick one
plugins=(ag alias-finder aliases asdf aws brew bundler colored-man-pages common-aliases \
    dirhistory docker dotbare gh git git-prompt iterm2 macos OhMyZsh-full-autoupdate rails \
    ruby zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-pipx zsh-poetry fzf-zsh-plugin )
source $ZSH/oh-my-zsh.sh

# maybe this can be done using plugins instead
# autoload -U bashcompinit
# bashcompinit

#eval "$(pyenv virtualenv-init -)"

# User configuration

#### ENVIRONMENT VARIABLES
# export MANPATH="/usr/local/man:$MANPATH"
export ZSH_ALIAS_FINDER_AUTOMATIC=true
export TODOIST_API_KEY="$(pass Todoist/API)"
export EDITOR='nvim'

# For dotbare (https://github.com/kazhala/dotbare)
export DOTBARE_DIR=$HOME/.dotbare

# use this instead to switch editors depending on if this is an ssh session or not
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='nvim'
# else
#  export EDITOR='mvim'
#fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#### FZF CONFIG #####

# The following source & exports aren't needed if using the fzf-zsh-plugin
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
# export FZF_DEFAULT_COMMAND="fd --type f"

# This makes the fzf preview pane useful for seeing dir contents
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

####### PERSONAL ALIASES ##########
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Conditionally perform an alias if the given program is installed
# If the 3rd argument is left out, then alias_name will be aliased to 
# the program that was tested
# usage: alias_if_installed PROGRAM, ALIAS_NAME, [COMMAND]
alias_if_installed() {
    program=$1 
    if command -v $program &> /dev/null 
    then 
        aliased_command=$3 
        if [ -z $3 ];
        then
            aliased_command=$1
        fi
        # echo "alias $2=$aliased_command"
        alias $2=$aliased_command
    fi
}

# QoL shortcuts
alias whereami="echo $HOST"
alias zshconfig="vim ~/.zshrc"
alias vimwiki="vim -c VimwikiIndex"
alias acs=als

# use GNU ls for better coloring
alias ls="gls --color=always"

# use nvim if available
alias_if_installed nvim vim
alias_if_installed nvim vi

# SnowSQL is the CLI client for Snowflake
alias_if_installed /Applications/SnowSQL.app/Contents/MacOS/snowsql snowsql

# replace cat with bat (https://github.com/sharkdp/bat)
alias_if_installed bat cat

#cbr2cbz converts all CBRs in the current dir to CBZs.  Requires
# python, ftcbz and unrar to be installed.  Use:
# * brew install rar
# * pip install ftcbz
alias cbr2cbz="ftcbz --extractors rar --compressor cbz ."

# git shortcuts (there are many more from the git and gh plugins too)
alias gum="git checkout --conflict=merge"
alias gdtl="git difftool --no-prompt"

#  Use nvim instead of vim for difftool if available
alias gdtlvim="git difftool --no-prompt --tool=vimdiff"
alias_if_installed nvim gdtlvim "git difftool --no-prompt --tool=nvimdiff"
#alias gcm="git commit -m"

# Python Virtualenv and venv; assumes you are always activating the virtual
# environment of the current directory
alias venvactivate="source ./venv/bin/activate"

# Created by `pipx` on 2023-07-10 17:42:43
export PATH="/usr/local/opt/postgresql@15/bin:$PATH:/Users/jake/.local/bin"

# Colorized output via GNU ls (i.e. gls)
source ~/LS_COLORS/lscolors.sh