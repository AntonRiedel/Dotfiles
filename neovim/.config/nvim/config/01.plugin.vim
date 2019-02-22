"01.plugin.vim
"list and load all pulgins

call plug#begin() 
Plug 'iCyMind/NeoSolarized'
Plug 'mboughaba/i3config.vim'
Plug 'itchyny/lightline.vim'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf.vim'

Plug 'sbdchd/neoformat'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang', { 'for': ['.c','.cpp','.h'] }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vhdirk/vim-cmake', { 'for': ['.c','.cpp','.h'] }

Plug 'mklabs/vim-cowsay'
Plug 'fadein/vim-FIGlet'
call plug#end()

"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
