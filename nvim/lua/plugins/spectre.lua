return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-S-h>", function() require("spectre").open() end, desc = "Replace in Files" },
    },
  },
}
