-- Options
-- vim.g (Global)
local g = vim.g

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- Programming Languages
g.python3_host_prog = "/usr/bin/python3"

-- disable netrw (netrw is the default file manager in vim)
-- this line tells neovim that netrw is already loaded (so no need to load it)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- vim.opt
local opt = vim.opt

opt.hlsearch = true
opt.mouse = "a"

opt.termguicolors = true

-- Do not save when switching buffers
opt.hidden = true

-- Number of screen lines to keep above and below the cursor
opt.scrolloff = 2

-- Better editor UI
opt.number = true
opt.numberwidth = 1
opt.relativenumber = true
opt.signcolumn = "yes:2"
opt.cursorline = true

-- Better editing experience
opt.expandtab = true
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = true
opt.textwidth = 300
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4 -- If negative, shiftwidth value is used
opt.syntax = "on"

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Number of items to remember in commandline history
opt.history = 100

-- Better buffer splitting
opt.splitright = true
opt.splitbelow = true

-- Preserve view while jumping
opt.jumpoptions = "view"

-- Stable buffer content on window open/close events.
opt.splitkeep = "screen"

-- Undo
opt.undofile = true

-- Format On Save
vim.cmd([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.py,*.lua,*.json,*.js,*.html lua =vim.lsp.buf.format()
    augroup END
]])

-- Restore last cursor position
vim.cmd([[
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

-- Ensure that the cursor is on the first line when opening a commit message
vim.cmd([[
    autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"
]])

-- Syntax and colorscheme
vim.cmd("set syntax=on")
vim.cmd("colorscheme my_monokai")
