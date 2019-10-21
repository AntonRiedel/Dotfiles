"--------------------------------------------------------------------------------
"     File Name           :     05.autocommands.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:35]
"     Last Modified       :     [2019-10-21 18:51]
"     Description         :     Configuration for autocommands
"--------------------------------------------------------------------------------

"Reload init.vim if a config file gets changed
autocmd BufWritePost *.vim source $MYVIMRC

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,*.tex,*.md,*.py,*.sh Neoformat

"Neomake
autocmd BufWritePost *.c,*.h,*.cpp,*.tex,*.md,*.py,*.sh Neomake

"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c
