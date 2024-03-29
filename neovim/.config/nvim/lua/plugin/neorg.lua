--[[--
File              : neorg.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 14.04.2022
Last Modified Date: 30.09.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]

if packer_bootstrap then
	return
end

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.completion"] = {
			config = { engine = "nvim-cmp" },
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "/home/anton/nextcloud/notes/work",
					home = "/home/anton/nextcloud/notes/private",
				},
			},
		},
	},
})
