local map = vim.api.nvim_set_keymap

-- Common
map('', 'Y', 'y$', {})				                            -- 'Y' to yank the whole line
map('n', '<leader>;', 'mqA;<esc>`q', {})	                -- put semicolon at the end of the line

-- Window navigation
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], {})
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], {})
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], {})
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], {})

-- Move lines
map('n', '<A-j>', ':m .+1<cr>==', {})
map('n', '<A-k>', ':m .-2<cr>==', {})
map('v', '<A-j>', ":m '>+1<cr>gv=gv", {})
map('v', '<A-k>', ":m '<-2<cr>gv=gv", {})

-- Plugin-specific

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
