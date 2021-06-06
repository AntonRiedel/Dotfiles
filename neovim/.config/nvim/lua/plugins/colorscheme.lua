--[[--
File              : colorscheme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 06.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.o.termguicolors = true
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = true
vim.g.moonlight_disable_background = false

-- Load the colorscheme
require('moonlight').set()

-- old gruvbox
-- vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'set background=dark'
