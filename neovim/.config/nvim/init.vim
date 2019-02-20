"init.vim

for config in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' config
endfor
