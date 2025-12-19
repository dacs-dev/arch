return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete!  %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = 'underline',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          }
        },
        separator_style = "thin",
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      
      -- Atajos para navegar buffers (pestañas visuales)
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Next buffer" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Previous buffer" })
      
      -- Alt+número para ir a buffer específico
      vim. keymap.set("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { silent = true })
      vim.keymap.set("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { silent = true })
      vim.keymap.set("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { silent = true })
      vim.keymap.set("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { silent = true })
      vim.keymap.set("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { silent = true })
      vim.keymap.set("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>", { silent = true })
      vim.keymap.set("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>", { silent = true })
      vim.keymap.set("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>", { silent = true })
      vim.keymap.set("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>", { silent = true })
      
      -- Cerrar buffer actual
      vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { silent = true, desc = "Close buffer" })
      vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { silent = true, desc = "Close other buffers" })
      
      -- Mover buffers
      vim.keymap.set("n", "<A-S-Left>", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer left" })
      vim.keymap.set("n", "<A-S-Right>", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer right" })
    end,
  },
}
