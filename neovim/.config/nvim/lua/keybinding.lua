--[[--
File              : keybinding.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 17.12.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vnoremap K :m '<-2<CR>gv=gv
-- vnoremap J :m '>+1<CR>gv=gv
-- " Normal mode
-- nnoremap <C-k> :m .-2<CR>==
-- nnoremap <C-j> :m .+1<CR>==
