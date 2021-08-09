--[[--
File              : sh.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 09.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for bash scirpts
-- set tabwidth
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

-- set make program
vim.bo.makeprg = "/usr/bin/bash %"

-- set format program
vim.bo.formatprg = "shfmt"
vim.bo.equalprg = "shfmt"

-- autoformat files on save
vim.api.nvim_exec([[
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]], false)
