return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<C-_>", function() require("Comment.api").toggle.linewise.current() end, mode = "n", desc = "Comment Line" },
      { "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = "v", desc = "Comment Selection" },
    },
    opts = {},
  },
}
