return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern"
  },
  keys = {
    { "<leader>" , group = "Leader" },
    { "<leader>?" , function () require("which-key").show({ global = false }) end, desc = "Show local keymaps" },

    -- Fuzzy finder group
    { "<leader>f", group = "Fuzzy Finder" },

    -- Buffer group
    { "<leader>b", group = "Buffer" },
    { "gb", "<cmd>bnext<cr>", desc = "Next Buffer" },
    { "gB", "<cmd>bnext<cr>", desc = "Previous Buffer" },

    -- Git group
    { "<leader>g", group = "Git" },

    -- LSP group
    { "<leader>l", group = "LSP" },

    -- Debug group
    { "<leader>d", group = "Debug" },
  }
}
