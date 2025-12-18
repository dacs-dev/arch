return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-`>", "<cmd>ToggleTerm direction=float<cr>", mode = {"n", "t"}, desc = "Toggle Terminal" },
    },
    opts = {
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },
}
