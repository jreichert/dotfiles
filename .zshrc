# Load secret environment variables, if any
if [[ -f "$HOME/.secrets" ]]; then
    source "$HOME/.secrets"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
. /opt/homebrew/opt/asdf/libexec/asdf.sh

export CC=/opt/homebrew/opt/llvm/bin/clang

# Golang environment variables
export GOROOT=$(brew --prefix go)/libexec
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

##### FOR SILICON MAC USERS #####
# In order to use Rosetta2 for x86_64 emulation, you need a separate 
# installation of homebrew in /usr/local/homebrew that is the x86 version. 
# By default your silicon-native homebrew will be used (which is what you want 
# 99% of the time).  If you have reason to want to specifically use the x86_64 
# version, you can use the `intel-brew` alias to switch to it.  You will then 
# need to use `arm-brew` to switch back to the native version, or simply 
# close the terminal session and start a new one.
#
# If you are not using rosetta (either because you are on an Intel Mac or you 
# don't want to install it), it defaults to using your 'regular' 
# homebrew installed at /opt/homebrew.  Just don't use the `intel-brew` alias 
# in that case, as you don't have a separate installation of homebrew at /usr/local.
#

# Function to dynamically set environment variables based on Homebrew prefix
set_homebrew_compilers() {
  # Determine the active Homebrew prefix
  local brew_prefix
  brew_prefix=$(brew --prefix)

  if [[ "$brew_prefix" == "/usr/local" ]]; then
    # x86_64 Homebrew (Intel)
    export CC="/usr/local/homebrew/Library/Homebrew/shims/mac/super/clang"
    export CXX="/usr/local/homebrew/Library/Homebrew/shims/mac/super/clang++"
    export LDFLAGS="-L/usr/local/opt/openssl@3/lib -L/usr/local/opt/gnutls/lib"
    export CPPFLAGS="-I/usr/local/opt/openssl@3/include -I/usr/local/opt/gnutls/include"
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
  elif [[ "$brew_prefix" == "/opt/homebrew" ]]; then
    # ARM Homebrew (Apple Silicon)
    export CC="/opt/homebrew/Library/Homebrew/shims/mac/super/clang"
    export CXX="/opt/homebrew/Library/Homebrew/shims/mac/super/clang++"
    export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/gnutls/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/gnutls/include"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  else
    # Default fallback (system Clang)
    export CC="/usr/bin/clang"
    export CXX="/usr/bin/clang++"
    unset LDFLAGS
    unset CPPFLAGS
  fi
}

# Default to platform-native Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)" && set_homebrew_compilers

## DON'T USE THIS ALIAS UNLESS YOU KNOW WHAT YOU ARE DOING - see above ##
# Alias for switching to x86_64 Homebrew
alias intel-brew='eval "$(/usr/local/bin/brew shellenv)" && set_homebrew_compilers'

# Alias for switching back to ARM-based Homebrew
alias arm-brew='eval "$(/opt/homebrew/bin/brew shellenv)" && set_homebrew_compilers'

if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# if [[ -f $HOME/.asdf/installs/rust/1.82.0/env ]]; then
# . $HOME/.asdf/installs/rust/1.82.0/env
# fi


# set up homebrew path
BREW_DIR=`which brew`
eval $($BREW_DIR shellenv)

# set up iterm2 integration
# TODO: do this only if running on Mac
zstyle :omz:plugins:iterm2 shell-integration yes

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

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

###### PRE-PLUGIN VARIABLES #########
# If a variable is needed when loading one of the plugins below, define it here;
# It won't be seen if it is at the end of the file!

# Previews for more file types in fzf, using batpipe to do this
export FZF_PREVIEW_ADVANCED=true
export FZF_CHANGE_PREVIEW_WINDOW="--bind 'ctrl-/:change-preview-window(right,99%|down,99%,border-horizontal|hidden|right)'"

# Prefer batpipe to lesspipe if it's available
if command -v batpipe &> /dev/null 
then
    eval $(batpipe)
    export FZF_EXTENDED_VIEWER='batpipe'
    export BAT_OPTS="--style=numbers --color=always"
elif command -v lesspipe.sh &> /dev/null
then
    LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
fi

if command -v eza &> /dev/null
then
    export FZF_EZA_CONFIG='eza -1 --all --git --tree --color=always --icons=always'
fi

if command -v chafa &> /dev/null
then
    # export FZF_CHAFA_CONFIG='chafa '
