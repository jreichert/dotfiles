" Modeline and Notes {
"   EverVim is a modern & powerful vim distribution
"   Repo URL: https://github.com/LER0ever/EverVim
"   Made by [LER0ever](https://github.com/LER0ever)
"   Licensed under
"       * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE.md) or http://www.apache.org/licenses/LICENSE-2.0)
" }
" EverVim options {
" Disable folding
"   let g:evervim_disable_folding=1
"
" EverVim Bundle Groups
" Bundle Group name is just folders under ~/.EverVim/plugins
" Below is the default config, uncomment and make your own
"   let g:evervim_bundle_groups=['general', 'appearance', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'typescript', 'html', 'css', 'misc', 'go', 'rust', 'cpp', 'lua']
let g:evervim_bundle_groups=[
            \'general',
            \'appearance',
            \'writing',
            \'youcompleteme',
            \'programming',
            \'python',
            \'javascript',
            \'java',
            \'typescript',
            \'html',
            \'css',
            \'misc',
            \'go',
            \'rust',
            \'cpp',
            \'lua',
            \'php',
            \'ruby',
            \'swift'
            \]

" Determine whether the current session supports full gui colors or only
" console colors; note that iTerm2 will use gtermfg/bg instead of
" ctermfg/bg even though it's not really a gui app.
if $TERM =~ '^\(rxvt\                                                                                                                                                                          screen\  interix\  putty\)\(-.*\)\?$'
    set notermguicolors
elseif $TERM =~ '^\(tmux\                                                                                                                                                                      iterm\   vte\      gnome\)\(-.*\)\?$'
    set termguicolors
elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
    if $LC_TERMINAL == 'iTerm2'
        set termguicolors
    elseif $XTERM_VERSION != ''
        set termguicolors
    elseif $KONSOLE_PROFILE_NAME != ''
        set termguicolors
    elseif $VTE_VERSION != ''
        set termguicolors
    else
        set notermguicolors
    endif
endif

" Color Theme
" Use :Colors for a list of available colorschemes
"let g:evervim_color_theme="0x7A69_dark"
"let g:evervim_color_theme="solarized8_dark_high"
let g:evervim_color_theme="solarized8_high"
let g:evervim_airline_theme="solarized_flood"
"   let g:evervim_light_background = 1

" Customize Patched Font
" Pick one at https://github.com/ryanoasis/nerd-fonts
" By default it's "Knack Nerd Font" on Unix and "Knack NF" on Windows
"   let g:evervim_font="Knack Nerd Font"
"let g:evervim_font="FuraCode Nerd Font Mono"
let g:evervim_font="Agave Nerd Font Mono"
"   let g:evervim_font_size="12"

" Disable Patched Font
"   let g:evervim_no_patched_fonts = 1

" Override Bundle Configuration
" You can add additional plugins, or disable a set of plugins instead of
" adding/removing a whole bundle
" Simply uncomment the following line and add remove plugins in the
" ~/.EverVim.bundles file using `Plug` and `UnPlug` commands
let g:override_evervim_bundles = 1

" in ~/.EverVim.bundles,
"   Plug 'Someone/AwesomePlugin'
"   UnPlug 'Someone/PluginToDisable'

" Automatically changing to open file directory
" May cause airline to misbehave
"   let g:evervim_autochdir = 1

" Default statusline is vim-airline
" You can change to the more configurable lightline.vim by uncomment the following
"   let g:evervim_use_lightline = 1

" Header constants for generating and updating the comment header
let g:header_field_author = $NAME
let g:header_field_author_email = $EMAIL

" Startup Screen
" You can customize the welcome message by changing the following line
"   let g:evervim_welcome_message = "Code your life with EverVim!"

" Leader keys
let g:evervim_leader=','
let g:evervim_localleader='\\'

" Restore cursor
" Automatically restore your cursor to the place you left
" Disable by uncommenting the following line.
"   let g:evervim_no_restore_cursor = 1

" Linting engine
" Use ALE by default. But if you are using an older version
" of vim or experiencing issues with ALE, you can switch to
" Syntastic by uncommenting the following line
"   let g:evervim_use_syntastic = 1

