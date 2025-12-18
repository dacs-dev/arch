return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ': TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })
      
      -- Instalar parsers
      require('nvim-treesitter').install({ 'lua', 'vim', 'javascript', 'typescript', 'python', 'html', 'css', 'rust', 'c', 'c++' })
    end
  }
}
