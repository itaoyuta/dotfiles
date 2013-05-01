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



"vimプラグイン等、読み込み指定
set runtimepath+=~/.vim/vimfiles/
"----------------------------------------------------
"" neobundle.vim
"----------------------------------------------------
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"利用中のプラグインをBundle
"githubにあるプラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "Shougo/unite.vim"
NeoBundle "tsukkee/unite-help"
NeoBundle "Shougo/neocomplcache"
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/vimshell"
NeoBundle "Shougo/vimproc"
NeoBundle "thinca/vim-qfreplace"
NeoBundle "thinca/vim-quickrun"
NeoBundle "thinca/vim-ref"
NeoBundle "mattn/zencoding-vim"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "jimsei/winresizer"
"NeoBundle "git://gist.github.com/rcmachado/256840" "html5のシンタックス
NeoBundle	"vim-scripts/smarty.vim"
"www.vim.orgにあるプラグイン
NeoBundle "CSApprox" 
NeoBundle "autodate.vim"
"それ以外にあるgitリポジトリにあるプラグイン


NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

filetype plugin indent on




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
