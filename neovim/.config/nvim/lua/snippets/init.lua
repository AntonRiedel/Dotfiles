--[[--
File              : init.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 01.09.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]

if packer_bootstrap then
	return
end

local ls = require("luasnip")
ls.add_snippets("cpp", require("snippets/cpp"))

require("luasnip.loaders.from_vscode").lazy_load()
