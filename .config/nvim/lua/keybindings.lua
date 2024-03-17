-- KEYBINDINGS

-- vim.keymap.set
local function map(m, k, v, opts)
    vim.keymap.set(m, k, v, opts)
end

-- Tabs
map("n", "<Leader>tc", "<CMD>tabclose<CR>")

-- Easy escape
map("i", "jk", "<ESC>", { desc = "Escape jk", noremap = true, silent = true })
map("i", "kj", "<ESC>", { desc = "Escape kj", noremap = true, silent = true })

-- Delete previous word with Ctrl + Backspace in Insert Mode
-- map("i", "<C-BS>", "<ESC>vbdi", { desc = "Delete previous word", noremap = true, silent = true })
map("i", "^H", "<C-W>", { desc = "Delete previous word", noremap = true, silent = true })

-- No hls
map("n", "<Leader>nh", "<CMD>nohlsearch<CR>", { desc = "No hls", noremap = true, silent = true })

-- Window resize
-- vertical
map("n", "<Leader>w.", "<CMD>vertical resize +5<CR>", { desc = "Vertical resize +5", noremap = true, silent = true })
map("n", "<Leader>w,", "<CMD>vertical resize -5<CR>", { desc = "Vertical resize -5", noremap = true, silent = true })
-- horizontal
map("n", "<Leader>w+", "<CMD>resize +5<CR>", { desc = "Window horizontal resize", noremap = true, silent = true })
map("n", "<Leader>w-", "<CMD>resize -5<CR>", { desc = "Window horizontal resize", noremap = true, silent = true })
-- equal
map("n", "<Leader>we", "<CMD>wincmd =<CR>", { desc = "Equalize window sizes", noremap = true, silent = true })

-- Terminal maps
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal escape", noremap = true, silent = true })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal escape jk", noremap = true, silent = true })
map("t", "jj", "j", { desc = "Terminal escape jj", noremap = true })

-- Tabs
map("n", "<Leader>tn", "<CMD>tabnew<CR>", { desc = "Open new tab", noremap = true, silent = true })
map("n", "<Leader>to", "<CMD>tabonly<CR>", { desc = "Close other tabs", noremap = true, silent = true })
map("n", "<Leader>tc", "<CMD>tabclose<CR>", { desc = "Close tab", noremap = true, silent = true })

-- windows
map("n", "<Leader>wv", "<CMD>vsplit<CR>", { desc = "Vertical split", noremap = true, silent = true })
map("n", "<Leader>wh", "<CMD>split<CR>", { desc = "Horizontal split", noremap = true, silent = true })
map("n", "<Leader>wc", "<CMD>close<CR>", { desc = "Close window", noremap = true, silent = true })
-- only
map("n", "<Leader>wo", "<CMD>wincmd o<CR>", { desc = "Only window", noremap = true, silent = true })

-- Buffers
map("n", "<Leader>bn", "<CMD>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
map("n", "<Leader>bp", "<CMD>bprevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })
map("n", "<Leader>bd", "<CMD>bdelete<CR>", { desc = "Delete buffer", noremap = true, silent = true })

-- Switch back and forth between two buffers in insert mode
map("i", "<C-^>", "<C-O><C-^>", { desc = "Switch back and forth between two buffers", noremap = true, silent = true })

-- Move around windows with Ctrl key
-- map("n", "<C-h>", "<C-w>h", { desc = "Window left", noremap = true, silent = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Window down", noremap = true, silent = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Window up", noremap = true, silent = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Window right", noremap = true, silent = true })

-- Use the system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard", noremap = true, silent = true })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard", noremap = true, silent = true })

-- Paste without deleting from register (in visual mode)
map("x", "<leader>dp", '"_dP', { desc = "Paste without deleting from register", noremap = true, silent = true })
