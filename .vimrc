"Last Change: 2012/12/16 19:35:47.
scriptencoding utf-8
set number
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

"ColorSheme利用
set t_Co=256

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

"javascript実行環境をnodejsへ
let $JS_CMD='node'

"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on
"利用中のプラグインをBundle
Bundle 'gmarik/vundle'
"githubにあるプラグイン
Bundle "Shougo/unite.vim"
Bundle "Shougo/neocomplcache"
Bundle "git://github.com/Shougo/vimfiler"
Bundle "https://github.com/Shougo/vimshell.git"
Bundle "https://github.com/tsukkee/unite-help.git"
Bundle "https://github.com/thinca/vim-quickrun.git"
Bundle "http://github.com/thinca/vim-ref.git"
Bundle "git://github.com/thinca/vim-qfreplace"
Bundle "ZenCoding.vim"
Bundle "tomtom/tcomment_vim"
Bundle "git://gist.github.com/256840.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
"www.vim.orgにあるプラグイン
Bundle "CSApprox" 
Bundle "grep.vim"
Bundle "autodate.vim"
"Bundle "DirDiff.vim"
Bundle "actionscript.vim"
Bundle "sudo.vim"
"それ以外にあるgitリポジトリにあるプラグイン

"unite
"設定ファイルを書き出すディレクトリ
let g:unite_data_directory = '~/.vim/data/.unite'
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"vimfiler
"設定ファイルを書き出すディレクトリ
let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
call vimfiler#set_execute_file('html','com.google.chrome')



"vimShell
"設定ファイルを書き出すディレクトリ
let g:vimshell_temporary_directory = '~/.vim/data/.vimshell'


"html5-ruby
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" neocomplacache
"設定ファイルを書き出すディレクトリ
let g:neocomplcache_temporary_dir = '~/.vim/data/.neocon'
" <C-k> にマッピング
let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"zen-coding
let g:user_zen_expandabbr_key='<c-z>'

"ref.vim
"let g:ref_phpmanual_path = $HOME.'/Dropbox/Public/manual/phpmanual'
let g:ref_phpmanual_path = '/Applications/MAMP/htdocs/Dropbox/Public/manual/phpmanual'


"as
autocmd BufNewFile,BufRead *.as set filetype=actionscript

"autodate.vim
let autodate_format="%Y/%m/%d %H:%M:%S"

"テンプレートを読み込む
augroup templateload
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vim/template/skeleton.html
  autocmd BufNewFile *.js 0r ~/.vim/template/skeleton.js
  autocmd BufNewFile *.css 0r ~/.vim/template/skeleton.css
  autocmd BufNewFile *.php 0r ~/.vim/template/skeleton.php
augroup END

"colorscheme pyte
colorscheme molokai
