local map = vim.api.nvim_set_keymap

-- Common
map('', 'Y', 'y$', {})				-- 'Y' to yank the whole line
map('n', '<leader>;', 'mqA;<esc>`q', {})	-- put semicolon at the end of the line

-- Move lines
map('n', '<A-j>', ':m .+1<cr>==', {})
map('n', '<A-k>', ':m .-2<cr>==', {})
map('v', '<A-j>', ":m '>+1<cr>gv=gv", {})
map('v', '<A-k>', ":m '<-2<cr>gv=gv", {})

-- Plugin-specific
--local telescope = require 'telescope.builtin'
--map('n', '<C-p>', telescope.find_files, {})
--map('n', '<leader>fg', telescope.live_grep, {})
