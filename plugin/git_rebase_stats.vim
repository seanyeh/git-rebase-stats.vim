com! ToggleGitRebaseStats call git_rebase_stats#ToggleGitRebaseStats()

augroup git_rebase_stats
    autocmd!
    au Syntax gitrebase call git_rebase_stats#Setup()
augroup END
