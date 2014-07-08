scriptencoding utf-8
set guifont=Ricty_for_Powerline:h18
set number
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set fileformats=unix,dos,mac
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set nocompatible "vi互換
set showmatch "対応括弧をハイライト
set cursorline "カーソル行をハイライト
set hlsearch 
set undodir=./.vimundo,~/.vimundo
"全角スペースを視覚化
augroup higlightIdegtaphicSpace
	autocmd!
	autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"Tab
set smartindent
set ts=2 sw=2 sts=2
"set expandtab
set noexpandtab
"javascript実行環境をnodejsへ
let $JS_CMD='node'

"map関連
"<leader>の設定を変更する 
let mapleader=","
" ,のデフォルトの機能は、\で使えるように退避
noremap \  ,
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"vimの裏がみたい
nmap <C-K><C-K> :set transparency=80<CR><ESC>
"vimの裏がみたいをもどしたい
nmap <C-J><C-J> :set transparency=6<CR><ESC>


"----------------------------------------------------
" カスタムのキーマップ 
"----------------------------------------------------
"タブの切り替えを行う
nnoremap [tabmove] <Nop>
nmap <Leader>t [tabmove]
"windowのリサイズをする
nnoremap [windowAndFont] <Nop>
nmap <Leader>w [windowAndFont]
"Unite
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
"VimFiler
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]
"VimShell
nnoremap [vimshell] <Nop>
nmap <Leader>c [vimshell]
"Venus
nnoremap [venus] <Nop>
nmap <Leader>v [venus]





"タブの切り替えを行う
nmap <silent> [tabmove]n :tabnext<CR><ESC>
nmap <silent> [tabmove]p :tabprevious<CR><ESC>

"fontサイズとwindowのリサイズをする
nmap <silent> [windowAndFont]1 :call SetFontAndWindow(1) <CR><ESC>
nmap <silent> [windowAndFont]2 :call SetFontAndWindow(2) <CR><ESC>

function! SetFontAndWindow(v1)
	if a:v1 == 1
		set guifont=Ricty_for_Powerline:h18
		set columns=230
		set lines=60
	elseif a:v1 == 2
		set guifont=Ricty_for_Powerline:h12
		set columns=250
		set lines=200
	endif
endfunction


"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
filetype plugin indent off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

"利用中のプラグインをBundle
"githubにあるプラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'unix' : 'make -f make_unix.mak',
			\    },
			\ }
NeoBundle 'thinca/vim-qfreplace' "個人的に修正したのでいったん除外
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mattn/livestyle-vim'
NeoBundle 'mattn/emmet-vim'
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
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'jimsei/winresizer'
NeoBundle 'tsukkee/unite-help'
" NeoBundle 'kmnk/vim-unite-svn.git'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'tomtom/tcomment_vim'
"ステータスライン
NeoBundle 'osyo-manga/unite-airline_themes'
NeoBundle 'bling/vim-airline.git'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

" www.vim.orgにあるプラグイン
NeoBundle 'CSApprox' 
NeoBundle 'autodate.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'vcscommand.vim'
" NeoBundle 'https://github.com/vim-scripts/DirDiff.vim'
" NeoBundle 'git://gist.github.com/rcmachado/256840' "html5のシンタックス
filetype plugin indent on


"===================================================================
" vim-indent-guides
"===================================================================
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#222222
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#010101 
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


"----------------------------------------------------
"" unite
"----------------------------------------------------
" 設定ファイルを書き出すディレクトリ
let g:unite_data_directory = '~/.vim/data/.unite'
" nmap <C-R> :Unite -start-insert file_rec:!
let g:unite_source_rec_max_cache_files = 20000
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit = 1000
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 1000

" 必要に応じて以下
" call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')
" call unite#custom#source('grep', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')



" キーマッピング
"Unite
nnoremap <silent> [unite]u :Unite file_mru<CR>
nnoremap <silent> [unite]r :Unite file_rec<CR>
nnoremap <silent> [unite]a :Unite file_rec/async<CR>
nnoremap <silent> [unite]d :Unite directory_mru<CR>
nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]m :Unite bookmark<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" 自作unite
" アクション
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

	:tabnew<CR>
	call DirDiff(dirA,dirB)

endfunction

