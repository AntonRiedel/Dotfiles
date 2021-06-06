--[[--
File              : lsp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 06.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                                '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                                opts)
end

-- Enable language servers
local servers = {'clangd', 'pyls', 'bashls', 'texlab', 'rust_analyzer'}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

-- treesitter setup
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "c", "cpp", "python", "rust", "lua"},
    highlight = {enable = true}
}

-- setup completion
vim.o.completeopt = "menuone,noinsert"
require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    -- preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {path = true, buffer = true, nvim_lsp = true, ultisnips = true}
}

-- vim.o.completeopt = 'menuone,noinsert,noselect'
-- vim.g.completion_matching_strategy_list = {'exact', 'fuzzy', 'substring'}
-- vim.g.completion_enable_auto_hover = 1
-- vim.g.completion_enable_auto_signature = 1
-- vim.g.completion_enable_snippet = 'UltiSnips'
-- vim.g.completion_enable_auto_popup = 1
-- vim.g.completion_enable_auto_paren = 1
-- vim.g.completion_matching_ignore_case = 1
-- vim.g.completion_trigger_keyword_length = 1
