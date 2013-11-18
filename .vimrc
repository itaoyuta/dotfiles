scriptencoding utf-8
set guifont=Ricty_for_Powerline:h18



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
" colorscheme macvim

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
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

"vimの裏がみたい
nmap <C-K><C-K> :set transparency=80<CR><ESC>
"vimの裏がみたいをもどしたい
nmap <C-J><C-J> :set transparency=6<CR><ESC>
"<leader>の設定を変更する 
nmap ¥ <leader>
"タブの切り替えを行う
nmap <S-T><S-N> :tabnext<CR><ESC>
nmap <S-T><S-P> :tabprevious<CR><ESC>



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
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "Shougo/unite.vim"
NeoBundle "tsukkee/unite-help"
NeoBundle "kmnk/vim-unite-svn.git"
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neocomplcache"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/vimshell"
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'unix' : 'make -f make_unix.mak',
			\    },
			\ }
NeoBundle "fuenor/qfixgrep"
NeoBundle "thinca/vim-qfreplace"
NeoBundle "thinca/vim-quickrun"
NeoBundle "thinca/vim-ref"
NeoBundle "mattn/emmet-vim"
call neobundle#config('emmet-vim', {
      \ 'autoload' : {
      \   'filetypes' : [
      \     'html',
      \     'haml',
      \     'slim',
      \     'css',
      \   ],
      \ },
      \ })
NeoBundle "mattn/livestyle-vim"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "jimsei/winresizer"
NeoBundle 'tpope/vim-surround'


" if has('gui_running')
	NeoBundle "osyo-manga/unite-airline_themes"
	NeoBundle "bling/vim-airline.git"
	NeoBundle 'alpaca-tc/alpaca_powertabline'
	NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" endif


"NeoBundle "http://www.vim.org/scripts/script.php?script_id=102"
"NeoBundle "git://gist.github.com/rcmachado/256840" "html5のシンタックス
"
"www.vim.orgにあるプラグイン
NeoBundle "CSApprox" 
NeoBundle "autodate.vim"
NeoBundle "nathanaelkane/vim-indent-guides"
"それ以外にあるgitリポジトリにあるプラグイン




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
noremap <C-Y> :Unite directory_mru<CR>
noremap <C-B> :Unite bookmark<CR>
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


"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

 
" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" }}}


"vimfiler
noremap <Leader>vf :VimFiler<CR>
"設定ファイルを書き出すディレクトリ
let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"ダブルクリックで起動するシステムを設定
call vimfiler#set_execute_file('html','com.google.chrome')

"vimShell
"設定ファイルを書き出すディレクトリ
noremap <Leader>vs :VimShell<CR>
let g:vimshell_temporary_directory = '~/.vim/data/.vimshell'
let g:VimShell_EnableInteractive = 1



"html5-ruby
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" neocomplacache(neosnippet)
"設定ファイルを書き出すディレクトリ
let g:neocomplcache_temporary_dir = '~/.vim/data/.neocon'
let g:neocomplcache_auto_completion_start_length = 2
" <C-k> にマッピング
let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-k> <Plug>(neocomplcache_snippets_expand)
set completeopt-=preview
"スニペットが日本語入力の邪魔をするから
nmap <S-T><S-T> :NeoComplCacheToggle<CR>



"dirDiffの設定
let g:DirDiffExcludes = ".svn,*.swp,.DS_Store"

"zencoding
" let g:user_emmet_leader_key = '<C-e>'



"試しに他の人の設定
" let g:AutoComplPop_NotEnableAtStartup = 1
" let g:NeoComplCache_EnableAtStartup = 1
" let g:NeoComplCache_SmartCase = 1
" let g:NeoComplCache_TagsAutoUpdate = 1
" let g:NeoComplCache_EnableInfo = 1
" let g:NeoComplCache_EnableCamelCaseCompletion = 1
" let g:NeoComplCache_MinSyntaxLength = 3
" let g:NeoComplCache_EnableSkipCompletion = 1
" let g:NeoComplCache_SkipInputTime = '0.5'
" inoremap <expr><Up> pumvisible() ? neocomplcache#close_popup()."\<Up>" : "\<Up>"
" inoremap <expr><Down> pumvisible() ? neocomplcache#close_popup()."\<Down>" : "\<Down>"





" vim-airlines
"



if has('gui_running')
	let g:airline_powerline_fonts = 1
	let g:airline_right_sep = ''
	let g:airline_right_sep = ''
else
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_powerline_fonts = 0
endif

