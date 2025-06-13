require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "vim", "vimdoc", "python", "html", "css", "typescript", "json", "c", "cpp", "cmake", "bash", "dockerfile"
  }, highlight = { enable = true }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "pylsp", "html", "cssls", "ts_ls", "jsonls", "clangd", "cmake", "bashls", "dockerls"
  }, handlers = { function(server_name) require("lspconfig")[server_name].setup() end }
})


for _, ext in ipairs({
  "lua", "html", "css", "js", "json"
}) do vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = {"*." .. ext}, callback = function() vim.bo.expandtab = true; vim.bo.shiftwidth = 2; vim.bo.tabstop = 2; vim.bo.softtabstop = 2; end }); end


local dap = require("dap")
require("mason-nvim-dap").setup({
  ensure_installed = {
    "python", "js", "codelldb"
  }, automatic_installation = true, handlers = { require("mason-nvim-dap").default_setup }
})

dap.configurations.python = {{
  type = "python",
  request = "launch",
  program = "${file}"
}}
dap.configurations.javascript = {{
  type = "pwa-node",
  request = "launch",
  program = "${file}",
}}
dap.configurations.c = {{
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.getcwd() .. "/" .. os.getenv("C_EXEC")
  end
}}
dap.configurations.cpp = dap.configurations.c

