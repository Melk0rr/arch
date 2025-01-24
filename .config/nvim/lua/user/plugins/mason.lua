return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local servers = {
      "bashls",
      "clangd",
      "cssls",
      "gopls",
      "html",
      "hyprls",
      "jsonls",
      "lua_ls",
      "stylua",
      "markdown_oxide",
      "pylsp",
      "pyright",
      "rust_analyzer",
    }

    -- Mason setup
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- Mason lsp setup
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })
  end
}
