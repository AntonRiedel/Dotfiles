vim.bo.makeprg = "latexmk -pdf"

vim.bo.spelllang = "en_us,de"
vim.wo.spell = true

vim.cmd([[
augroup Format
        autocmd!
        autocmd BufWritePost * FormatWrite
augroup END
]])
