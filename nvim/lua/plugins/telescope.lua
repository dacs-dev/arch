return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-e>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<C-S-f>", "<cmd>Telescope live_grep<cr>", desc = "Search in Files" },
      { "<C-S-p>", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
}
