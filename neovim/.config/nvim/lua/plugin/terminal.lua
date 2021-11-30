--[[--
File              : terminal.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]--
if packer_bootstrap then return end

require'FTerm'.setup({
    cmd = '/bin/bash',
    border = 'double',
    dimensions = {height = 0.9, width = 0.9}
})

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<C-\\>', '<cmd>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-\\>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
