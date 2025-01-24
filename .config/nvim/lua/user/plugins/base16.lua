return {
  "RRethy/base16-nvim",
  config = function()
    require("base16-colorscheme").setup({
      base00 = '#0C0D0E', base01 = '#7D4B5A', base02 = '#4B557D', base03 = '#4B607D',
      base04 = '#4B647D', base05 = '#9AA9E6', base06 = '#9AB9E6', base07 = '#E69AB1',
      base08 = '#6584A3', base09 = '#F0AABF', base0A = '#AAB8F0', base0B = '#AAC7F0',
      base0C = '#AACDF0', base0D = '#AAB8F0', base0E = '#AAC7F0', base0F = '#F0AABF',
    })

    local border = require("base16-colorscheme").colors.base01
    local title = require("base16-colorscheme").colors.base0A
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        -- Telescope customization
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg="NONE", fg=border })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg="NONE", fg=border })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg="NONE" })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg="NONE" })
        vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg="NONE", fg=title })
        vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg="NONE", fg=title })
        vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg="NONE", fg=title })
      end
    })
  end
}
