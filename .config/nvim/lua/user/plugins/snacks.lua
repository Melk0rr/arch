return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Bigfile
    bigfile = {
      enabled = true,
      notify = true,
    },

    -- Buffdelete
    bufdelete = { enabled = true },

    -- Dashboard
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },

    -- Indend
    indent = { enabled = true },

    -- Input
    input = {
      enabled = true,
      icon = "",
      icon_hl = "SnacksInputIcon",
      icon_pos = "left",
      prompt_pos = "title",
      win = { style = "input" },
      expand = true,
    },

    -- Lazygit
    lazygit = {
      configure = true,
      config = {
        gui = {

        },
        os = {
          disableStartupPopups = true,
        }
      },
      win = {
        height = 0,
      },
    },

    -- Notifier
    notifier = {
      enabled = false,
      timeout = 3000, -- default timeout in ms
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      sort = { "level", "added" }, -- sort by level and time
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
      style = "compact",
      top_down = true,
      date_format = "%R",
      more_format = " ↓ %d lines ",
      refresh = 50
    },

    -- Notify
    notify = { enabled = true },

    -- Profiler
    profiler = { enabled = true },

    -- Quickfile
    quickfile = { enabled = true },

    -- Scroll
    scroll = { enable = true },

    statuscolumn = {
      enable = true,
      left = { "mark", "sign" },
      right = { "fold", "git" },
      folds = {
        open = false,
        git_hl = false,
      },
      git = {
        patterns = { "GitSign", "MiniDiffSign" }
      },
      refresh = 50
    },

    -- Terminal
    terminal = {
      win = {
        height = 0.25,
      }
    },

    -- Words
    words = { enabled = true },
  },
  keys = {
    -- Dashboard
    { "<leader>a" , function() Snacks.dashboard() end, desc = "Snacks dashboard" },

    -- Find
    { "<leader>fp" , function() Snacks.picker.projects() end, desc = "Find projects" },

    -- git
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },

    -- Terminal
    { "<leader>tn", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" } },

    -- Words
    { "<leader>ll", function() Snacks.words.jump(vim.v.count1) end, desc = "Next LSP Reference", mode = { "n", "t" } },
    { "<leader>lL", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev LSP Reference", mode = { "n", "t" } },
  },
}
