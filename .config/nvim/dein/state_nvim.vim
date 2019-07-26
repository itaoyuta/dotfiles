if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/yutaito/.config/nvim,/etc/xdg/nvim,/Users/yutaito/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.3.7/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yutaito/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yutaito/.config/nvim/after,/Users/yutaito/.cache/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/yutaito/.config/nvim/init.vim', '/Users/yutaito/.config/nvim/dein/toml/dein.toml', '/Users/yutaito/.config/nvim/dein/toml/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/yutaito/.config/nvim/dein'
let g:dein#_runtime_path = '/Users/yutaito/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/yutaito/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/Users/yutaito/.config/nvim,/etc/xdg/nvim,/Users/yutaito/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/yutaito/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/yutaito/.config/nvim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.3.7/share/nvim/runtime,/Users/yutaito/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/yutaito/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/yutaito/.config/nvim/after,/Users/yutaito/.cache/dein/repos/github.com/Shougo/dein.vim'
filetype off
let g:deoplete#enable_at_startup   = 1
let g:deoplete#auto_complete_delay = 0
inoremap <expr><tab> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete.nvim', 'neosnippet.vim'])