" Fuzzy Finder
" By default, CtrlP is used on Windows and FZF.vim on Unix
" Fall back to CtrlP by uncommenting the following line (Unix only)
"   let g:evervim_use_ctrlp = 1

" Enable smooth scrolling
" Use physics-based smooth scrolling for half-page/full-page scrolling
" Friction and air-drag can be override here
"   let g:evervim_smooth_scrolling = 1

" Enable transparent background on terminal vim/nvim
"   let g:evervim_transparent_bg = 1

" Disable easier moving in tabs and windows
" only if you need <C-J> for jumping or other conflicting plugin
" keybinding
"   let g:evervim_no_easyWindows = 1

" Disable wrap relative motion for start/end line motions
"   let g:evervim_no_wrapRelMotion = 1

" Disable fast tab navigation
"   let g:evervim_no_fastTabs = 1

" Enable NerdTree Sync across tabs
" Synchronize view and focus between different tabs
"   let g:evervim_nerdtree_tabs_sync = 1

" Clear search highlighting
" let g:evervim_clear_search_highlight = 0

" Disable neosnippet expansion
" This maps over <C-k> and does some Supertab
" emulation with snippets
"   let g:evervim_no_neosnippet_expand = 1

" Disable whitespace stripping
"   let g:evervim_keep_trailing_whitespace = 1

" vim files directory
"   let g:evervim_consolidated_directory = <full path to desired directory>
"   eg: let g:evervim_consolidated_directory = $HOME . '/.vim/'
" This makes the completion popup strictly passive.
" Keypresses acts normally. <ESC> takes you of insert mode, words don't
" automatically complete, pressing <CR> inserts a newline, etc. Iff the
" menu is open, tab will cycle through it. If a snippet is selected, <C-k>
" expands it and jumps between fields.
"   let g:evervim_noninvasive_completion = 1

" Don't turn conceallevel or concealcursor
"   let g:evervim_no_conceal = 1

" Disable  omni complete
"   let g:evervim_no_omni_complete = 1

" Prefer indentguides
"   let g:evervim_use_indentguides = 1

" Prefer Neoformat over vim-autoformat
"   let g:evervim_use_neoformat = 1

" Disable autoformat on write
" You can still use <Leader>fm to manually format the file
let g:evervim_no_autoformat = 1

" Hybrid Linenumber
" Show absolute line number for current line and relative
" for the rest
"   let g:evervim_hybrid_linenumber = 1

" 80 Column Warning
" Shows a magenta line at column 81 only for those lines that exceeds 80
let g:evervim_80_column_warning = 1

" Minimap Support
" Shows a minimap on the right hand side, need has_python
"   let g:evervim_minimap

" Don't create default mappings for multicursors
" See :help multiple-cursors-mappings
"   let g:multi_cursor_use_default_mapping=0
"   let g:multi_cursor_next_key='<C-n>'
"   let g:multi_cursor_prev_key='<C-p>'
"   let g:multi_cursor_skip_key='<C-x>'
"   let g:multi_cursor_quit_key='<Esc>'

" Require a special keypress to enter multiple cursors mode
"   let g:multi_cursor_start_key='+'

" Mappings for editing/applying evervim config
let g:evervim_edit_config_mapping='<leader>ec'
let g:evervim_apply_config_mapping='<leader>ac'

" #########  PERSONAL CUSTOMIZATIONS #############
"
" Set shell for terminal emulator
set shell=/bin/zsh
set textwidth=100
" set textwidth=0
" set wrapmargin=0
" set wrap
" set linebreak " (optional - breaks by word rather than character)

set updatetime=300
set signcolumn=yes
set switchbuf=useopen

" Add support for fzf
set rtp+=/usr/local/opt/fzf

" Turn of highlighting from last search with an extra <CR>.
" Does not currently work; the "wildfire fuel" plugin is highlighting <CR>
" to do a visual select of the current block. UnPlug that plugin in
" .EverVim.bundles and uncomment the next two lines if desired.
" nnoremap <silent> <CR> :nohlsearch<BAR>:echo<CR>
"hnnoremap <silent> <Leader>h :nohlsearch<BAR>:echo<CR>

" shortcut to completely close the current buffer;
" NOTE: this kills Vim if used with NERDTree.  For that, use the bufkil plugin
" instead (:BD)
nnoremap <Leader>bw :bwipeout<CR>

