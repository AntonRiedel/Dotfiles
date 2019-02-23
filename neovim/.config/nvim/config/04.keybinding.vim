"--------------------------------------------------------------------------------
"     File Name           :     04.keybinding.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2019-02-23 20:26]
"     Description         :     Configuration for keybindings
"--------------------------------------------------------------------------------

"Misc
inoremap jj <ESC>
cnoremap sw execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"spellchecking
noremap <leader>se :setlocal spell! spelllang=en_us<CR>
noremap <leader>sd :setlocal spell! spelllang=de_de<CR>
noremap <leader>s :set nospell<CR>

"ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>r :RangerNewTab<CR>

"neotex
"compile document
nnoremap <leader>lk :NeoTex<CR>
"start preview
nnoremap <leader>lp :NeoTexOn<CR>
"view pdf document
nnoremap <leader>lv :silent !$READER %:r.pdf &<CR>
nnoremap <leader>llv :silent !$READER2 %:r.pdf &<CR>

"neomake
nnoremap <leader>m :Neomake<CR>
let g:neomake_open_list = 2

"neoformat
nnoremap <leader>f :Neoformat<CR>
