return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      -- Formateadores por tipo de archivo
      formatters_by_ft = {
        -- C/C++
        c = { "clang-format" },
        cpp = { "clang-format" },
        
        -- Python
        python = { "black" },
        
        -- JavaScript/TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        
        -- Web
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        
        -- Lua
        lua = { "stylua" },
        
        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        
        -- Rust
        rust = { "rustfmt" },
        
        -- Go
        go = { "gofmt" },
      },
      
      -- ✅ FORMATEAR AUTOMÁTICAMENTE AL GUARDAR
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
