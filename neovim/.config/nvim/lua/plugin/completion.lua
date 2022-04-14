--[[--
File              : completion.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 14.04.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
        {name = 'path'}
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
local servers = {
    'clangd', 'pyright', 'bashls', 'sumneko_lua', 'texlab', 'rust_analyzer'
}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {capabilities = capabilities}
end

-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body) -- For `luasnip` users.
--         end
--     },
--     mapping = {
--         ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i'}),
--         ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i'}),
--         ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i'}),
--         ['<C-y>'] = cmp.config.disable,
--         ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort()}),
--         ['<CR>'] = cmp.mapping.confirm({select = true}),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if luasnip.jumpable(1) then
--                 luasnip.jump(1)
--             else
--                 fallback()
--             end
--         end, {"i", "s"}),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, {"i", "s"})
--     },
--     sources = cmp.config.sources({
--         {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
--         {name = 'path'}, {name = 'orgmode'}
--     })
-- })
--
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on('confirm_done',
--              cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
