set textwidth=80

augroup ResolveConflicts

    au BufEnter <buffer> setlocal tw=80
    " There must be a better way to do this
    autocmd BufEnter <buffer> call Clobber_indentline()
    fun Clobber_indentline()
        setlocal cocu=cn
        if exists('g:indentLine_setConceal')
            let g:indentLine_setConcealOldValue = expand('g:indentLine_setConceal')
            let g:indentLine_setConceal = 0
        endif
    endfun
    autocmd BufLeave <buffer> call Unclobber_indentline()
    fun Unclobber_indentline()
        if exists('g:indentLine_setConcealOldValue')
            let g:indentLine_setConceal = g:indentLine_setConcealOldValue
        endif
    endfun
augroup END

augroup FoldingResolveConflicts
    " There must be a better way to do this
    autocmd BufEnter <buffer> call Clobber_indentline_folding()
    fun Clobber_indentline_folding()
        if exists('g:vim_markdown_folding_disabled')
            let g:vim_markdown_folding_disabled_old_value = g:vim_markdown_folding_disabled
        else
            let g:vim_markdown_folding_disabled_old_value = 0
        endif
        let g:vim_markdown_folding_disabled = 1
    endfun
    autocmd BufLeave <buffer> call Unclobber_indentline_folding()
    fun Unclobber_indentline_folding()
        let g:vim_markdown_folding_disabled = g:vim_markdown_folding_disabled_old_value
    endfun
augroup END
