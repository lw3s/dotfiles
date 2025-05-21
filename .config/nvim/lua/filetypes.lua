local tab_for_type = function(extension, spaces)
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*." .. extension},
    callback = function()
      vim.bo.expandtab = true
      vim.bo.shiftwidth = spaces
      vim.bo.tabstop = spaces
      vim.bo.softtabstop = spaces
    end,
  })
end


tab_for_type("lua", 2)
tab_for_type("py", 4)
tab_for_type("cpp", 4)
tab_for_type("html", 2)
tab_for_type("css", 2)
tab_for_type("js", 2)
tab_for_type("json", 2)

