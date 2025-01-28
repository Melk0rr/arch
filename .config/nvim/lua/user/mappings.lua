local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Common
map('', 'Y', 'y$', opts)                                      -- 'Y' to yank the whole line
map('n', '<leader;', 'mqA;<esc>`q', opts)                     -- put semicolon at the end of the line

-- Press jk fast to exit insert mode
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)

-- Buffer navigation
map('n', '<Tab>', '<cmd>bnext<cr>', opts)
map('n', '<S-Tab>', '<cmd>bprevious<cr>', opts)

-- Stay in indent mode
map('v', '<', '<gv^', opts)
map('v', '>', '>gv^', opts)

-- Move lines
map('n', '<A-j>', ':m .+1<cr>==', opts)
map('n', '<A-k>', ':m .-2<cr>==', opts)
map('v', '<A-j>', ":m '>+1<cr>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<cr>gv=gv", opts)

-- Search
map('n', '<leader>cs', '<cmd>noh<cr>', opts)                    -- Cancel search

-- Plugin-specific
-- telescope
local telescope = require 'telescope.builtin'
map('n', '<leader>ff', telescope.find_files, opts)
map('n', '<leader>fG', telescope.grep_string, opts)
map('n', '<leader>fg', telescope.live_grep, opts)
map('n', '<leader>gB', telescope.git_branches, opts)
map('n', '<leader>gC', telescope.git_commits, opts)
map('n', '<leader>gS', telescope.git_status, opts)

-- neo-tree
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', opts)
