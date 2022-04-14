--[[--
File              : colorscheme.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 14.04.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

-- require('nightfox').setup({
--     options = {
--         styles = {
--             comments = "italic",
--             conditionals = "bold",
--             functions = "italic",
--             keywords = "bold",
--             operators = "bold",
--             strings = "italic",
--             types = "bold",
--             variables = "italic"
--         }
--     }
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme nightfox")

vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = true
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = true
vim.g.moonlight_disable_background = false

-- load the colorscheme
require('moonlight').set()
