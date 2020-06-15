" File              : 01.plugin.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 12.04.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"automatically install vim-plug and all other plugins if they are missing
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

let g:plug_threads = 4
let g:plug_timeout = 120

call plug#begin('~/.local/share/nvim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'voldikss/vim-floaterm'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf.vim'

Plug 'lambdalisue/suda.vim'

Plug 'unblevable/quick-scope'

Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

"Plug 'shanzi/autoHEADER'
Plug 'alpertuna/vim-header'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-scripts/doxygen-support.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'kkoomen/vim-doge'
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do' : 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'donRaphaco/neotex', { 'for': '.tex' }

call plug#end()
