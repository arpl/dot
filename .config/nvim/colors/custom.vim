hi link ALEError ErrorMsg
hi link ALEStyleError ErrorMsg
hi link ALEErrorSign ErrorMsg

hi clear ALEWarningSign
hi clear MatchParen

hi MatchParen ctermfg=226
hi Visual     ctermbg=235
hi Search     ctermfg=226 ctermbg=none
hi Folded     ctermfg=4   ctermbg=none
hi Error cterm=reverse ctermfg=167 ctermbg=235 gui=reverse guifg=#ff4a4a guibg=bg

" {{{ Diff highlighting
hi DiffAdd    ctermfg=233 ctermbg=194
hi DiffChange ctermfg=235 ctermbg=194
hi DiffText   ctermfg=233 ctermbg=43
hi DiffDelete ctermfg=233 ctermbg=115
" }}}
