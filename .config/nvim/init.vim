let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

scriptencoding utf-8
set guifont=Ricty_for_Powerline_Regular:h12
set guifont=:h12
set number
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,default,latin
set fileformats=unix,dos,mac
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set nocompatible "vi互換
set showmatch "対応括弧をハイライト
set cursorline "カーソル行をハイライト
hi clear CursorLine
set hlsearch 
set undodir=./.vimundo,~/.vimundo
set formatoptions=q "自動改行off
set laststatus=2
filetype indent on

" 英字キーボードに変えてから使いづらいので
nnoremap ; :
nnoremap : ;





"全角スペースを視覚化
"augroup higlightIdegtaphicSpace
"	autocmd!
"	autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
"	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

"Tab
set smartindent
set ts=2 sw=0 sts=-1
set expandtab


"map関連
"<leader>の設定を変更する 
let mapleader=","
" ,のデフォルトの機能は、\で使えるように退避
noremap \  ,
"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
"vimの裏がみたい
nnoremap <C-K><C-K> :set transparency=80<CR><ESC>
"vimの裏がみたいをもどしたい
nnoremap <C-J><C-J> :set transparency=16<CR><ESC>
 
 
 
"----------------------------------------------------
" カスタムのキーマップ(パーシャルしているものもわからなくなるので全てここに記述) 
"----------------------------------------------------
"タブの切り替えを行う
nnoremap [tabmove] <Nop>
nmap <Leader>t [tabmove]
"windowのリサイズをする
nnoremap [windowAndFont] <Nop>
nmap <Leader>w [windowAndFont]
"Denite
nnoremap [denite] <Nop>
nmap <Leader>u [denite]
"Defx
nnoremap [defx] <Nop>
nmap <Leader>f [defx]
"VimShell
nnoremap [vimshell] <Nop>
nmap <Leader>c [vimshell]
""Omnisharp
"nnoremap [omnisharp] <Nop>
"nmap <Leader>o [omnisharp]


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yutaito/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yutaito/.cache/dein')
  call dein#begin('/Users/yutaito/.cache/dein')

  " Let dein manage dein
  " Required:
  " call dein#add('/Users/yutaito/.cache/dein/repos/github.com/Shougo/dein.vim')


  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let s:toml_dir  = $HOME . '/.config/nvim/dein/toml'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" もし補完候補がでていれば、<C-j> <C-k>で移動
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" plugins settings
source ~/.config/nvim/plugins/denite.vim
source ~/.config/nvim/plugins/tab.vim
source ~/.config/nvim/plugins/defx.vim
source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/vim-markdown.vim
source ~/.config/nvim/plugins/neosnippet.vim





