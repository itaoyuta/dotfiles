"set nocompatible
set number
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"

"Tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

"" Vundle
set rtp+=~/.vim/vundle/
call vundle#rc()
filetype plugin on

"利用中のプラグインをBundle
Bundle 'Shougo/neocomplcache'
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle 'ZenCoding.vim'
Bundle "https://github.com/thinca/vim-quickrun.git"

" neocomplacache
let g:neocomplcache_enable_at_startup = 1 "起動時に有効化
" <C-k>にマッピング
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expan)

"文字色
hi Comment ctermfg=3

"zen-coding
let g:user_zen_expandabbr_key='<c-z>'


""pathogen
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
