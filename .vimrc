scriptencoding utf-8
set guifont=Ricty_for_Powerline:h18
set number
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
" set fileencodings=ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set nocompatible "vi互換
set showmatch "対応括弧をハイライト

"カーソル行をハイライト
set cursorline
"全角スペースを視覚化
augroup higlightIdegtaphicSpace
	autocmd!
	autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"Tab
" set expandtab
set smartindent
set ts=2 sw=2 sts=2
set noexpandtab

"javascript実行環境をnodejsへ
let $JS_CMD='node'

"<leader>の設定を変更する 
" nmap ¥ <leader>
let mapleader=","
" ,のデフォルトの機能は、\で使えるように退避
noremap \  ,

"map関連
"Escの2回押しでハイライト消去
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"vimの裏がみたい
nmap <C-K><C-K> :set transparency=80<CR><ESC>
"vimの裏がみたいをもどしたい
nmap <C-J><C-J> :set transparency=6<CR><ESC>

"タブの切り替えを行う
nmap <C-T><C-N> :tabnext<CR><ESC>
nmap <C-T><C-P> :tabprevious<CR><ESC>

"vimプラグイン等、読み込み指定
set runtimepath+=~/.vim/vimfiles/




"----------------------------------------------------
"" neobundle.vim
"----------------------------------------------------
filetype plugin indent off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

"利用中のプラグインをBundle
"githubにあるプラグイン
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle "Shougo/neomru.vim"
NeoBundle "Shougo/unite.vim"
NeoBundle "tsukkee/unite-help"
NeoBundle "kmnk/vim-unite-svn.git"
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
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

NeoBundle "kana/vim-textobj-user"
NeoBundle "kana/vim-operator-user"
NeoBundle "kana/vim-operator-replace"
NeoBundle "osyo-manga/vim-textobj-multitextobj"
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
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'hallettj/jslint.vim'


" if has('gui_running')
	NeoBundle "osyo-manga/unite-airline_themes"
	NeoBundle "bling/vim-airline.git"
	NeoBundle 'alpaca-tc/alpaca_powertabline'
	NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" endif

" NeoBundle "https://github.com/vim-scripts/DirDiff.vim"
NeoBundle "osyo-manga/vim-over"
"NeoBundle "git://gist.github.com/rcmachado/256840" "html5のシンタックス
"
"www.vim.orgにあるプラグイン
NeoBundle "CSApprox" 
NeoBundle "autodate.vim"
NeoBundle "nathanaelkane/vim-indent-guides"
"それ以外にあるgitリポジトリにあるプラグイン

filetype plugin indent on




"indent-guides
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
let g:unite_source_rec_max_cache_files = 10000
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit = 1000
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 1000


" キーマッピング
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
nnoremap <silent> [unite]u :Unite file_mru<CR>
nnoremap <silent> [unite]d :Unite directory_mru<CR>
nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]m :Unite bookmark<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>



"----------------------------------------------------
"" vimfiler
"----------------------------------------------------
let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"ダブルクリックで起動するシステムを設定
call vimfiler#set_execute_file('html','com.google.chrome')
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

" キーマッピング
nnoremap [vimfiler] <Nop>
nmap <Leader>f [vimfiler]
nnoremap <silent> [vimfiler]f :VimFiler<CR>
nnoremap <silent> [vimfiler]c :VimFilerBufferDir<CR>
nnoremap <silent> [vimfiler]rs :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
nnoremap <silent> [vimfiler]rg :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates<CR><ESC>
nnoremap <silent> [vimfiler]prs :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__PRE__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
nnoremap <silent> [vimfiler]prg :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__PRE__/mragnarok/webapps/mobile/templates<CR><ESC>
nnoremap <silent> [vimfiler]ms :VimFiler /crooz/venus4_space/venus/venus_4.0/project/gsmonsteregg/master/apps/web/view/SP/<CR><ESC>


" noremap <Leader>vf :VimFiler<CR>
"現在開いているバッファのディレクトリを開く
" noremap <Leader>vc :VimFilerBufferDir<CR>
"設定ファイルを書き出すディレクトリ
"VimFilerBufferDir
" nmap <C-A><C-A> :VimFiler -split -simple -winwidth=35 -no-quit<CR><ESC>


"----------------------------------------------------
"" vimShell
"----------------------------------------------------
let g:VimShell_EnableInteractive = 1
let g:vimshell_no_save_history_commands = {}

" キーマッピング
nnoremap [vimshell] <Nop>
nmap <Leader>c [vimshell]
nnoremap <silent> [vimshell]c :VimShell<CR>

" noremap <Leader>vs :VimShell<CR>

