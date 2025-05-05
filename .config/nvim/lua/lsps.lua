local lc = require("lspconfig")


require("nvim-treesitter.configs").setup { ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "c", "cpp", "html", "css", "json", "markdown", "sql" }, highlight = { enable = true } }
lc.pyright.setup{}
lc.clangd.setup{}
lc.cmake.setup{}
lc.html.setup{}
lc.dockerls.setup{}
lc.jsonls.setup{}
lc.ts_ls.setup{}

