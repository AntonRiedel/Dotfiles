--[[--
File              : json.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 03.12.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
augroup END
]])
