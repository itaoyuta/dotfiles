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
set formatoptions=q "自動改行off

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
nmap <C-J><C-J> :set transparency=16<CR><ESC>


"----------------------------------------------------
" カスタムのキーマップ(パーシャルしているものもわからなくなるので全てここに記述) 
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
"Omnisharp
nnoremap [omnisharp] <Nop>
nmap <Leader>o [omnisharp]
"Venus(officeで利用)
nnoremap [venus] <Nop>
nmap <Leader>v [venus]


"タブの切り替えを行う
nmap <silent> [tabmove]n :tabnext<CR><ESC>
nmap <silent> [tabmove]p :tabprevious<CR><ESC>

"fontサイズとwindowのリサイズをする
nmap <silent> [windowAndFont]1 :call SetFontAndWindow(1) <CR><ESC>
nmap <silent> [windowAndFont]2 :call SetFontAndWindow(2) <CR><ESC>
nmap <silent> [windowAndFont]3 :call SetFontAndWindow(3) <CR><ESC>

function! SetFontAndWindow(v1)
	if a:v1 == 1
		set guifont=Ricty_for_Powerline:h18
		set columns=230
		set lines=60
	elseif a:v1 == 2
		set guifont=Ricty_for_Powerline:h12
		set columns=250
		set lines=200
	elseif a:v1 == 3
		set guifont=Ricty_for_Powerline:h12
		set columns=350
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

NeoBundle 'mattn/yamada2-vim'
NeoBundle 'scrooloose/syntastic'

NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ }

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
" let g:unite_data_directory = '~/.vim/data/.unite'
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


"----------------------------------------------------
" vimfiler
"----------------------------------------------------
" let g:vimfiler_data_directory = '~/.vim/data/.vimfiler'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"ダブルクリックで起動するシステムを設定
call vimfiler#set_execute_file('html','com.google.chrome')
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

" キーマッピング
nnoremap <silent> [vimfiler]f :VimFiler<CR>
nnoremap <silent> [vimfiler]c :VimFilerBufferDir<CR>

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
" let g:neocomplcache_temporary_dir = '~/.vim/data/.neocon'
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

"C#の設定
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'


" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" " Use underscore completion.
" let g:neocomplcache_enable_underbar_completion = 1
" " Sets minimum char length of syntax keyword.
" let g:neocomplcache_min_syntax_length = 0
" " buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
" "let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" let g:neocomplcache_enable_auto_close_preview = 0
" " Define keyword, for minor languages
" if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
" " SuperTab like snippets behavior.
" "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" inoremap <expr>.  neocomplcache#close_popup() . "."
" inoremap <expr>(  neocomplcache#close_popup() . "("
" inoremap <expr>)  neocomplcache#close_popup() . ")"
" inoremap <expr><space>  neocomplcache#close_popup() . " "
" inoremap <expr>;  neocomplcache#close_popup() . ";"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" inoremap <expr><ESC> pumvisible() ? neocomplcache#cancel_popup() : "\<esc>"
"
" " AutoComplPop like behavior.
" let g:neocomplcache_enable_auto_select = 1
"
" " Shell like behavior(not recommended).
" set completeopt+=longest
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
" "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"
"
" " Enable heavy omni completion, which require computational power and may stall the vim. 
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.cs = '.*'
" "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'


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


"----------------------------------------------------
" パーシャルファイル
"----------------------------------------------------
set runtimepath+=~/.vim/
runtime! conf.d/*.vim



"----------------------------------------------------
" omnisharp
"----------------------------------------------------
" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap [omnisharp]gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap [omnisharp]fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap [OmniSharp]ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap [omnisharp]fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap [omnisharp]fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap [omnisharp]fm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap [omnisharp]x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap [omnisharp]fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap [omnisharp]tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap [omnisharp]dc :OmniSharpDocumentation<cr>
    " autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    " autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP)
nnoremap [omnisharp]<space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap [omnisharp]<space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap [omnisharp]nm :OmniSharpRename<cr>
nnoremap [omnisharp]<F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap [omnisharp]rl :OmniSharpReloadSolution<cr>
nnoremap [omnisharp]cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap [omnisharp]tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap [omnisharp]ss :OmniSharpStartServer<cr>
nnoremap [omnisharp]sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap [omnisharp]th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
