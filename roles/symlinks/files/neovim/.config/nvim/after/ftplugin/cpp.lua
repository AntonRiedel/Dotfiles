--[[--
File              : cpp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

if (vim.call("expand", "%:e") == "C") then
    vim.bo.makeprg = "root -q -l -b %"
else
    vim.bo.makeprg =
        "mkdir -p build && cmake -S . -B build && cmake --build build"
end

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
augroup END
]])
