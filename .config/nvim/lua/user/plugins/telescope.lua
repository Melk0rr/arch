return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Telescope
      require("telescope").setup {
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        defaults = {
          file_ignore_patterns = {
            "Cargo.lock",
            "build/",
            "node_modules",
            "target",
            "%.svg",
            "package%-lock%.json",
          },
        },
      }
    end,
  },
  -- Telescope project
  {
    "nvim-telescope/telescope-project.nvim",
    config = function ()
      require("telescope").load_extension("project")
    end
  },
  -- Telescope ui select
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
