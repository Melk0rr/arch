-- Common
vim.cmd 'colorscheme vim' 		    -- color scheme
vim.cmd 'set background=light'		-- background scheme
vim.opt.number = true 			      -- line number

vim.o.termguicolors = true

-- Tabulation
vim.opt.expandtab = true		      -- tab to space
vim.opt.tabstop = 2			          -- tab size
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- File search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Status
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = false

vim.opt.ch = 0
