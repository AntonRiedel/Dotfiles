"--------------------------------------------------------------------------------
"     File Name           :     04.keybinding.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2019-02-23 22:14]
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
autocmd FileType tex nnoremap <leader>lk :NeoTex<CR>
"start preview
autocmd FileType tex nnoremap <leader>lp :NeoTexOn<CR>

"markdown
autocmd FileType markdown nnoremap <leader>mk :!pandoc % --pdf-engine=xelatex -o %:r.pdf<CR>

"view pdf document
autocmd FileType tex,markdown nnoremap <leader>lv :silent !$READER %:r.pdf &<CR>
autocmd FileType tex,markdown nnoremap <leader>llv :silent !$READER2 %:r.pdf &<CR>


"neomake
nnoremap <leader>m :Neomake<CR>
let g:neomake_open_list = 2

"neoformat
nnoremap <leader>f :Neoformat<CR>
