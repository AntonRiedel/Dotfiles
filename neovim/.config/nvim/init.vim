"init.vim

"to simplify maintenance, split init.vim across serveral files and source them
"here
for config in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' config
endfor
