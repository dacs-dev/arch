return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    },
    opts = {
      view = {
        width = 35,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ". git", "node_modules", ".cache" },
      },
      git = {
        enable = true,
        ignore = false,
      },
    },
  },
}
