--[[--
File              : format.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 09.09.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
if packer_bootstrap then
	return
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,
	filetype = {
		rust = { require("formatter.filetypes.rust").rustfmt },
		json = { require("formatter.filetypes.json").jq },
		yaml = { require("formatter.filetypes.yaml").prettier },
		sh = { require("formatter.filetypes.sh").shfmt },
		lua = { require("formatter.filetypes.lua").stylua },
		cpp = { require("formatter.filetypes.cpp").clangformat },
		c = { require("formatter.filetypes.c").clangformat },
		python = { require("formatter.filetypes.python").black },
		tex = {
			function()
				return { exe = "latexindent", args = { "-g /dev/sterr", "2>/dev/null" }, stdin = true }
			end,
		},
	},
})
