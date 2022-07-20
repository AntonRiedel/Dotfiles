--[[--
File              : rust.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]--
vim.bo.makeprg = "cargo run"

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
augroup END
]])
