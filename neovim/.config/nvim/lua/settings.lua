--[[--
File              : settings.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 09.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- external programs
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- autcommands for terminals
vim.api.nvim_exec([[
  augroup Terminal
    autocmd!
    au TermOpen * set nonu
    au TermOpen * set nornu
    au TermOpen * startinsert
  augroup end
]], false)

-- fix tex filetype
vim.g.tex_flavor = 'tex'

-- misc
vim.o.shell = '/bin/bash'
vim.o.hidden = true
vim.bo.swapfile = false
vim.o.tabstop = 4
vim.wo.list = true
vim.o.clipboard = 'unnamedplus'
vim.o.showtabline = 2
vim.o.mouse = "a"
vim.o.breakindent = true
vim.cmd [[set undofile]]

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

-- sane splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- graphical
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.number = true
vim.wo.relativenumber = true
