--[[--
File              : statusline.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]--
if packer_bootstrap then return end

require("lualine").setup({
    options = {icons_enabled = false, theme = 'palenight'},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = {},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {'quickfix', 'fugitive'}
})
