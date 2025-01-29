local theme = require("base16-colorscheme")

local border = theme.colors.base01
local title = theme.colors.base0A
local indscope = theme.colors.base07
local bright = theme.colors.base0F
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- Telescope customization
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = border })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = border })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE", fg = title })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE", fg = title })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE", fg = title })

		-- Snack indent scope
		vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = indscope })

		-- Bufferline
		vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { sp = bright })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = bright })
	end,
})
