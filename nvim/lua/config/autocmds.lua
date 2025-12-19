-- Abrir nvim-tree automáticamente al iniciar Neovim (solo si no abres un archivo)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Solo abrir si no se pasó un archivo como argumento
    if vim.fn. argc() == 0 then
      require("nvim-tree. api").tree.open()
    end
  end,
})

-- Si cierras todos los buffers y solo queda nvim-tree, cerrar Neovim
vim.api. nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and
       vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})
