return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Add Cursor Up"] = "<C-S-Up>",
        ["Add Cursor Down"] = "<C-S-Down>",
        ["Select All"] = "<C-S-l>",
      }
    end,
  },
}
