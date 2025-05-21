local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("lazy").setup({
  spec = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "numToStr/Comment.nvim",
    "stevearc/oil.nvim",
    "github/copilot.vim",
    "HiPhish/rainbow-delimiters.nvim",
    "akinsho/git-conflict.nvim",
    "nvim-lualine/lualine.nvim",
    "ggandor/leap.nvim"
  }
})

require("mason").setup()
require("oil").setup({
  view_options = {
    show_hidden = true,
    is_always_hidden = function (name, _)
        return name == ".git" or name == ".venv" or name == ".."
    end
  }
})
require("lualine").setup({
  options = {
    theme = "powerline"
  }
})
require("leap").add_default_mappings()

