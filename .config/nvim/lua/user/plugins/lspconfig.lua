return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require "lspconfig"

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        }
        lspconfig.bashls.setup {}
        lspconfig.pylsp.setup {}
        lspconfig.wgsl_analyzer.setup {}
        lspconfig.asm_lsp.setup {}
        lspconfig.clangd.setup {}
        lspconfig.jdtls.setup {}
        -- lspconfig.nil_ls.setup {}
        lspconfig.rust_analyzer.setup {}
        lspconfig.ts_ls.setup {}

        lspconfig.lua_ls.setup {
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

        lspconfig.zls.setup {}
        vim.cmd.let "g:zig_fmt_autosave = 0"

        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
            pattern = "*.wgsl",
            callback = function()
                vim.bo.filetype = "wgsl"
            end,
        })
    end,
}
