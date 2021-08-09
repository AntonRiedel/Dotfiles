--[[--
File              : c.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 09.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for c files
-- protect against overwriting cpp-specific configurations
if (vim.bo.filetype ~= c) then return end

-- set comment string for commentary.vim
vim.bo.commentstring = "// %s"

-- set tabwidth
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

-- set make program
vim.bo.makeprg = "make"

-- set format program
vim.bo.formatprg = "clang-format"
vim.bo.equalprg = "clang-format"

-- autoformat files on save
-- augroup Format
--     autocmd!
--     autocmd BufWritePre * AddHeader
--     autocmd BufWritePre * undojoin | Neoformat
-- augroup END
