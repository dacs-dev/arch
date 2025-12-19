return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { 
        "<C-b>", 
        function()
          require("nvim-tree.api").tree.toggle()
          -- Refrescar automáticamente después de abrir
          vim.defer_fn(function()
            require("nvim-tree.api").tree.reload()
          end, 50)
        end,
        desc = "Toggle File Explorer" 
      },
      { 
        "<C-S-e>", 
        function()
          require("nvim-tree.api").tree.focus()
          require("nvim-tree.api").tree.reload()
        end,
        desc = "Focus File Explorer" 
      },
    },
    opts = {
      -- Deshabilitar netrw (explorador nativo de Vim)
      disable_netrw = true,
      hijack_netrw = true,
      
      -- Actualización automática
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      
      -- Sincronización con directorio actual
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      reload_on_bufenter = true,  -- Recargar al cambiar de buffer
      
      -- Vista
      view = {
        width = 35,
        side = "left",
      },
      
      -- Renderizado
      renderer = {
        group_empty = true,
        highlight_git = true,
        root_folder_label = ":~: s? $?/.. ?",
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
      
      -- Filtros (qué archivos mostrar/ocultar)
      filters = {
        dotfiles = false,       -- MOSTRAR archivos ocultos
        git_ignored = false,    -- MOSTRAR archivos ignorados por git
        git_clean = false,
        custom = {},            -- Sin filtros personalizados
      },
      
      -- Git
      git = {
        enable = true,
        ignore = false,         -- MOSTRAR archivos ignorados
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      
      -- Filesystem watchers (detecta cambios automáticamente)
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
      },
      
      -- Acciones
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
    },
  },
}
