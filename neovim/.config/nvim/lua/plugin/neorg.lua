--[[--
File              : neorg.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 14.04.2022
Last Modified Date: 23.08.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]

if packer_bootstrap then
	return
end

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/nextcloud/notes/work",
					home = "~/nextcloud/notes/private",
				},
			},
		},
	},
})
