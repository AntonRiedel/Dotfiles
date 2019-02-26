"------------------------------------------------------------------------------
"     File Name           :     11.easymotion.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-26 15:19]
"     Last Modified       :     [2019-02-26 15:20]
"     Description         :     Confiuguration for easymotion
"------------------------------------------------------------------------------

"Disable default mappings
let g:EasyMotion_do_mapping = 0

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>d <Plug>(easymotion-bd-jk)
nmap <Leader>d <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" JK motions: Line motions
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)
