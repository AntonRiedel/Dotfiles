--[[--
File              : colorscheme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 01.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.o.termguicolors = true

-- load colorscheme
vim.g.material_style = 'palenight'
require('material').setup({

    contrast = true,
    borders = true,

    italics = {
        comments = true,
        keywords = true,
        functions = true,
        strings = true,
        variables = true
    },

    contrast_windows = {"terminal", "packer", "qf"}

})

vim.cmd([[colorscheme material]])
