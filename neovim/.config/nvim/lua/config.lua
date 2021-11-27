-- set path to external programs explicitly
vim.opt.shell = '/bin/bash'
vim.g.python3_host_prog = '/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- autcommands for terminals
vim.cmd([[
  augroup Terminal
    autocmd!
    au TermOpen * set nonumber
    au TermOpen * set norelativenumber
    au TermOpen * startinsert
  augroup end
]])

-- misc
vim.opt.hidden = true
vim.opt.tabstop = 4
vim.opt.clipboard = 'unnamedplus'
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.wildignorecase = true
vim.opt.undofile = true
vim.opt.belloff = 'all'
vim.opt.expandtab = true
vim.opt.inccommand = 'split'
vim.opt.joinspaces = false
vim.opt.switchbuf = 'usetab'
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.g.tex_flavor = 'latex'

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- sane splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- graphical
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 15
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
