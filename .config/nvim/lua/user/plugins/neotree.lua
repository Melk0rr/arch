return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mide` for more information
  },
  config = function ()
    require("neo-tree").setup({
      close_if_last_window = false,
      default_component_configs = {
        git_status = {
          symbols = {
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖",-- this can only be used in the git_status source
            renamed   = "󰁕",-- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        }
      },
      window = {
        mappings = {
          ["<C-x>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
        }
      }
    })
  end,
}
