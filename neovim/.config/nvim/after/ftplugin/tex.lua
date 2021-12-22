--[[--
File              : tex.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 16.12.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
vim.bo.makeprg = "latexmk -pdf"

vim.bo.spelllang = "en_us,de"
vim.wo.spell = true

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
        autocmd BufWritePost * !bash -c "rm -rf \~formatting*"
augroup END
]])
