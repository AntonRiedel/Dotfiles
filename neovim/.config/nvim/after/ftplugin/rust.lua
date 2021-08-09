--[[--
File              : rust.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 09.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for rust files
-- set tabwidth
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

-- set make program
vim.bo.makeprg = "cargo run"

-- set format program
vim.bo.formatprg = "rustfmt"
vim.bo.equalprg = "rustfmt"

-- autoformat files on save
vim.api.nvim_exec([[
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]], false)
