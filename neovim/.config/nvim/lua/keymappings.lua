--[[--
File              : keymappings.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 30.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- generic keymappings
-- plugin specific keymappings are defined in their respecitve config files
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

options = {noremap = true}

vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit<CR>:terminal<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>th', ':split<CR>:terminal<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>s', ':%s/<c-r><c-w>//g<left><left>',
                        options)
