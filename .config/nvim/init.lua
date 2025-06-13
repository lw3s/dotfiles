vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = false
vim.opt.wrap = false

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

require("packages")
require("remap")
require("languages")

