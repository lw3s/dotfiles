local nnrm = function(new, old) -- nnrm = normal-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
end

local vnrm = function(new, old) -- vnrm = visual-no-recurse-map
    vim.keymap.set("v", new, old, { noremap = true, silent = true })
end

local inrm = function(new, old) -- inrm = insert-no-recurse-map
    vim.keymap.set("i", new, old, { noremap = true, silent = true })
end

local nvnrm = function(new, old) -- nvnrm = normal/visual-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
    vim.keymap.set("v", new, old, { noremap = true, silent = true })
end

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

nvnrm("j", "h")
nvnrm("k", "j")
nvnrm("l", "k")
nvnrm(";", "l")

nvnrm("<leader>1", "0i")
nvnrm("<leader>0", "$i<Right>")

nnrm("P", "\"0p")
nnrm("<leader>p", "\"*p")
vnrm("<leader>y", "\"*y")

inrm("<esc>", "<Right><esc>")

