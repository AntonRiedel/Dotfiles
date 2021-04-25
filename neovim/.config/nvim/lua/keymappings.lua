--[[--
File              : keymappings.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 26.04.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit<CR>:terminal<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>th', ':split<CR>:terminal<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ev', ':FZF $XDG_CONFIG_HOME/nvim/<CR>',
                        {noremap = true})