" open the quickfix window with height of 4
nnoremap <Leader>qo :copen 4<CR>

" close the quickfix window
nnoremap <Leader>qc :cclose<CR>
function s:format_shortcuts()
    "ListShortcuts

    execute Redir echo "hello"
    " join every other line
    "%normal J

    " delete all lines not containing a line number
    " TODO: there are a small # of shortcuts at the end of the doc that this gets rid of.  Figure out what they are and where they come from.
    "silent! g!/line/de

    " for shortcuts with unknown mode, use '?'
    "silent! %s/^ /?/e

    " remove all unmapped plugin shortcuts
    "silent! g/^[n,v,x,o,s,?, ]\{3\}<Plug>/de

    " Normalize formatting of remaining lines; relies on using '\\\\\'
    " as the column separator, so assumes that isn't present in any table content
    "silent! %s/^\([n,v,x,o,s,?, ]\{3\}\)\(\S*\)\s* \(.*\) Last set from \(.*\) line \(.*\)/\1\\\\\\\\\\\2\\\\\\\\\\\3\\\\\\\\\\\4\\\\\\\\\\\5/e

    " Add header
    "normal ggOMODE\\\\\\\\\\SHORTCUT\\\\\\\\\\COMMAND\\\\\\\\\\FILE\\\\\\\\\\LINE

    " Escape any pipe characters (needed for vim-table-mode plugin)
    "silent! %s/|/\\|/ge

    " Tablize
    "silent! %Tableize/\\\\\\\\\\

    " Undo previous escaping
    "%s/\\|/ \|/ge
    "silent! %s/\\|/ \|/g

    " Return to top
    "normal gg
endfunction
command FormatShortcuts :call s:format_shortcuts()<CR>
" command FormatShortcuts Redir verbose map

