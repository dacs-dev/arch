return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          telescope = true,
          nvimtree = true,
          treesitter = true,
          gitsigns = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
