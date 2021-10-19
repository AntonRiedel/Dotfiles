--[[--
File              : lsp.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 26.04.2021
Last Modified Date: 18.10.2021
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

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable language servers
local servers = {'clangd', 'pylsp', 'bashls', 'texlab', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

-- for neorg
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

-- treesitter setup
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash", "c", "cpp", "python", "rust", "lua", "bibtex", "latex","norg"
    },
    highlight = {enable = true},
    indent = {enable = true},
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
        }
    }
}

-- setup completion
vim.opt.completeopt = "menuone,noselect"
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
        {name = 'path'}, {name = 'latex_symbols'}, {name = 'orgmode'}
    }
}


        -- ['<Tab>'] = function(fallback)
        --     -- if vim.fn.pumvisible() == 1 then
        --     --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true,
        --     --                                                    true, true), 'n')
        --     -- elseif luasnip.expand_or_jumpable() then
        --     if luasnip.expand_or_jumpable() then
        --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
        --                             '<Plug>luasnip-expand-or-jump', true, true,
        --                             true), '')
        --     else
        --         fallback()
        --     end
        -- end,
        -- ['<S-Tab>'] = function(fallback)
        --     -- if vim.fn.pumvisible() == 1 then
        --     --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true,
        --     --                                                    true, true), 'n')
        --     -- elseif luasnip.jumpable(-1) then
        --     if luasnip.jumpable(-1) then
        --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
        --                             '<Plug>luasnip-jump-prev', true, true, true),
        --                         '')
        --     else
        --         fallback()
        --     end
        -- end
