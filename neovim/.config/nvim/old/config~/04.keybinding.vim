" File              : 04.keybinding.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"Quickly open neovim config files in new buffer
"init.vim will be automatically sourced if any changes are made
nnoremap <leader>ev :Files $MYVIMCONFIG<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"write more easily
nnoremap  <leader>w :w<CR>

"shortcutting split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"toggle tagbar
nnoremap <F8> :TagbarToggle<CR>

"toggle floatterm window
nnoremap <leader>t :FloatermToggle<CR>

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
nnoremap <leader>l :BLines<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
