if packer_bootstrap then return end

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort()}),
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'ultisnips'}, {name = 'buffer'},
        {name = orgmode}
    })
})
