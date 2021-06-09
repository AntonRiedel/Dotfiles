--[[--
File              : statusline.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 06.06.2021
Last Modified Date: 09.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- configure statusbar plugin
require'lualine'.setup {
    options = {icons_enabled = false, theme = 'palenight'},
    extensions = {'quickfix', 'fugitive'}
}
-- vim.g.lightline = {
--     colorscheme = 'solarized',
--     active = {
--         left = {
--             {'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}
--         }
--     },
--     component_function = {gitbranch = 'fugitive#head'}
-- }