"設定ファイルを書き出すディレクトリ
" let g:vimshell_temporary_directory = '~/.vim/data/.vimshell'
" let g:vimshell_data_directory = $HOME . '/.vim/data/.vimshell'
"let g:unite_source_vimshell_external_history_path = '~/.vim/data/.vimshell/command-history'

"----------------------------------------------------
"" neocomplacache(neosnippet)
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
"スニペットが日本語入力の邪魔をするから
nmap <S-T><S-T> :NeoComplCacheToggle<CR>


"----------------------------------------------------
"" dirDiff
"----------------------------------------------------
let g:DirDiffExcludes = ".svn,*.swp,.DS_Store"


"----------------------------------------------------
"" vim-airlines
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

"ref.vim
let g:ref_phpmanual_path = '/Applications/MAMP/htdocs/Dropbox/Public/manual/phpmanual'

"autodate.vim
let autodate_format="%Y/%m/%d %H:%M:%S"

"
map R  <Plug>(operator-replace)
map <Leader>S :OverCommandLine<CR>
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


"----------------------------------------------------
"" venus.vim
"----------------------------------------------------
" キーマッピング
nnoremap [venus] <Nop>
nmap <Leader>v [venus]

" テンプレを開く
nnoremap <silent> [venus]g :call VenusSwitchFile("tpl")<CR>
" テンプレ(スマホ)を開く
nnoremap <silent> [venus]s :call VenusSwitchFile("tplSp")<CR>
" コントローラーを開く
nnoremap <silent> [venus]p :call VenusSwitchFile("Controller")<CR>
" インクルードファイルを開く
nnoremap <silent> [venus]i :call VenusSwitchFile("Include")<CR>
" preを開く
nnoremap <silent> [venus]tt :call VenusSwitchFile("tpl_switch_devpre")<CR>
" 環境を開く
" nmap <S-R><S-S> :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates_html5<CR><ESC>
" nmap <S-R><S-G> :VimFiler /Users/yito1/Documents/svn/RAGNA_MBG/__DEV__/mragnarok/webapps/mobile/templates<CR><ESC>
" nmap <S-M><S-S> :VimFiler /crooz/venus4_space/venus/venus_4.0/project/gsmonsteregg/master/apps/web/view/SP/<CR><ESC>
" nmap <S-A><S-S> :VimFiler /Users/yito1/Documents/svn/AVALON_MBG/__DEV__AVALON/mguildbattle/webapps/mobile/templates_html5<CR><ESC>
" nmap <S-A><S-G> :VimFiler /Users/yito1/Documents/svn/AVALON_MBG/__DEV__AVALON/mguildbattle/webapps/mobile/templates<CR><ESC>



" クロームリロードショートカット
nmap <S-R><S-R> :ChromeReload<CR><ESC>
" tplのコメント
nmap <S-C><S-C> :call TplComment()<CR>
" sectionのsnip
nmap <S-S><S-S> :call TplSection()<CR>
" smartyコメント
nmap <S-N><S-N> :call TplLineComment()<CR>

"----------------------------------------------------
"" 自作unite
"----------------------------------------------------
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

	:tabnew<CR>
	call DirDiff(dirA,dirB)

endfunction

call unite#custom_action('file' , 'diff_dev_pre' , diff_dev_pre)
unlet diff_dev_pre



"Unite自作source例)Uniteのsource(naemが必須)
let s:unite_source={
			\ 'name':'lines' ,
			\}

function! s:unite_source.gather_candidates(args,context)
	let lines = getbufline('#',1,'$')
	let path = expand('#:p')
	let format = '%'.strlen(len(lines)).'d:%s'
	return map(linex , '
				\ "word":printf(format,v:key+1,v:'val')	,
				\ "source" : "lines" , 
				\ "kind" : "jump_list" , 
				\ "action_path" : path , 
				\ "action_line" : v:key + 1 , 
				\}')
endfunction

call unite#define_source(s:unite_source)
unlet s:unite_source

" Capture {{{
command!
      \ -nargs=+ -bang
      \ -complete=command
      \ Capture
      \ call s:cmd_capture([<f-args>], <bang>0)
 
function! C(cmd)
  redir => result
  silent execute a:cmd
  redir END
  return result
endfunction
 
function! s:cmd_capture(args, banged) "{{{
  new
  silent put =C(join(a:args))
  1,2delete _
endfunction "}}}
" }}}



"html5-ruby
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

"tidy
map <leader>= :%! tidy -config ~/tidy/html<cr>


" 関連付け
au BufNewFile,BufRead *.jsx set filetype=javascript
" au BufNewFile,BufRead *.tpl set filetype=tpl
" au BufNewFile,BufRead *.tpl set filetype=html
"
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
