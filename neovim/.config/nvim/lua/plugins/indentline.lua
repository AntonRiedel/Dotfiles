--[[--
File              : indentline.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 06.06.2021
Last Modified Date: 05.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
require("indent_blankline").setup({
    char = "|",
    use_treesitter = true,
    -- space_char = "_",
    -- char_highlight_list = {"Warning", "Error"},
    -- show_current_context = true,
    -- context_highligh_list = {"Warning"},
    buftype_exclude = {"terminal"}
})
