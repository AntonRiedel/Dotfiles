--[[--
File              : colorscheme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 01.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.o.termguicolors = true

-- load colorscheme
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

    contrast_windows = {"terminal", "packer", "qf"},

    text_contrast = {
        lighter = true, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
    }

})

require('material.functions').change_style('palenight')
vim.cmd([[colorscheme material]])

-- colorscheme specific config
-- vim.g.material_style = 'palenight'
-- vim.g.material_italic_comments = true
-- vim.g.material_italic_keywords = true
-- vim.g.material_italic_functions = true
-- vim.g.material_italic_variables = true
-- vim.g.material_contrast = true
-- vim.g.material_borders = false
-- -- Load the colorscheme
-- require('material').set()

-- old gruvbox
-- vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'set background=dark'
