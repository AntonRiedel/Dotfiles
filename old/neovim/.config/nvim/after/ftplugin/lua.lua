--[[--
File              : lua.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 09.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for lua files
-- set tabwidth
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-- set make program
vim.bo.makeprg = "lua %"

-- set format program
vim.bo.formatprg = "lua-format"
vim.bo.equalprg = "lua-format"
vim.g.neoformat_try_formatprg = 1

-- autoformat files on save
vim.api.nvim_exec([[
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]], false)
