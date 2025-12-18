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
