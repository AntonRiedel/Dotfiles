--[[--
File              : toggleterm.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 31.08.2021
Last Modified Date: 01.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float'
})
