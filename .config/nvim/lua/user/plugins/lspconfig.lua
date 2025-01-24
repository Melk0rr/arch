return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true }
      local map = vim.keymap.set
      map('n', "<leader>[", vim.lsp.buf.declaration, opts)
      map('n', "<leader>]", vim.lsp.buf.definition, opts)
      map('n', "K", vim.lsp.buf.hover, opts)
      map('n', "gk", vim.lsp.buf.signature_help, opts)
      map('n', "gd", vim.lsp.buf.definition, opts)
      map('n', "[d", vim.diagnostic.goto_prev, opts)
      map('n', "]d", vim.diagnostic.goto_next, opts)
      map('n', "<leader>rn", vim.lsp.buf.rename, opts)
      map('n', "<leader>ca", vim.lsp.buf.code_action, opts)
      map('n', "<leader>gf", vim.lsp.buf.format, opts)
      map('n', "<leader>q", "<cmd>Telescope diagnostics<CR>", opts)
      map('n', "<leader>p", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)
    end

    lspconfig.bashls.setup { on_attach = on_attach }                                   -- Bash
    lspconfig.fish_lsp.setup { on_attach = on_attach }                                 -- Fish
    lspconfig.asm_lsp.setup { on_attach = on_attach }                                  -- Assembly
    lspconfig.clangd.setup { on_attach = on_attach }                                   -- C/C++
    lspconfig.rust_analyzer.setup { on_attach = on_attach }                            -- Rust
    lspconfig.gopls.setup { on_attach = on_attach }                                    -- Go
    lspconfig.ts_ls.setup { on_attach = on_attach }                                    -- Typescript/Javascript
    -- lspconfig.nil_ls.setup { on_attach = on_attach }                                -- Nix
    lspconfig.hyprls.setup { on_attach = on_attach }                                   -- Hyprlang
    lspconfig.markdown_oxide.setup { on_attach = on_attach }                           -- Markdown

    -- Python
    lspconfig.pylsp.setup {
      on_attach = on_attach,
      settings = {
        pylsp = {
          plugins = {
            flake8 = {
              ignore = { "E111", "E114", "E121", "E202", "E203", "E501", "E221", "W503", "E241", "E402" },
              maxLineLength = 100,
            },
            pycodestyle = {
              ignore = { "E111", "E114", "E121", "E202", "E203", "E501", "E221", "W503", "E241", "E402" },
              maxLineLength = 100,
            }
          }
        }
      }
    }

    -- Lua
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT"
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,

      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path path = vim.split(package.path, ";"), }, diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {"vim", "use"},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            },
          },
        }
      },
    }

    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      pattern = "*.wgsl",
      callback = function()
        vim.bo.filetype = "wgsl"
      end,
    })
  end,
}
