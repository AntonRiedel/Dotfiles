--[[--
File              : indentline.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 06.06.2021
Last Modified Date: 15.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- Map blankline
-- vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_char = "|"
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
