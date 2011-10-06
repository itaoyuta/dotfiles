"Last Change: 2011/10/06 19:40:03.
"set nocompatible
scriptencoding utf-8
set number
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

"カーソル行をハイライト
set cursorline
"Escの2回押しでハイライト消去
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"全角スペースを視覚化
augroup higlightIdegtaphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme macvim


"Tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on
"利用中のプラグインをBundle
Bundle 'gmarik/vundle'
"githubにあるプラグイン
Bundle "Shougo/neocomplcache"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "ZenCoding.vim"
Bundle "https://github.com/thinca/vim-quickrun.git"
Bundle "Shougo/unite.vim"
Bundle "http://github.com/thinca/vim-ref.git"
Bundle "tomtom/tcomment_vim"
"www.vim.orgにあるプラグイン
Bundle "CSApprox" 
Bundle "grep.vim"
Bundle "autodate.vim"
Bundle "DirDiff.vim"
"Bundle "actionscript.vim"
"それ以外にあるgitリポジトリにあるプラグイン





" neocomplacache
" <C-k> にマッピング
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
"let g:neocomplcache_snippents_dir = '~/.vim/snippets'
let g:neocomplcache_enable_at_startup=1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)




"文字hi Comment ctermfg=3

"zen-coding
let g:user_zen_expandabbr_key='<c-z>'

"ref.vim
let g:ref_phpmanual_path = $HOME.'/Dropbox/Public/manual/phpmanual'

"autodate.vim
let autodate_format="%Y/%m/%d %H:%M:%S"

"asファイルを設定
au BufNewFile,BufRead *.as set ft=actionscript

"テンプレートを読み込む
augroup templateload
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vim/template/skeleton.html
  autocmd BufNewFile *.js 0r ~/.vim/template/skeleton.js
  autocmd BufNewFile *.css 0r ~/.vim/template/skeleton.css
augroup END

