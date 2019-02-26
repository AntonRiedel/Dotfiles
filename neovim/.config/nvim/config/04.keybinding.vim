"------------------------------------------------------------------------------
"     File Name           :     04.keybinding.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2019-02-26 15:17]
"     Description         :     Configuration for keybindings
"------------------------------------------------------------------------------

"escape insert mode easily
inoremap jj <ESC>

"move between splits (even if there is a terminal running)
"(source: https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9)
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

"start terminal in a split at the bottom of the window
nnoremap <leader>e :split<bar>terminal<CR><C-w>J:resize10<CR>a<CR>

"enter normal mode in terminal easily
tnoremap <leader><ESC> <C-\><C-n>

"move between buffers
nnoremap <leader>bb :buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete!<CR>

"move between tabs
nnoremap <leader>tt :tabs<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>td :tabclose<CR>

"spellchecking
noremap <leader>se :setlocal spell! spelllang=en_us<CR>
noremap <leader>sd :setlocal spell! spelllang=de_de<CR>
noremap <leader>ss :set nospell<CR>

"ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>r :RangerCurrentFileNewTab<CR>

"neomake
nnoremap <leader>nm :Neomake<CR>
let g:neomake_open_list = 2

"neoformat
nnoremap <leader>nf :Neoformat<CR>

"neotex
"compile document
autocmd FileType tex nnoremap <leader>nt :NeoTex<CR>
"start preview
autocmd FileType tex nnoremap <leader>nto :NeoTexOn<CR>

"markdown
autocmd FileType markdown nnoremap <leader>p :!pandoc % --pdf-engine=xelatex -o %:r.pdf<CR>

"view pdf document
autocmd FileType tex,markdown nnoremap <leader>pv :silent !$READER %:r.pdf &<CR>
autocmd FileType tex,markdown nnoremap <leader>ppv :silent !$READER2 %:r.pdf &<CR>
