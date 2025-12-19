return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    keys = {
      { "<C-t>", "<cmd>ToggleTerm direction=float<cr>", mode = {"n", "t"}, desc = "Toggle Terminal" },
    },
    opts = {
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },
}
