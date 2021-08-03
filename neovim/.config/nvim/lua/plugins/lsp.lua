--[[--
File              : lsp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 04.08.2021
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
local servers = {'clangd', 'pylsp', 'bashls', 'texlab', 'rust_analyzer'}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

-- treesitter setup
-- setup for norg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = {"src/parser.c"},
        branch = "main"
    }
}
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"bash", "c", "cpp", "python", "rust", "lua", "norg"},
    highlight = {enable = true},
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["taf"] = "@function.outer",
                ["tif"] = "@function.inner",
                ["tal"] = "@loop.outer",
                ["til"] = "@loop.inner",
                ["tac"] = "@condtional.outer",
                ["tic"] = "@condtional.inner"
            }
        },
        swap = {
            enable = true,
            swap_next = {["tsa"] = "@parameter.inner"},
            swap_previous = {["tsA"] = "@parameter.inner"}
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {["]m"] = "@function.outer"},
            goto_next_end = {["]M"] = "@function.outer"},
            goto_previous_start = {["[m"] = "@function.outer"},
            goto_previous_end = {["[M"] = "@function.outer"}
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["tdf"] = "@function.outer",
                ["tdF"] = "@class.outer"
            }
        }
    }
}

-- setup completion
vim.opt.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = true,
        spell = false,
        nvim_lsp = true,
        nvim_lua = true,
        neorg = true,
        ultisnips = true
    }
}

require('nvim-autopairs').setup()

vim.cmd([[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]])
