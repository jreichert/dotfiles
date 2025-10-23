# Easy Personal Dotfile management across machines

# What does this do?

This Repo makes use of Dotbare (see below) to bootstrap the setup of a new environment with my
personal config. Some highlights of what this does, which is not an exhaustive list:

- ZSH shell with Oh-My-Zsh as the baseline, plus several useful plugins
- EverVim as the base Vim configuration (see link below for more info on what this provides)
- Support for NeoVim
- A wide array of customizations that turn Vim into a modern IDE with code completion, LSP support,
  simple code navigation, etc. across a wide number of languages
- Vimwiki: A wiki built into Vim, using Markdown as the language to write it in. This means you can
  make your wiki into a Wiki on GitHub just by adding all the files in the wiki directory to a new
  github repo (or to the wiki section of any existing repo). Now you can write your wikidocs
  about your project in the same place you write the code!
- Some good html styling for turning your Vimwiki into static HTML if you wish
- FZF integration across both zsh and vim
- A great LS_COLORS scheme to make terminal sessions much easier to read (covers \*nix/Mac/PC)
- Using Dotbare allows you to sync changes from any machine that this repo is installed on.

# This all seemed to work fine but now my tab completion is painfully slow!

See [Known Issues](#known-issues) below for a possible fix.

# Prerequisites

I have tried to make as much of this functionality work out of the box as possible. However, this
config requires that you have the following already installed (TBD: a script to automatically
install all of these for you). **It is important to have these installed before you use dotbare to
load the custom configuration files in this repo!** If not, the setup scripts for the programs
below will overwrite the dotfiles.

- [Dotbare](https://github.com/kazhala/dotbare): This is used to bootstrap this repo and put
  everything in the proper place.
- [Zsh](https://www.zsh.org/): ZSH shell (On Mac, this is the default shell so
  no need to install)
- [OhMyZsh](https://ohmyz.sh/): Zsh customization & plugins
- [EverVim](https://github.com/LER0ever/EverVim): Vim distro prepackaged with
  several customizations & plugins. **NOTE**: if you get errors installing this
  with NeoVim, delete .Evervim and .Evervim.vimrc and try reinstalling with Vim.
  You can then use NeoVim as normal.
- [Git](https://git-scm.com/): You probably wouldn't be reading this right now if you aren't already
  using Git.

** FZF may be temporararily required as many of the zstyles use it in .zshrc**.
Once these are changed to load conditionally only if fzf is installed, then this
requirement will be removed.

- [fzf](https://github.com/junegunn/fzf): fuzzy find engine

If using NeoVim, the following NeoVim-only packages will be automatically installed:

- [Conqueror of Completion \(COC\)](https://github.com/neoclide/coc.nvim): Code completion &
  language server
- [Vista](https://github.com/liuchengxu/vista.vim): Better replacement for TagBar in Vim (this is
  almost essential for any Typescript development; even with the updated .ctags files in this
  repo, Tagbar doesn't work well for .ts and .tsx files)

If you can't install/don't want to use NeoVim then instead you will use:

- [YouCompleteMe](https://ycm-core.github.io/YouCompleteMe/): Code completion engine.

See installation instructions below for how to switch to YouCompleteMe if using Vim.

## Optional (but recommended)

In most cases you can install these programs manually either before or after using dotbare to update
your dotfiles. However if you plan to use NeoVim (which you probably should), it is strongly
recommended to install that now. Vim and NeoVim store things such as edit history differently, so
you end up having to do a lot of manual cleanup if you want to switch later on.

### Vim Related

- [NeoVim](https://neovim.io/). **Highly Recommended**. A much more modern implementation of
  Vim with many more plugins available. If installed, also use the following NeoVim-specific plugins:
  - [pynvim](https://github.com/neovim/pynvim): Supports many NeoVim-only plugins.
- [Vimwiki Markdown](https://pypi.org/project/vimwiki-markdown/): Convert
  Vimwiki to HTML
- [Dark VimWiki Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template):
  Template for Vimwiki HTML formatting. Download the files in the repo -
  they will be used in the installation below.

### Shell- or Shell+Vim-Related

#### Essential

While technically not required, the following are plugins that I use so frequently
that I couldn't imagine a shell without them.

- [The Silver Searcher](https://geoff.greer.fm/ag/): fast drop-in replacement for ack.
  Not only does this replace find/grep in your shell in a much more user-friendly
  way, but it allows you to type `:AG yoursearchterm` in Vim to search for that text
  anywhere in your project.
- [fzf](https://github.com/junegunn/fzf): fuzzy find engine.
  This is used for fuzzy searching in the shell, and also has a plugin for Vim that
  allows you to search through your project files. It is _incredibly_ powerful, and
  I highly recommend reading the documentation to see all of the features it has.
- [bat](https://github.com/sharkdp/bat): replacement for cat with code highlighting, integration.
  The .zshrc in this repo will use it for file previewing as well from the
  command line.

#### Other

- [GNU Coreutils](https://www.gnu.org/software/coreutils/): Better version of core Unix utilities.
  These are probably pre-installed on Linux machines; on Macs you need to install them with
  `brew install coreutils`.
- [eza](https://github.com/eza-community/eza): replacement for ls with more features
- [chafa](): terminal-based image viewer
- [fd](https://github.com/sharkdp/fd): fast replacement for find (integrates seamlessly with fzf)
  with fzf, and more
- [bat-extras](https://github.com/eth-p/bat-extras): extend functionality of bat to apply to pdfs,
  word docs, etc., as well as integration with grep, man, and more
- [poppler](https://poppler.freedesktop.org/): pdf rendering tools. Used with bat-extras to display
  pdfs on the command line. Can be installed via homebrew
- [lesspipe](https://github.com/wofr06/lesspipe): like batpipe this extends the functionality of
  less to read different doc types. If bat-extras is installed this is mostly superfluous,
  however it does add a useful shell tab completion where you can list all the files inside an
  archive as you are typing it (ex: `bat myzipfile.zip<TAB>` brings up somebinary.exe and
  readme.txt; now you can use tab completion to make that `bat myzipfile.zip/readme.txt)`)
- [universal-ctags](https://ctags.io/): creates tags used by vim for code
  navigation (may work with exuberant ctags but unsure)
- [LS COLORS PROFILE](https://github.com/trapd00r/LS_COLORS/blob/master/LS_COLORS): a good set of custom colors for use with LS.
  Note that these dotfiles will already make ZSH use that color scheme; you only need this repo if you want to modify anything.

### Development Tools

- [asdf](https://asdf-vm.com/): The best multi-language version manager
- [git-delta](https://github.com/dandavison/delta): easier to understand command line diffs
- [DiffMerge](https://sourcegear.com/diffmerge/): Git diff/merge tool
  (however see note below if you do not install it)

### Specific programs with helpers

These programs have shortcuts you can read about in .zshrc. Only install them if you need them
(nothing will break if you don't).

- [SnowSQL](https://docs.snowflake.com/en/user-guide/snowsql): CLI for Snowflake DB
- [ftcbz](https://pypi.org/project/ftcbz/): tool for batch converting .cbr files to .cbz

# Installation

1. Install all of the prerequisites above. For now you must do this manually; in the future I hope to
   have a script to automate the process.

2. Install dotbare according to the way you wish to manage package installation. See
   (https://github.com/kazhala/dotbare#install) for details. NOTE: If you aren't able to push changes
   back to the dotfiles repo due to a github auth error, see notes below in Troubleshooting.

3. Add the following two variables to your .zshrc file:

```bash
export DOTBARE_DIR="$HOME/.dotbare"
export DOTBARE_TREE="$HOME"
```

4. Install everything in this repo to the new environment with:
   `dotbare finit -u [url of this repo]`

5. In .zshrc, find the line with all of the plugins it will install. Manually install each one or
   remove the ones you don't need.

6. Also in .zshrc, replace \$HOME and \$EMAIL with your information. This is used for Git and
   elsewhere.

7. EverVim uses [Vim Plug](https://github.com/junegunn/vim-plug) as
   its plugin manager. To install the plugins included here, open a vim session
   and type the following two commands in normal mode:

- `:PlugInstall`
- `:PlugClean!`

8. Only needed if using Vim instead of NeoVim: Open .EverVim.bundles and comment or uncomment
   plugins according to the directions in that file.

# Configuration

With the exception of CoC, after following the instructions above, everything should work out of the box
(see 'Vim' below for instructions). Any further configuration is optional. Changes to ZSH
functionality is controlled through .zshrc as normal.

Vim functionality, however, is controlled by .EverVim.vimrc and .EverVim.vimrc.after (the difference
between the two .vimrc files is for things that should load either before or after EverVim sets up
all its plugins, key mappings, etc. - basically if you want to override anything in EverVim's settings,
put in in the .after file). See the next section for details.

The default setup in .EverVim.bundles assumes that you have installed NeoVim; if you weren't able to
do that, you will need to manually edit that file to comment/uncomment code to get rid of plugins
that only work with NeoVim and replace them with their Vim equivalents.

## Vim

With the rare exception of some plugin configuration variables (see next
paragraph), **all Vim customization should be added to .Evervim.vimrc**.
Standard .vimrc is not read by EverVim! If using NeoVim then you can
make updates as usual to ~/.config/init.vim; however note that installing the
files in this repo _will_ overwrite your existing one. So if you wish to
keep anything from your existing NeoVim config, copy it before installing this!

Most configuration for Vim can be handled by updating .Evervim.vimrc as you
would normally do with a .vimrc file. However, all of this configuration is
loaded _before_ EverVim performs its own setup - meaning that it may override
some values you have set in .EverVim.vimrc. If setting a variable in that file
doesn't seem to work, that is probably the reason why (you can check for this
explicitly by adding your variable to .EverVim.vimrc and then in a vim session
type `:echo <variable>` - if the value isn't what you set, then EverVim has
hijacked it).

EverVim does not supply a way to override this behavior, so I have added the
file .EverVim.vimrc.after to this project. Any variables added here will take
precedence over the values that EverVim has set. In general it's a good idea
to keep most of your configuration in .EverVim.vimrc so it's all in one place;
only add variables here that need to be here.

### CoC setup

The settings for CoC have several customizations built in for common languages.
If you do not use these languages, then you do not need the customizations from
this repo. If you do use any of them, you will need to install the relevant
ones for you from the following list of CoC plugins. To do this, simply open an
nvim session and type `:CocInstall <plugin>` for each.

- coc-prettier: use [Prettier](https://prettier.io/) for auto-formatting code on save
- coc-highlight: highlight all occurrences of the word under the cursor + color codes
- coc-eslint: ESLint support for JS/TS
- coc-tsserver: TypeScript support
- coc-json: JSON support
- coc-pyright: Python support
- coc-jedi: Python support
- coc-rust-analyser: Rust support

## vimwiki

The current configuration uses the [Dark Vimwiki HTML
Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template). In order for
this to work, after the wiki is generated you need to manually copy the
contents of the `wiki_html` folder to `~/Downloads/vimwiki_html` (or wherever
you have configured your vimwiki files to live if you changed that).

Vimwiki is configured in `.Evervim.vimrc`. If you wish to change the path
where the vimwiki files are located or disable/change this template, you can do
so there.

## Git Merge

This config is set up to use [DiffMerge](https://sourcegear.com/diffmerge/) as
its tool for both Git Diffs and Git merges. If it is installed locally then
following the instructions above will configure this as well. If this is not
the desired tool, then .gitconfig can be modified accordingly.

Almost everything here should work from a remote terminal session except for
using DiffMerge since it's a graphical tool. In that case, you still have the
option of using vimdiff, which is built in to vim: `gdtlvim <file1> <file2>`
for diffing, and `gmtlvim` for merging.

# Usage

Several customizations have been made to .zshrc and .Evervim.vimrc;
those two files are well commented and should indicate all of the existing
customizations. Here are a few important ones:

- Vim plus the slew of plugins here add a tremendous number of shortcuts.  
  Making things more complex, the available shortcuts may change depending on
  what is going on in your current Vim session. I have added the `ListShortcuts`
  command which will open a new vsplit that displays all of the currently
  available shortcuts plus the location where it is set from (in case you want
  to make any modifications). For further convenience, you can pull this up at
  any time by typing `<leader>sh`.
- Vim's built-in pager is terrible, and there isn't a way to change it. When
  a Vim command returns a long list, this means there isn't a way to use `less`
  to search the contents. Instead of running your command directly, you can
  run `:Redir <command>` and the output will be displayed in a new vsplit.
- The [vim-startify](https://github.com/mhinz/vim-startify) plugin adds a
  useful start page that is shown when simply typing `vim`. In addition to the
  out-of-the-box functionality, it has been modified to show any files that
  were bookmarked in NERDTree, and any uncommited/untracked files in the
  current git project. The docs at the plugin wiki show how to create any
  other customizations you'd like.
- vimwiki files are saved in `$HOME/Documents`, as this will automatically sync
  their contents across all your Macs if you use iCloud sharing (and it's a dir
  that exists on Linux and Windows as well). You can change this in .Evervim.vimrc.
- Support for `.tsx` Typescript files has been added to Tagbar. However if NeoVim
  is available, the Vista plugin is far superior for TS development.
- bat is an amazing replacement for cat. It adds line numbering, syntax highlighting,
  navigation and more.
- fzf is _incredibly_ powerful, both for shell integration as well as inside Vim.
  There are many tutorials for it available online. It uses bat for file previews
  if bat is installed.

## Known Issues

- Sometimes tab completion can get painfully slow (requiring a ctrl-c to exit it)
  or starts exhibiting strange behavior. If this occurs, running the command
  `rebuild_compinit` might fix it. This simply rebuilds the cache that is used for
  tab completion, which can sometimes get corrupted or outdated.

## Creating Updates

NOTE: On some installs, you won't be able to push updates back to GitHub until you update your GitHub credentials inside of dotbare.  To do this:

  1. Create a new SSH keypair for GitHub.  You can either do "github auth login" which will 
  handle the setup for you, or you can follow one of the many online guides for setting 
  up an ssh key to GitHub.
  2. cd to ~/.dotbare and type the following: 
  `git remote set-url origin git@github.com:USERNAME/REPO.git.`  
  If you don't do this **you will not be able to push any changes**.

dotbare automatically tracks any changes to files that are already included in this repo. After you
have made any changes, you can push them using normal git syntax (git add, commit, push, etc.) just
by typing `dotbare` instead of `git` (ex: `dotbare add .gitconfig`). Adding new dotfiles is
_usually_ as simple as doing `dotbare add [filename]`, however see caveats below about adding files
that live inside of their own git repos (such as 3rd party customizations you download).

## Caveats

- Dotbare is a fairly simplistic tool, which is both good and bad. It is very easy to use and
  manage, but it also does't have a lot of features such as allowing for different dotfile
  profiles to be conditionally installed. A more complex setup could use a tool like
  [Chezmoi](https://www.chezmoi.io/) instead.
- Under the hood, Dotbare (and most similar tools) use Github repos for maintaining dotfile
  versioning and easy deployment to different machiness. This uses a common pattern of creating a
  'bare' git repo on your machine that tracks everything under \$HOME that you explicitly add
  (ignoring any other files in your home directory). While this is a great pattern that removes the
  need to do complex symlinking of files all over the place, it comes with the unfortunate side
  effect that any files you want to track inside git modules that you have checked out in
  your \$HOME directory can't be easily added to this repo (since git sees them as belonging to a
  different repo). See below for a workaround.

### Workaround for tracking files inside git repositories

In some public Git projects, the instructions basically say "check out this module, then modify file
XZY to your needs" (EverVim does this all over the place, since you need to customize it the same
way you would customize any Vim setup). However this prevents you from checking _just_ those
changes into GitHub; git won't allow you to check them in individually (since it sees them as
belonging to the repo under which the files exist), and you can't add them as submodules unless you
want to add the whole project as a submodule.

While there may be some elegant submodule-based approach for handling this, I haven't yet been able
to figure it out. Consequently, the steps below will show you how to check in any such files that
aren't already in this repo.

### How will I know when I need to do this?

It isn't always obvious that this is the case, as modules contain submodules contain submodules
contain turtles all the way down. What will happen is you will try to add a file to the repo with
dotbare, and then when you run `dotbare status` you won't see the file show up as staged (you didn't
get any error messages when you tried to add it, though). This most likely means the file is
'protected' by being inside an existing git project.

### Steps to Fix

Before doing this, be aware that the steps below remove any of the git modules in question from
being able to track their origins! This means you can't pull updates, nor can you write any changes
to the remote repo. If you really need to do this in the future, you can temporarily reverse the
steps below, pull changes, and then repeate them.

1. Look at every folder in the directory tree leading up to the file in question.
2. At each level, move any `.git` folder to `.not-git`.
3. At each level, move any `.gitignore` to `.gitignore.old`.
4. Finally, add the file to this repo with `dotbare add [filename]`. It should now work.

# TODO

- Figure out how to automatically export color presets from iTerm

# Reference

ctags and the Vim Tagbar plugin have poor support for .tsx files.
Installing this package should make this work better with no additional
configuration required. This gist was used as reference for the ctags
customization in /.ctags.d/:
[https://gist.github.com/romgrk/](https://gist.github.com/romgrk/)
