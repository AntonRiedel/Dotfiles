--[[--
File              : cpp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 09.08.2021
Last Modified Date: 20.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- settings for cpp files
-- set comment string for commentary.vim
vim.bo.commentstring = "// %s"

-- set tabwidth
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

-- set make program
-- vim.bo.makeprg=cmake\ --build\ build
if (vim.call("expand", "%:e") == "C") then
    vim.bo.makeprg = "root -q -l -b %"
    -- else
    --     vim.bo.makeprg =
    --         "mkdir -p build && cmake -S . -B build && cmake --build build"
end

-- set format program
vim.bo.formatprg = "clang-format"
vim.bo.equalprg = "clang-format"

-- autoformat files on save
vim.api.nvim_exec([[
augroup Format
    autocmd!
    autocmd BufWritePre * undojoin | AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
]], false)
