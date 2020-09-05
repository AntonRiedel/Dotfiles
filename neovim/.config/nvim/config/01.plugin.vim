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
let g:plug_timeout = 180

call plug#begin('~/.local/share/nvim/plugged')

"grahpical
Plug 'sjl/badwolf'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'mhinz/vim-signify'

"coding support
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do' : 'bash install.sh' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'sbdchd/neoformat'

Plug 'tpope/vim-fugitive'

Plug 'voldikss/vim-floaterm'

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'donRaphaco/neotex', { 'for': '.tex' }

Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim'

"misc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lambdalisue/suda.vim'

Plug 'unblevable/quick-scope'

Plug 'junegunn/vim-easy-align'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'alpertuna/vim-header'

"Plug 'vimwiki/vimwiki'

"old
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
"Plug 'shanzi/autoHEADER'
"Plug 'godlygeek/tabular'
"Plug 'vim-scripts/doxygen-support.vim'
"Plug 'kkoomen/vim-doge'
"Plug 'iCyMind/NeoSolarized'
"Plug 'airblade/vim-rooter'
"Plug 'puremourning/vimspector'
"Plug 'neovim/nvim-lsp'
"Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
