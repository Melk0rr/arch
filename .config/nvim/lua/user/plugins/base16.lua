return {
  "RRethy/base16-nvim",
  config = function()
    local theme = require("base16-colorscheme")
    theme.setup({
      base00 = "#0C0D0E",
      base01 = "#7D4B5A",
      base02 = "#4B557D",
      base03 = "#4B607D",
      base04 = "#4B647D",
      base05 = "#9AA9E6",
      base06 = "#9AB9E6",
      base07 = "#E69AB1",
      base08 = "#6584A3",
      base09 = "#F0AABF",
      base0A = "#AAB8F0",
      base0B = "#AAC7F0",
      base0C = "#AACDF0",
      base0D = "#AAB8F0",
      base0E = "#AAC7F0",
      base0F = "#F0AABF",
    })
  end,
}
