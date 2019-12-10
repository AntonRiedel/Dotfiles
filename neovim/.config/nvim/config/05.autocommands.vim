"--------------------------------------------------------------------------------
"     File Name           :     05.autocommands.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 19:35]
"     Last Modified       :     [2019-12-05 01:08]
"     Description         :     Configuration for autocommands
"--------------------------------------------------------------------------------

"Reload init.vim if a config file gets changed
autocmd BufWritePost *.vim source $MYVIMRC

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,CMakeLists.txt,*.tex,*.md,*.py,*.sh Neoformat

"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c
