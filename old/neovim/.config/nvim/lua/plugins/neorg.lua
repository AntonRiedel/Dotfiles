--[[--
File              : neorg.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 02.08.2021
Last Modified Date: 18.10.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = "~/neorg"
                }
            }
        }
    },
}
