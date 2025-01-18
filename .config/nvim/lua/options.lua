-- Tabulation
vim.opt.expandtab = true		          -- tab to space
vim.opt.tabstop = 2			              -- tab size
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Line
vim.opt.cursorline = true
vim.opt.number = true 			          -- line number

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

-- Misc
vim.cmd 'colorscheme vim' 		        -- color scheme
vim.cmd 'set background=light'		    -- background scheme
vim.o.termguicolors = false
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
--vim.lsp.inlay_hint.enable(true)
