" File              : 04.keybinding.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"Quickly open neovim config files in new buffer
"init.vim will be automatically sourced if any changes are made
nnoremap <leader>ev :Files $MYVIMCONFIG<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"escape insert mode easily
inoremap jk <ESC>

"shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"no longer necessary with suda smart edit
"write file with sudo (using suda plugin) 
"cnoremap sw :w suda://%<CR>

"move between splits (even if there is a terminal running)
"(source: https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9)

"start terminal in a new buffer
"nnoremap <leader>t :terminal<CR>A

"toggle tagbar
nmap <F8> :TagbarToggle<CR>

"toggle floatterm window
let g:floaterm_keymap_toggle = '<F12>'

"enter normal mode in terminal easily
tnoremap <ESC><ESC> <C-\><C-n>

"move between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :bdelete!<CR>

"spellchecking
noremap <leader>se :setlocal spell! spelllang=en_us<CR>
noremap <leader>sd :setlocal spell! spelllang=de_de<CR>
noremap <leader>ss :set nospell<CR>

"neoformat (manual call)
nnoremap <leader>nf :Neoformat<CR>

"neotex
"compile document
autocmd FileType tex nnoremap <leader>nt :NeoTex<CR>
"compile document continuously
autocmd FileType tex nnoremap <leader>nto :NeoTexOn<CR>

"markdown
autocmd FileType markdown nnoremap <leader>p :!pandoc % --pdf-engine=pdflatex -o %:r.pdf<CR>

"view pdf document
autocmd FileType tex,markdown nnoremap <leader>pv :silent !$READER %:r.pdf &<CR>
autocmd FileType tex,markdown nnoremap <leader>ppv :silent !$READER2 %:r.pdf &<CR>

"execute scripts easily
nnoremap <leader>x :!./%<CR>

"fuzzy finding
nnoremap <leader>f :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>l :BLines<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