call unite#custom_action('file' , 'diff_dev_pre' , diff_dev_pre)
unlet diff_dev_pre


"----------------------------------------------------
" vimfiler
"----------------------------------------------------
let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"ダブルクリックで起動するシステムを設定
call vimfiler#set_execute_file('html','com.google.chrome')
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

" キーマッピング
nnoremap <silent> [vimfiler]f :VimFiler<CR>
nnoremap <silent> [vimfiler]c :VimFilerBufferDir<CR>
nnoremap <silent> [vimfiler]rs :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
nnoremap <silent> [vimfiler]rg :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates<CR><ESC>
nnoremap <silent> [vimfiler]prs :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__PRE__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
nnoremap <silent> [vimfiler]prg :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__PRE__/mragnarok/webapps/mobile/templates<CR><ESC>
nnoremap <silent> [vimfiler]ms :VimFiler /crooz/venus4_space/venus/venus_4.0/project/gsmonsteregg/master/apps/web/view/SP/<CR><ESC>
nnoremap <silent> [vimfiler]bs :VimFiler /crooz/venus3_space/venus/venus_3.0/project/msbattle/master/webapps/mobile/templates_html5/<CR><ESC>
nnoremap <silent> [vimfiler]bg :VimFiler /crooz/venus3_space/venus/venus_3.0/project/msbattle/master/webapps/mobile/templates/<CR><ESC>
nnoremap <silent> [vimfiler]gs :VimFiler /crooz/venus3_space/venus/venus_3.0/project/gsbattle/master/webapps/mobile/templates_html5/<CR><ESC>

"----------------------------------------------------
" vimShell
"----------------------------------------------------
let g:VimShell_EnableInteractive = 1
let g:vimshell_no_save_history_commands = {}

" キーマッピング
nnoremap <silent> [vimshell]c :VimShell<CR>


"----------------------------------------------------
" neocomplacache(neosnippet)
"----------------------------------------------------
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
"スニペットが日本語入力の邪魔をするときのために
nmap <S-T><S-T> :NeoComplCacheToggle<CR>


"----------------------------------------------------
" dirDiff
"----------------------------------------------------
let g:DirDiffExcludes = ".svn,*.swp,.DS_Store,.git"


"----------------------------------------------------
" vim-airlines
"----------------------------------------------------
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
let g:airline_detect_whitespace=0

"----------------------------------------------------
" ref.vim
"----------------------------------------------------
" let g:ref_phpmanual_path = '/Applications/MAMP/htdocs/Dropbox/Public/manual/phpmanual'

"----------------------------------------------------
" autodate.vim
"----------------------------------------------------
let autodate_format="%Y/%m/%d %H:%M:%S"

"----------------------------------------------------
" vim-operator-replace
"----------------------------------------------------
map R  <Plug>(operator-replace)

"----------------------------------------------------
" vim-over
"----------------------------------------------------
map <Leader>S :OverCommandLine<CR>

"----------------------------------------------------
" tidy
"----------------------------------------------------
map <leader>= :%! tidy -config ~/tidy/html<CR>

"----------------------------------------------------
" venus.vim
"----------------------------------------------------
" キーマッピング
nnoremap <silent> [venus]g :call VenusSwitchFile("tpl")<CR>
nnoremap <silent> [venus]s :call VenusSwitchFile("tplSp")<CR>
nnoremap <silent> [venus]p :call VenusSwitchFile("Controller")<CR>
nnoremap <silent> [venus]i :call VenusSwitchFile("Include")<CR>
nnoremap <silent> [venus]tt :call VenusSwitchFile("tpl_switch_devpre")<CR>

"----------------------------------------------------
" .vim/plugin/TplCommon.vim
"----------------------------------------------------
" クロームリロードショートカット
nmap <S-R><S-R> :ChromeReload<CR><ESC>
nmap <S-C><S-C> :call TplComment()<CR>
nmap <S-S><S-S> :call TplSection()<CR>
nmap <S-N><S-N> :call TplLineComment()<CR>






"----------------------------------------------------
" その他の設定
"----------------------------------------------------
" 関連付け
au BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
" au BufNewFile,BufRead *.tpl set filetype=tpl
" au BufNewFile,BufRead *.tpl set filetype=html

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
hi DiffAdd term=bold ctermbg=1 guibg=#ff0000
