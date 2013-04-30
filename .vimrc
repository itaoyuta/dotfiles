scriptencoding utf-8
set number
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

"カーソル行をハイライト
set cursorline
"全角スペースを視覚化
augroup higlightIdegtaphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
colorscheme macvim

"Tab
" set expandtab
set smartindent
set ts=2 sw=2 sts=2

set noexpandtab

"javascript実行環境をnodejsへ
let $JS_CMD='node'

"map関連
"Escの2回押しでハイライト消去
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"VimFilerの設定
nmap <C-A><C-A> :VimFiler -split -simple -winwidth=35 -no-quit<CR><ESC>
"vimの裏がみたい
nmap <C-K><C-K> :set transparency=80<CR><ESC>
"vimの裏がみたいをもどしたい
nmap <C-J><C-J> :set transparency=6<CR><ESC>



"Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on
"利用中のプラグインをBundle
Bundle 'gmarik/vundle'
"githubにあるプラグイン
Bundle "Shougo/unite.vim"
Bundle "Shougo/neocomplcache"
Bundle "https://github.com/Shougo/neosnippet"
Bundle "git://github.com/Shougo/vimfiler"
Bundle "https://github.com/Shougo/vimshell.git"
Bundle "https://github.com/Shougo/vimproc"
Bundle "https://github.com/tsukkee/unite-help.git"
Bundle "https://github.com/thinca/vim-quickrun.git"
Bundle "http://github.com/thinca/vim-ref.git"
Bundle "git://github.com/thinca/vim-qfreplace"
"Bundle "git://github.com/Sixeight/unite-grep.git"
Bundle "ZenCoding.vim"
Bundle "tomtom/tcomment_vim"
Bundle "git://gist.github.com/256840.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "https://github.com/jimsei/winresizer"
"www.vim.orgにあるプラグイン
Bundle "CSApprox" 
"Bundle "grep.vim"
Bundle "autodate.vim"
"Bundle "DirDiff.vim"
Bundle "actionscript.vim"
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

"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 500


"vimfiler
"設定ファイルを書き出すディレクトリ
let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"ダブルクリックで起動するシステムを設定
call vimfiler#set_execute_file('html','com.google.chrome')

"vimShell
"
"
"設定ファイルを書き出すディレクトリ
let g:vimshell_temporary_directory = '~/.vim/data/.vimshell'
let g:VimShell_EnableInteractive = 1



"html5-ruby
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" neocomplacache(neosnippet)
"設定ファイルを書き出すディレクトリ
let g:neocomplcache_temporary_dir = '~/.vim/data/.neocon'
" <C-k> にマッピング
let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
set completeopt-=preview

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




" 関連付け
" au BufNewFile,BufRead *.tpl set filetype=tpl
au BufNewFile,BufRead *.tpl set filetype=html




