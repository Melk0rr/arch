return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "fish",
          "go",
          "json",
          "lua",
          "make",
          "markdown",
          "python",
          "rust",
          "toml",
          "vim",
          "yaml"
        }
      })
    end
}