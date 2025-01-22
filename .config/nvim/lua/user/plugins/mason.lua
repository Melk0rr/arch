return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local servers = {
      "bashls",
      "clangd",
      "cssls",
      "html",
      "jsonls",
      "lua-ls",
      "pyright",
      "rust_analyzer",
    }
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })
  end
}