let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline#extensions#branch#symbol = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline#extensions#whitespace#symbol = 'Ξ'
let g:airline_theme='light'


"zen-coding
"let g:user_zen_expandabbr_key='<c-z>'

"ref.vim
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


" venus.vim
" テンプレを開く
nnoremap <Leader>g :call VenusSwitchFile("tpl")<CR>
" テンプレ(スマホ)を開く
nnoremap <Leader>s :call VenusSwitchFile("tplSp")<CR>
" コントローラーを開く
nnoremap <Leader>p :call VenusSwitchFile("Controller")<CR>
" インクルードファイルを開く
nnoremap <Leader>i :call VenusSwitchFile("Include")<CR>
" add
" preを開く
nnoremap <Leader>tt :call VenusSwitchFile("tpl_switch_devpre")<CR>


" ラグナの環境を開く
nmap <S-R><S-S> :VimFiler /Users/yito1/Documents/svn/__DEV__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
nmap <S-R><S-G> :VimFiler /Users/yito1/Documents/svn/__DEV__/mragnarok/webapps/mobile/templates<CR><ESC>
" アヴァロンの環境を開く
nmap <S-A><S-S> :VimFiler /Users/yito1/Documents/svn/__DEV__AVALON/mguildbattle/webapps/mobile/templates_html5<CR><ESC>
nmap <S-A><S-G> :VimFiler /Users/yito1/Documents/svn/__DEV__AVALON/mguildbattle/webapps/mobile/templates<CR><ESC>

" クロームリロードショートカット
nmap <S-R><S-R> :ChromeReload<CR><ESC>
" tplのコメント
nmap <S-C><S-C> :call TplComment()<CR>
" sectionのsnip
nmap <S-S><S-S> :call TplSection()<CR>


" " Uniteのkind例
" let read = {
"       \ 'is_selectable' : 1,
"       \ }
" function! diff_dev_pre.func(candidates)
" 	echo "diff_dev_preを作成"
" endfunction
" 
" call unite#custom_action('file', 'diff_dev_pre', diff_dev_pre)
" unlet read
" 

"test
function! MyFuncTest(srcA,srcB)
	echo a:srcA . ' / ' . a:srcB
	" echo a:srcA . ' / ' . a:srcB
endfunction

"アクション
let diff_dev_pre = {'description' : 'devとpreをDirDiff'}
function! diff_dev_pre.func(candidate)
	let path = expand('#:p')
	let vimfiler = vimfiler#get_current_vimfiler()
	let marked_files = vimfiler#get_marked_files()

	let dirA = marked_files[0].action__path
	if empty(dirA)
			let dirA =  [ vimfiler#get_file(cursor_linenr) ]
	endif

	if dirA =~ "DEV"
		let dirB = substitute(dirA, "DEV", "PRE", "") 
	else 
		let dirB = substitute(dirA, "PRE", "DEV", "") 
	endif

	call DirDiff(dirA,dirB)

endfunction

call unite#custom_action('file' , 'diff_dev_pre' , diff_dev_pre)
unlet diff_dev_pre

" Uniteのsorce作り方
" let s:unite_source = {
" \   'name': 'diff_dev_pre',
" \ }
" function! s:unite_source.gather_candidates(args, context)
" 	let hoge = {"val":["aa" , "bb" , "cc"]}
" 	let vimfiler = vimfiler#get_current_vimfiler()
" 	let marked_files = vimfiler#get_marked_files()
"   if empty(marked_files)
"       let marked_files = [ vimfiler#get_file(cursor_linenr) ]
"   endif
" 
" 
" 	let path = expand('#:p')
"     return [
"     \   { 'word': marked_files, 'source': 'diff_dev_pre', 'kind': 'directory' },
"     \   { 'word': path, 'source': 'diff_dev_pre', 'kind': 'directory' },
"     \ ]



  " let path = expand('#:p')
  " let lines = getbufline('#', 1, '$')
  " let format = '%' . strlen(len(lines)) . 'd: %s'
  " return map(lines, '{
  " \   "word": printf(format, v:key + 1, v:val),
  " \   "source": "diff_dev_pre",
  " \   "kind": "jump_list",
  " \   "action__path": path,
  " \   "action__line": v:key + 1,
  " \ }')
" endfunction
" 
" call unite#define_source(s:unite_source)
" unlet s:unite_source







" 関連付け
au BufNewFile,BufRead *.jsx set filetype=javascript
" au BufNewFile,BufRead *.tpl set filetype=tpl
" au BufNewFile,BufRead *.tpl set filetype=html


