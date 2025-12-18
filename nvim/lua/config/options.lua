-- Opciones generales de Neovim
local opt = vim.opt

-- Apariencia
opt.number = true                -- Números de línea
opt.relativenumber = true        -- Números relativos
opt. termguicolors = true         -- Colores true color
opt.signcolumn = "yes"           -- Columna de signos siempre visible
opt.cursorline = true            -- Resaltar línea actual
opt.wrap = false                 -- No wrap de líneas largas
opt.scrolloff = 8                -- Líneas de contexto al hacer scroll
opt.sidescrolloff = 8

-- Indentación
opt.expandtab = true             -- Usar espacios en lugar de tabs
opt.shiftwidth = 2               -- Tamaño de indentación
opt.tabstop = 2                  -- Espacios que cuenta un tab
opt.softtabstop = 2
opt.smartindent = true           -- Auto-indentación inteligente
opt.autoindent = true

-- Búsqueda
opt.ignorecase = true            -- Ignorar mayúsculas en búsqueda
opt.smartcase = true             -- Excepto si la búsqueda tiene mayúsculas
opt.hlsearch = true              -- Resaltar búsquedas
opt.incsearch = true             -- Búsqueda incremental

-- Archivos
opt.swapfile = false             -- No crear archivos swap
opt.backup = false               -- No crear backups
opt.undofile = true              -- Historial de deshacer persistente
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Comportamiento
opt.mouse = "a"                  -- Habilitar mouse
opt.clipboard = "unnamedplus"    -- Usar clipboard del sistema
opt.splitright = true            -- Split vertical a la derecha
opt.splitbelow = true            -- Split horizontal abajo
opt.iskeyword: append("-")        -- Considerar - como parte de palabra

-- Performance
opt.updatetime = 300             -- Tiempo de actualización más rápido
opt.timeoutlen = 500             -- Tiempo de espera para combos de teclas

-- Completado
opt.completeopt = "menuone,noselect"

-- Crear directorio para undodir si no existe
vim.fn.mkdir(vim.fn.expand("~/.vim/undodir"), "p")
