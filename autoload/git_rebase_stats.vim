if !exists('g:git_rebase_stats_enable')
    let g:git_rebase_stats_enable = 0
endif

function! s:GetCommitStats(commit_sha)
    let output = system('git show --stat --stat-width=60 --format="" '.a:commit_sha)
    let output_lines = split(output, '\n')
    return split(output, '\n')
endfunction

function! s:ShowGitRebaseStats()
    if &filetype != 'gitrebase' || search('^### ', 'wn')
        return
    endif

    call cursor(1, 1)
    while search('^[^#]\S\+', 'Wc') > 0
        let commit_sha = split(getline('.'))[1]
        let commit_diffs = s:GetCommitStats(commit_sha)
        for line in commit_diffs
            call append(line('.'), '### '.line)
            normal! j
        endfor
    endwhile
endfunction

function! s:HideGitRebaseStats()
    if &filetype != 'gitrebase'
        return
    endif

    exe "g/^### /d"
endfunction

function! git_rebase_stats#ToggleGitRebaseStats()
    if &filetype != 'gitrebase'
        return
    endif

    if search('^### ', 'wn')
        call s:HideGitRebaseStats()
    else
        call s:ShowGitRebaseStats()
    endif
endfunction

function! s:SyntaxHighlightGitRebaseStats()
    syn match gitrebaseCommentDiff "^###.*" contains=gitStatPlus,gitStatMinus
    syn match gitStatPlus "\v\+" contained
    syn match gitStatMinus "\v\-" contained

    hi def link gitrebaseCommentDiff Comment
    hi def link gitStatPlus Statement
    hi def link gitStatMinus Special
endfunction

function! git_rebase_stats#Setup()
    call s:SyntaxHighlightGitRebaseStats()

    if g:git_rebase_stats_enable
        call s:ShowGitRebaseStats()
    endif
endfunction
