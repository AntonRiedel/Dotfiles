--[[--
File              : lsp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 26.04.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
require'lspconfig'.pyls.setup {on_attach = require'completion'.on_attach}
require'lspconfig'.clangd.setup {on_attach = require'completion'.on_attach}
require'lspconfig'.bashls.setup {on_attach = require'completion'.on_attach}
require'lspconfig'.texlab.setup {on_attach = require'completion'.on_attach}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "c", "cpp", "python", "lua"},
    highlight = {enable = true}
}

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = {'exact', 'fuzzy', 'substring'}
vim.g.completion_enable_auto_hover = 1
vim.g.completion_enable_auto_signature = 1
vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_enable_auto_popup = 1
vim.g.completion_enable_auto_paren = 1
vim.g.completion_matching_ignore_case = 1
vim.g.completion_trigger_keyword_length = 1

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = {noremap = true, silent = true}
buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               opts)
buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
               opts)
buf_set_keymap('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
               opts)
