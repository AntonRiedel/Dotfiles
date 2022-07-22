--[[--
File              : format.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 28.04.2022
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
if packer_bootstrap then return end

-- require('lsp-format').setup({})

require('formatter').setup({
    filetype = {
        rust = {
            -- Rustfmt
            function()
                return {
                    exe = "rustfmt",
                    args = {"--emit=stdout", "--edition=2021"},
                    stdin = true
                }
            end
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--double-quote"
                    },
                    stdin = true
                }
            end
        },
        sh = {
            -- Shell Script Formatter
            function()
                return {exe = "shfmt", args = {"-i", 2}, stdin = true}
            end
        },
        lua = {
            -- luafmt
            function()
                return
                    {exe = "lua-format", args = {"--in-place"}, stdin = false}
            end
        },
        cpp = {
            -- clang-format
            function()
                return {
                    exe = "clang-format",
                    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                    cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
                }
            end
        },
        cuda = {
            function()
                return {
                    exe = "clang-format",
                    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                    cwd = vim.fn.expand('%:p:h') -- Run clang-format in cwd of the file.
                }
            end
        },
        python = {
            -- Configuration for psf/black
            function()
                return {
                    exe = "black", -- this should be available on your $PATH
                    args = {'-'},
                    stdin = true
                }
            end
        },
        tex = {
            function()
                return {exe = "latexindent", args = {"-"}, stdin = true}
            end
        }
    }
})