fi

# Colorized output via GNU ls (i.e. gls)
source ~/LS_COLORS/lscolors.sh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# NOTE: zsh-vi-mode conflicts with fzf key bindings & completions, so you need to pick one
plugins=(fzf-tab alias-finder aliases asdf aws brew bundler colored-man-pages common-aliases \
    dirhistory docker dotbare gh git git-prompt OhMyZsh-full-autoupdate rust  \
      zsh-navigation-tools zsh-autosuggestions  fzf-zsh-plugin )

# Uncomment these on MacOS
plugins+=(iterm2 macos)

# Uncomment these for Ruby development
#plugins+=(rails ruby)

# uncomment these for Python
#plugins+=(zsh-pipx zsh-poetry)

source $ZSH/oh-my-zsh.sh

# maybe this can be done using plugins instead
# autoload -U bashcompinit
# bashcompinit

#eval "$(pyenv virtualenv-init -)"

# User configuration

#### ENVIRONMENT VARIABLES
export NAME='Jake Reichert'
export EMAIL='jake@jakereichert.com'

git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
# export MANPATH="/usr/local/man:$MANPATH"

# If set to true, any time you type a shell command then 
# if there is a shortcut available for that command it will be 
# printed in the CLI.  Useful for learning shortcuts you may not 
# even know exist, but turn it off if this bugs you 
export ZSH_ALIAS_FINDER_AUTOMATIC=true

export EDITOR='vim'
if command -v nvim &> /dev/null 
then 
    export EDITOR='nvim'
fi


# Use git-delta for diffing files through bat
BATDIFF_USE_DELTA=true

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
# NOTE: Trying to get this to work by setting env vars is painful because of the 
# order in which they get executed and in which contexts.  Consequently I've commented 
# all of this out and used zstyle below instead.  I am leaving this here for reference.
#
# The following source & exports aren't needed if using the fzf-zsh-plugin,
# as the plugin sets them based on your installed apps
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
# export FZF_DEFAULT_OPTS="--preview 'if [ -d {} ]; then tree $(realpath {}); else bat {}; fi' --color"
# export FZF_PREVIEW="bat {}"
# export FZF_DEFAULT_COMMAND="fd --type f"
# export FZF_DEFAULT_OPTS="--bind 'ctrl-/:toggle-preview' --bind '?:toggle-preview'"
# export FZF_PREVIEW_WINDOW=":nohidden"

# zstyle vars for customizing fzf-tab
# while these look more complex than setting environment variables,
# they are actually easier to get working

# show dotfiles for tab completion
setopt globdots

# # disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# custom fzf-tab flags.  Note that these only apply to using 
# fzf for tab completion.  They do not work when using plain 'fzf' to 
# open a session.
# fzf-tab does not follow FZF_DEFAULT_OPTS by default, tell it to do so
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# override the default behavior and start with the preview window open
zstyle ':fzf-tab:*' fzf-flags --height=40% --min-height=10 --preview-window '60%:nohidden' 
# zstyle ':fzf-tab:*' fzf-flags --height=40% --min-height=10 --preview-window ':nohidden' --bind 'ctrl-t:preview(eza --tree --color=always "$realpath" | head -200)'

# # switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# zstyle ':fzf-tab:*' fzf-preview-window 'right:50%'

# for directories, use eza for previews.  For regular files, have lessfilter-fzf
# decide how to best preview them.
zstyle ':fzf-tab:complete:*' fzf-preview \
  'if [[ -d "$realpath" ]]; then eza -1 --all --git  --tree --long --level=3 --color=always --icons=always "$realpath" | head -200; else lessfilter-fzf "$realpath"; fi'
zstyle ':fzf-tab:complete:**' fzf-preview \
  'if [[ -d "$realpath" ]]; then eza -1 --all --git  --tree --long --level=3 --color=always --icons=always "$realpath" | head -200; else lessfilter-fzf "$realpath"; fi'

# this line was causing tab completion to fail for files inside of subdirectories.
# the line following is the replacement for that, which still allows for retrieving 
# info about files in subdirs and subdirs of subdirs, without that problem.
# zstyle ':completion:*' file-patterns '**/*(-/)'
zstyle ':completion:*' file-patterns '%p:globbed-files' '%p:directories'


# TODO: currently not working
zstyle ':fzf-tab:*' fzf-preview-bindings \
    '?:toggle-preview' \
    'ctrl-t:preview(eza --tree --color=always "$word" | head -200)' \
    'ctrl-l:preview(eza --long --color=always "$word")'

