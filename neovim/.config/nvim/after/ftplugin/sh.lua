--[[--
File              : sh.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 04.07.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]--
vim.bo.makeprg = "/usr/bin/bash -xv %"

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
augroup END
]])
