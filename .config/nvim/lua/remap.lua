local nnrm = function(new, old) -- nnrm = normal-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
end

local xnrm = function(new, old) -- xnrm = visual-no-recurse-map
    vim.keymap.set("x", new, old, { noremap = true, silent = true })
end

local inrm = function(new, old) -- inrm = insert-no-recurse-map
    vim.keymap.set("i", new, old, { noremap = true, silent = true })
end

local nxnrm = function(new, old) -- nxnrm = normal/visual-no-recurse-map
    vim.keymap.set("n", new, old, { noremap = true, silent = true })
    vim.keymap.set("v", new, old, { noremap = true, silent = true })
end

nnrm("-", "<CMD>Oil<CR>")
nnrm("<leader>e", vim.diagnostic.open_float)
nnrm("<leader>r", vim.lsp.buf.rename)
nnrm("<S-k>", vim.lsp.buf.signature_help)
nnrm("gd", vim.lsp.buf.definition)
nnrm(":W", ":w")

nxnrm("w", "W")
nxnrm("W", "w")
nxnrm("b", "B")
nxnrm("B", "b")

nxnrm("j", "h")
nxnrm("k", "j")
nxnrm("l", "k")
nxnrm(";", "l")
nxnrm("h", ";")

nxnrm("<leader>1", "0i")
nxnrm("<leader>0", "$i<Right>")

inrm("<esc>", "<Right><esc>")

