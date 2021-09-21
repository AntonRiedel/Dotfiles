--[[--
File              : autopairs.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 19.09.2021
Last Modified Date: 19.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- autopairs setup
require("nvim-autopairs").setup()
require("nvim-autopairs.completion.cmp").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = { -- modifies the function or method delimiter by filetypes
        all = '(',
        tex = '{'
    }
})

-- custom rules
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.add_rule(Rule("$", "$", "tex"))
