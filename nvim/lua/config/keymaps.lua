-- Keymaps estilo VSCode
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key (espacio)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================
-- EDICIÓN BÁSICA
-- ============================================

-- Ctrl+S:  Guardar
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", opts)

-- Ctrl+Z: Deshacer
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-o>u", opts)

-- Ctrl+Shift+Z: Rehacer
map("n", "<C-S-z>", "<C-r>", opts)
map("i", "<C-S-z>", "<C-o><C-r>", opts)

-- Ctrl+X: Cortar
map("n", "<C-x>", "dd", opts)
map("v", "<C-x>", '"+d', opts)

-- Ctrl+C: Copiar
map("v", "<C-c>", '"+y', opts)

-- Ctrl+V: Pegar
map({"n", "v"}, "<C-v>", '"+p', opts)
map("i", "<C-v>", '<C-r>+', opts)

-- Ctrl+A: Seleccionar todo
map("n", "<C-a>", "ggVG", opts)

-- Ctrl+F: Buscar
map("n", "<C-f>", "/", { noremap = true })

-- Escape: Limpiar búsqueda
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- ============================================
-- MOVIMIENTO DE LÍNEAS (Alt+Arrow)
-- ============================================

-- Alt+Up: Mover línea arriba
map("n", "<A-Up>", ":m .-2<cr>==", opts)
map("i", "<A-Up>", "<Esc>:m .-2<cr>==gi", opts)
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", opts)

-- Alt+Down: Mover línea abajo
map("n", "<A-Down>", ":m .+1<cr>==", opts)
map("i", "<A-Down>", "<Esc>:m .+1<cr>==gi", opts)
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", opts)

-- Ctrl+Shift+K: Eliminar línea
map("n", "<C-S-k>", "dd", opts)

-- ============================================
-- BUFFERS Y VENTANAS
-- ============================================

-- Ctrl+W: Cerrar buffer
map("n", "<C-w>", "<cmd>bd<cr>", opts)

-- Ctrl+Tab: Siguiente buffer
map("n", "<C-Tab>", "<cmd>bnext<cr>", opts)

-- Ctrl+Shift+Tab: Buffer anterior
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", opts)

-- Ctrl+N: Nuevo archivo
map("n", "<C-n>", "<cmd>enew<cr>", opts)

-- Navegación entre ventanas
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- ============================================
-- MEJOR EXPERIENCIA
-- ============================================

-- Mantener selección al indentar
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Mejor navegación en modo visual
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- Centrar cursor después de saltos
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- ============================================
-- NAVEGACIÓN ENTRE TABS (PESTAÑAS)
-- ============================================

-- Alt+Left/Right para cambiar tabs (como navegador)
map("n", "<A-Left>", "gT", opts)   -- Alt+← = Tab anterior
map("n", "<A-Right>", "gt", opts)  -- Alt+→ = Tab siguiente

-- Alt+1/2/3/4 para ir a tab específica (como en navegadores)
map("n", "<A-1>", "1gt", opts)
map("n", "<A-2>", "2gt", opts)
map("n", "<A-3>", "3gt", opts)
map("n", "<A-4>", "4gt", opts)
map("n", "<A-5>", "5gt", opts)

-- Leader + t + acción (Space + t + algo)
map("n", "<leader>tn", "<cmd>tabnew<cr>", opts)       -- Space+tn = Nueva tab
map("n", "<leader>tc", "<cmd>tabclose<cr>", opts)     -- Space+tc = Cerrar tab
map("n", "<leader>to", "<cmd>tabonly<cr>", opts)      -- Space+to = Cerrar otras tabs
map("n", "<leader>tl", "<cmd>tablast<cr>", opts)      -- Space+tl = Última tab
map("n", "<leader>tf", "<cmd>tabfirst<cr>", opts)     -- Space+tf = Primera tab


-- ============================================
-- SALIR DE NEOVIM MÁS RÁPIDO
-- ============================================

-- Ctrl+Q = Salir (guarda si hay cambios, pregunta si hay sin guardar)
map("n", "<C-q>", "<cmd>confirm quit<cr>", opts)

-- Leader+q = Salir sin guardar (forzado)
map("n", "<leader>q", "<cmd>q! <cr>", opts)

-- Leader+Q = Salir de TODO (cerrar Neovim completamente)
map("n", "<leader>Q", "<cmd>qa! <cr>", opts)

-- Ctrl+Shift+Q = Guardar todo y salir
map("n", "<C-S-q>", "<cmd>wqa<cr>", opts)
