--[[--
File              : tex.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 19.08.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]]
--
vim.bo.makeprg = "latexmk -pdf"

vim.bo.spelllang = "en_us,de"
vim.wo.spell = true

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWriteLock
augroup END
]])
