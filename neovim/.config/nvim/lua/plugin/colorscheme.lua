--[[--
File              : colorscheme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 19.08.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
if packer_bootstrap then
	return
end

require("nightfox").setup({
	options = {
		styles = {
			comments = "underline",
			conditionals = "NONE",
			functions = "NONE",
			keywords = "bold",
			operators = "bold",
			strings = "NONE",
			types = "bold",
			variables = "italic",
		},
	},
})
vim.cmd("colorscheme nightfox")
