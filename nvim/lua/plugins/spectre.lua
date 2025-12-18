return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-h>", function() require("spectre").open() end, desc = "Replace in Files" },
    },
  },
}
