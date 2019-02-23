"--------------------------------------------------------------------------------
"     File Name           :     04.keybinding.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2019-02-24 00:48]
"     Description         :     Configuration for keybindings
"--------------------------------------------------------------------------------

"escape insert mode easily
inoremap jj <ESC>

"write easily
nnoremap <leader>w :w<CR>

"write and quit easily
nnoremap <leader>ww :wq<CR>

"quit easily
nnoremap <leader>q :q<CR>

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
nnoremap <leader>t :split<bar>terminal<CR><C-w>J:resize10<CR>i<CR>

"enter normal mode in terminal
tnoremap jj <C-\><C-n>

"move between buffers
nnoremap bb :buffers<CR>
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
nnoremap bd :bdelete!<CR>

"move between tabs
nnoremap tt :tabs<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap td :tabclose<CR>

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
