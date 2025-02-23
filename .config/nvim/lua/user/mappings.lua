local map = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- NOTE: Common
map('', 'Y', 'y$', opts("Yank whole line"))
map('n', '<leader;', 'mqA;<esc>`q', opts("Semicolon at end of line"))
map('n', '<leader>h', '<cmd>noh<cr>', opts("No search highlight"))
map('n', '<leader>qq', '<cmd>wqa!<cr>', opts("Save and quit"))
map('n', '<C-a>', 'goVG', opts("Select all"))

-- NOTE: Press jk fast to exit insert mode
map('i', 'jk', '<ESC>', opts("jk to exit insert mode"))
map('i', 'kj', '<ESC>', opts("kj to exit insert mode"))

-- NOTE: Window navigation
map('n', '<C-h>', '<C-w>h', opts("Go to left window"))
map('n', '<C-j>', '<C-w>j', opts("Go to lower window"))
map('n', '<C-k>', '<C-w>k', opts("Go to upper window"))
map('n', '<C-l>', '<C-w>l', opts("Go to right window"))
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts("Go to left terminal"))
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts("Go to lower terminal"))
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts("Go to upper terminal"))
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts("Go to right terminal"))

-- NOTE: Buffer navigation
map('n', '<Tab>', '<cmd>bnext<cr>', opts("Next buffer"))
map('n', '<S-Tab>', '<cmd>bprevious<cr>', opts("Previous buffer"))
map('n', '<leader>bde', '<cmd>%bd|e#<cr>', opts("Close all buffers except the current one"))

-- NOTE: Stay in indent mode
map('v', '<', '<gv^', opts("Unindent"))
map('v', '>', '>gv^', opts("Indent"))

-- NOTE: Move lines
map('n', '<A-j>', ':m .+1<cr>==', opts("Move line down"))
map('n', '<A-k>', ':m .-2<cr>==', opts("Move line up"))
map('v', '<A-j>', ":m '>+1<cr>gv=gv", opts("Move selection down"))
map('v', '<A-k>', ":m '<-2<cr>gv=gv", opts("Move selection up"))

-- NOTE: Debugging
map('n', '<leader>dc', '<cmd>lua require("dap").continue()<cr>', opts("Debugger continue"))
map('n', '<leader>dj', '<cmd>lua require("dap").step_over()<cr>', opts("Debugger step over"))
map('n', '<leader>dk', '<cmd>lua require("dap").step_out()<cr>', opts("Debugger step out"))
map('n', '<leader>dl', '<cmd>lua require("dap").step_into()<cr>', opts("Debugger step into"))
map('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts("Debugger toggle breakpoint"))
map('n', '<leader>dt', '<cmd>lua vim.cmd("RustLsp testables")<cr>', opts("Debugger run rust tests"))
map('n', '<leader>dx', '<cmd>lua require("dap").terminate()<cr><cmd>lua require("dapui").close()<cr>', opts("Debugger terminate"))
