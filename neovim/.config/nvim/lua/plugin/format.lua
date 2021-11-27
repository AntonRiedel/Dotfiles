if packer_bootstrap then return end

require('format').setup {
    c = {{cmd = {"clang-format -i"}}},
    cpp = {{cmd = {"clang-format -i"}}},
    python = {{cmd = {"black"}}},
    sh = {{cmd = {"shfmt -w"}}},
    lua = {{cmd = {"lua-format -i"}}},
    rust = {{cmd = {"rustfmt"}}},
    tex = {{cmd = {"latexindent -w -s"}}}
}

-- for debugging let g:format_debug = v:true
-- vim.g.format_debug = true
