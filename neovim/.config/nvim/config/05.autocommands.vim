"--------------------------------------------------------------------------------
"     File Name           :     05.autocommands.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:35]
"     Last Modified       :     [2019-04-07 11:09]
"     Description         :     Configuration for autocommands
"--------------------------------------------------------------------------------

"Reload init.vim if a config file gets changed
augroup myvimrc
    au!
    au BufWritePost *.vim source $MYVIMRC
augroup END

"Autoformat
autocmd BufWritePre * Neoformat
"autocmd BufWritePre *.c,*.h,*.cpp,*.tex,*.md,*.py,*.sh Neoformat

"Neomake
autocmd BufWritePost * Neomake

"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c
