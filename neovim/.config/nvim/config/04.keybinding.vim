" 04.keybinds.vim
"Set keybinds

"Misc
inoremap jj <ESC>
cnoremap sw execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>r :RangerNewTab<CR>
