return {
  "RRethy/base16-nvim",
  config = function()
    require("base16-colorscheme").setup({
      base00 = '#2E2B2C', base01 = '#7D4B59', base02 = '#6C4B7D', base03 = '#4B627D',
      base04 = '#7D4B5C', base05 = '#CC9AE6', base06 = '#9ABDE6', base07 = '#E69AAF',
      base08 = '#A3657A', base09 = '#F0AABE', base0A = '#D9AAF0', base0B = '#AACAF0',
      base0C = '#F0AAC1', base0D = '#D9AAF0', base0E = '#AACAF0', base0F = '#F0AABE',
    })
  end
}
