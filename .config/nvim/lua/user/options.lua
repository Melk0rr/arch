-- Tabulation
vim.opt.expandtab = true		          -- tab to space
vim.opt.tabstop = 2			              -- tab size
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true

-- Line
vim.opt.cursorline = true
vim.opt.number = true 			          -- line number
vim.opt.fillchars = { eob = ' ' }

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

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

-- Term
vim.g.terminal_emulator = "kitty"

-- Term colors
vim.cmd "colorscheme vim" 		        -- color scheme
--vim.cmd "set background=dark"
vim.opt.termguicolors = true

-- Miscellaneous
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.pumheight = 40
vim.lsp.inlay_hint.enable(true)

-- Style customization
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg="NONE", underline=true, cterm={ underline=true } })
    --vim.api.nvim_set_hl(0, "LineNr", { bg="NONE", bold=false })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg="NONE", bold=true, cterm={ bold=true } })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { standout=true })
  end,
})
