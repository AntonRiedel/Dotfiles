--[[--
File              : terminal.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 14.04.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
if packer_bootstrap then
	return
end

require("FTerm").setup({
	cmd = "/bin/bash",
	border = "double",
	dimensions = { height = 0.9, width = 0.9 },
})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-\\>", '<cmd>lua require("FTerm").toggle()<CR>', opts)

vim.api.nvim_set_keymap("t", "<C-\\>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