" NERDTree
"nnoremap <Leader>na <plug>NERDTreeTabsToggle<CR>
" nnoremap <Leader>na :NERDTreeTabsToggle<CR>
map <C-e> <plug>NERDTreeTabsToggle<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" The Silver Searcher: replace ack with ag if available
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" ########## PERSONAL FUNCTIONS ########## "
" Show the output of any command in a new vsplit
function! Redir(cmd, rng, start, end)
    for win in range(1, winnr('$'))
        if getwinvar(win, 'scratch')
            execute win . 'windo close'
        endif
    endfor
    if a:cmd =~ '^!'
        let cmd = a:cmd =~' %'
                    \ ? matchstr(substitute(a:cmd, ' %', ' ' . shellescape(escape(expand('%:p'), '\')), ''), '^!\zs.*')
                    \ : matchstr(a:cmd, '^!\zs.*')
        if a:rng == 0
            let output = systemlist(cmd)
        else
            let joined_lines = join(getline(a:start, a:end), '\n')
            let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
            let output = systemlist(cmd . " <<< $" . cleaned_lines)
        endif
    else
        redir => output
        execute a:cmd
        redir END
        let output = split(output, "\n")
    endif
    vnew
    let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, output)
endfunction

" Uncomment one of the two versions of the command below to control behavior of
" Redir defined above.  See comments for each.
"
" This command definition doesn't include -bar, so that it is possible to use double quotes in external commands.
" Side effect: Vim commands can't be "chained".
command! -nargs=1 -complete=command -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

" This command definition includes -bar, so that it is possible to "chain"
" Vim commands. Side effect: double quotes can't be used in external commands
"commad! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

" ########## VIMWIKI ############## "
" save this in ~/Documents so it is accessible from other machines
" Use Dark Vimwiki HTML Template
" https://github.com/rahul13ramesh/Dark-Vimwiki-Template
" TODO: I couldn't figure out a better way to do this, so I'm
" setting/unsetting the variable below in after/ftplugin/vimwiki.vim
"  let g:vim_markdown_folding_disabled=1
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md', 'auto_toc': 1, 'auto_tags': 1, 'automatic_nested_syntaxes': 1,
            \ 'custom_wiki2html': '/Users/jake/.asdf/installs/python/3.10.10/lib/python3.10/site-packages/vimwiki_markdown.py',
            \ 'template_path': '~/.EverVim/wiki/templates',
            \ 'template_default': 'def_template',
            \ 'links_space_char': '-',
            \ 'template_ext': '.html'}]
" let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
"             \ 'template_path': '~/.EverVim/wiki/templates',
"             \ 'template_default': 'def_template',
"             \ 'template_ext': '.html'}]

let g:vimwiki_markdown_link_ext=0
"let g:vimwiki_ext2syntax={'.md': 'markdown'}
"let g:vimwiki_filetypes = ['markdown']
"let g:vimwiki_custom_wiki2html='~/.EverVim/custom_scripts/pandoc_md2html.sh'
" add the pre tag for inserting code snippets
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'
" Use the block below to use Markdown for the vimwiki syntax;
" Note the path variable, make sure it is set correctly.
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"     \ 'syntax': 'markdown', 'ext': '.md'}]

" Make folding in Vimwiki rational
augroup VimrcAuGroup
    autocmd!
    autocmd FileType vimwiki setlocal foldmethod=expr |
                \ setlocal foldenable
augroup END

" ####### STARTIFY ######## "
" pull in a custom ASCII art header if one exists
" source ~/.vimrc.startify-logo
"let g:startify_custom_header =
"             \ startify#pad(readfile('/Users/Jake/Downlaods/banner.txt'))

" add any bookmarks here that you want in Startify
let g:startify_bookmarks = [
            \ { 'w': '~/Documents/vimwiki/index.wiki' },
            \ { 'b': '~/.EverVim.bundles' },
            \ { 'a': '~/.EverVim.vimrc.after' }
            \ ]

" add any programs you wish to run here.  Shell programs can be run by
" prefixing the command with '!'
function s:startify_functions()
    return [
                \ { 'line': 'Show shortcuts', 'cmd': 'ListShortcuts' },
                \ { 'line': 'Install or Update VIM plugins', 'cmd': 'PlugInstall' },
                \ { 'line': 'Play Zork 285', 'cmd': '!frotz ~/Downloads/zork_285.z5' },
                \  ]
endfunction

function Get_shortcuts()
    let shortcuts = "n  ,nt  NERDTree"
    let mode = matchstr(shortcuts, ' *.* *')
    "let mode = matchstr(shortcuts, ' *.* *')
    return mode
endfunction

" --- Git functions for Startify: the next 2 functions are used to show 
"    modified and untracked files in the current repo, respectively

" returns all modified files of the current git repo
" Note: `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Read ~/.NERDTreeBookmarks file and takes its second column;
" used to build Startify links below
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': function('s:startify_functions'), 'header': ['  Programs'] },
            \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
            \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
            \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

" ######## VISTA - Only for NeoVim ########
" ###  This is a better replacement for TagBar ###
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1


" ######## TAGBAR ######### "
" enables tsx support in Tagbar
let g:tagbar_type_typescriptreact = {
            \ 'ctagstype': 'tsx',
            \ 'kinds': [
            \ 'c:class',
            \ 'n:namespace',
            \ 'f:function',
            \ 'G:generator',
            \ 'v:variable',
            \ 'm:method',
            \ 'p:property',
            \ 'i:interface',
            \ 'g:enum',
            \ 't:type',
            \ 'a:alias',
            \ ],
            \'sro': '.',
            \ 'kind2scope' : {
            \ 'c' : 'class',
            \ 'n' : 'namespace',
            \ 'i' : 'interface',
            \ 'f' : 'function',
            \ 'G' : 'generator',
            \ 'm' : 'method',
            \ 'p' : 'property',
            \},
            \ }

" Enable Tagbar navigation for vimwiki;
" requires the script vwtags.py to be installed
let g:tagbar_type_vimwiki = {
            \   'ctagstype':'vimwiki'
            \ , 'kinds':['h:header']
            \ , 'sro':'&&&'
            \ , 'kind2scope':{'h':'header'}
            \ , 'sort':0
            \ , 'ctagsbin':'~/.EverVim/custom_scripts/vwtags.py'
            \ , 'ctagsargs': 'default'
            \ }
" }
 autocmd CursorHold * silent call CocActionAsync('highlight')

" ALE plugin config - currently not working (although CoC does most of what ALE
" does)
 let g:ale_fixers = {
        \    'javascript': [
        \    'importjs',
             \],
        \}
