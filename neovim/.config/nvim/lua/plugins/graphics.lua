--[[--
File              : graphics.lua
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

-- load lualine plugin
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

-- load indentline plugin
vim.opt.listchars = {eol = "↴"}

require("indent_blankline").setup {
    use_treesitter = true,
    show_end_of_line = true,
    show_current_context = true
}

-- load gitsigns plugin
require('gitsigns').setup({keymaps = {}})

-- configure quickscope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
