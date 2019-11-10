# git-rebase-stats.vim

Show git commit stats during an interactive rebase.

## Usage

When in an interactive rebase (`git rebase --interactive`), call `:ToggleGitRebaseStats` to show/hide git commit stats. You can also map this to a keyboard shortcut, for example:

```
" <leader>g to show/hide commit stats
noremap <leader>g :ToggleGitRebaseStats<CR>
```

Commit stats are hidden by default. If you wish to have commit stats shown automatically during an interactive rebase, add the following to your `~/.vimrc`:

`let g:git_rebase_stats_enable = 1`

## Installation

Install with your favorite package manager.

for [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'seanyeh/git-rebase-stats.vim'
```

## License

MIT
