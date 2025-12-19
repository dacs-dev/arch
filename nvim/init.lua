-- Configuración básica de Neovim desde cero
-- permitir que Shift inicie selección (si el terminal envia secuencias modificadas)
vim.o.keymodel = "startsel,stopsel"

-- Normal mode: Shift+Arrow entra en visual y mueve
vim.keymap.set('n', '<S-Left>',  'v<Left>',  { noremap = true })
vim.keymap.set('n', '<S-Right>', 'v<Right>', { noremap = true })
vim.keymap.set('n', '<S-Up>',    'v<Up>',    { noremap = true })
vim.keymap.set('n', '<S-Down>',  'v<Down>',  { noremap = true })

-- Insert mode: salir a Normal, entrar Visual y mover (dejarás Insert)
vim.keymap.set('i', '<S-Left>',  '<Esc>v<Left>',  { noremap = true })
vim.keymap.set('i', '<S-Right>', '<Esc>v<Right>', { noremap = true })
vim.keymap.set('i', '<S-Up>',    '<Esc>v<Up>',    { noremap = true })
vim.keymap.set('i', '<S-Down>',  '<Esc>v<Down>',  { noremap = true })

require("config.options")
require("config.keymaps")
require("config.plugins")
