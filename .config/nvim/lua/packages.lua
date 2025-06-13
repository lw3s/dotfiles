local packages = {
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  "numToStr/Comment.nvim",
  "stevearc/oil.nvim",
  "HiPhish/rainbow-delimiters.nvim",
  "akinsho/git-conflict.nvim",
  "nvim-lualine/lualine.nvim",
  "ggandor/leap.nvim",
  "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/nvim-cmp", 
  "nvim-lua/plenary.nvim", "j-morano/buffer_manager.nvim",

  "mason-org/mason.nvim",
  "neovim/nvim-lspconfig",
  "mason-org/mason-lspconfig.nvim",
  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui"
}; local lazypath=vim.fn.stdpath("data").."/lazy/lazy.nvim"; if not (vim.uv or vim.loop).fs_stat(lazypath) then local lazyrepo="https://github.com/folke/lazy.nvim.git"; local out=vim.fn.system({"git","clone","--filter=blob:none","--branch=stable",lazyrepo,lazypath}); if vim.v.shell_error~=0 then vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n","ErrorMsg"},{out,"WarningMsg"},{"\nPress any key to exit..."}},true,{}); vim.fn.getchar(); os.exit(1); end; end; vim.opt.rtp:prepend(lazypath); vim.g.mapleader=" "; vim.g.maplocalleader="\\"; require("lazy").setup({spec={packages},install={colorscheme={"habamax"}},checker={enabled=true}})

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

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item()
  }), sources = { { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" } }
})

require("buffer_manager").setup({
  short_file_names = true
})

require("mason").setup()

local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

