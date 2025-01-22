return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mide` for more information
  },
  config = function ()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["<C-x>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
        }
      }
    })
  end,
}
