local nnrm = function(new, old) -- nnrm = normal-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
end

local nvnrm = function(new, old) -- nvnrm = normal/visual-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
    vim.keymap.set("v", new, old, { noremap = true, silent = true })
end

nnrm(" 1", "0i")
nnrm(" 0", "$i<Right>")
nnrm(" p", "\"0p")
nnrm("-", "<CMD>Oil<CR>")
nnrm("<leader>e", vim.diagnostic.open_float)
nnrm("<leader>r", vim.lsp.buf.rename)

local builtin = require('telescope.builtin')
nnrm("<leader>ff", builtin.find_files)
nnrm("<leader>fg", builtin.live_grep)
nnrm("<leader>fb", builtin.buffers)
nnrm("<leader>fh", builtin.help_tags)


nvnrm("w", "W")
nvnrm("W", "w")
nvnrm("b", "B")
nvnrm("B", "b")

vim.keymap.set("i", "<esc>", "<Right><esc>")