# This is an example of how to use a zstyle with fzf-tab
# zstyle ':fzf-tab:complete:*' fzf-preview '
# echo word: $word
# echo description: $desc
# (( $+ctxt[group] )) && echo group: $group
# (( $+ctxt[isfile] )) && echo path: $realpath
# '

# This makes the fzf preview pane useful for seeing dir contents
# _fzf_comprun() {
#   local command=$1
#   echo "COMMAND: $command"
#   shift

#   case "$command" in
#     cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
#     *)            fzf "$@" ;;
#   esac
# }

brew_disc_usage() {
brew list --formula | xargs -n1 -P8 -I {} \
    sh -c "brew info {} | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/{} \1/'" | \
    sort -h -r -k2 - | column -t
}

####### PERSONAL FUNCTIONS ##########
# Put any functions here that do useful stuff for you.

# If tab completion gets slow, you can run this to rebuild the 
# compinit cache.  This is just a cache so it is a safe operation 
# that won't disrupt any of your settings.
rebuild_compinit() {
    rm -f ~/.zcompdump*
    compinit
}

# Paste the text 'vim "$1""' into the current terminal, 
# first expanding ~ if present.  This is useful for automatically 
# opening files in vim from the command line with the correct path. 
# In particular, it can be used with keyboard bindings inside of Cursor 
# to drop into a real vim session for editing (i.e. not a Cursor editor 
# with vim bindings - so if there are vim plugins or functions that are 
# needed but not available in Cursor, this will work).
vimpaste() {
  # Expand tilde and wrap in quotes
  # $1 is the path (possibly with ~ and spaces)
  local expanded
  # Expand ~ and variables
  eval "expanded=\"$1\""
  # Now pass to vim, quoted
  nvim "$expanded"
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
alias path_sort="echo $PATH | tr ':' '\n' | sort -u"


# use GNU ls for better coloring when not on a Linux system
# NOTE: This only aliases the ls command, even though gnu coreutils adds replacements for many
# programs.  See the following post on all of the coreutils programs, and what to do if you want to
# prioritize all of these instead of just ls over the Mac versions:
# https://stackoverflow.com/questions/57972341/how-to-install-and-use-gnu-ls-on-macos
alias_if_installed gls ls "gls --color=always"

# use nvim if activatingh lable
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
alias_if_installed ftcbz cbr2cbz "ftcbz --extractors rar --compressor cbz ."

# git shortcuts (there are many more from the git and gh plugins too)

# Unstage a file added with 'git add'
alias gu="git restore --staged"

alias gum="git checkout --conflict=merge"

# run git diff using the preferred tool (currently DiffMerge)
alias gdtl="git difftool --no-prompt"

#  Use nvim instead of vim for difftool if available
alias gdtlvim="git difftool --no-prompt --tool=vimdiff"
alias_if_installed nvim gdtlvim "git difftool --no-prompt --tool=nvimdiff"
#alias gcm="git commit -m"

# Python Virtualenv and venv; assumes you are always activating the virtual
# environment of the current directory
alias venvactivate="source ./venv/bin/activate"

# Fabric AI (dmessler version, not Microsoft)
alias fabric=fabric-ai

# Dungeon Crawl Stone Soup (DCSS) is a free, open-source, single-player dungeon exploration game
# Playable in a terminal but must be launched from a Mac app
# alias dcss=/Applications/Dungeon\ Crawl\ Stone\ Soup.app/Contents/MacOS/crawl
# alias dcss=' -dir "/Applications/Dungeon Crawl Stone Soup.app/Contents/Resources/crawl-data"'
alias dcss='(cd "/Applications/Dungeon Crawl Stone Soup - Console.app/Contents/Resources" && ./crawl)'

# Created by `pipx` on 2023-07-10 17:42:43
export PATH="/usr/local/opt/postgresql@15/bin:$PATH:/Users/jake/.local/bin"

# !! IMPORTANT !! this must go *before* the conda init block
#
# Do not automatically activate the base environment
# during shell initialization.
export CONDA_AUTO_ACTIVATE_BASE=false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/miniconda3/bin:$PATH"

# ~/scripts contains custom functions that should be available from the command line;
# Add ~/scripts to PATH if it exists
if [ -d "$HOME/scripts" ]; then
    export PATH="$HOME/scripts:$PATH"
fi
