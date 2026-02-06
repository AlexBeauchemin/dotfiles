return {
  "neovim/nvim-lspconfig",
  -- Setting VeryLazy makes the errors not display as ghost text
  -- event = "VeryLazy",
  --- @class lspconfig
  opts = {
    -- Disable inlay hints from the lsp
    -- Can use <leader>uh to do the same
    inlay_hints = { enabled = false },
    -- remove virtual text from diagnostics
    -- see: https://www.reddit.com/r/neovim/comments/1jl0air/how_to_disable_doubled_diagnostics/
    -- and https://github.com/LazyVim/LazyVim/issues/1964#issuecomment-1798178555
    -- opts = {
    --   diagnostics = {
    --     virtual_text = false,
    --   },
    -- },
    --
    -- Disable eslint formatting as it's slow and timing out on big projects
    -- taken from https://github.com/LazyVim/LazyVim/pull/4225/files
    setup = {
      eslint = function()
        return false
      end,
      -- Use setup hook to fully override tailwindcss config (prevents filetypes merging)
      -- Only trigger tailwindcss lsp on tsx files
      tailwindcss = function(_, opts)
        local util = require("lspconfig.util")
        vim.lsp.config("tailwindcss", {
          filetypes = { "typescriptreact" }, -- Only .tsx files
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            -- Tailwind v3: JS/TS config files
            local v3_root = util.root_pattern(
              "tailwind.config.js",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "tailwind.config.ts"
            )(fname)
            if v3_root then
              on_dir(v3_root)
              return
            end
            -- Tailwind v4: CSS-first, uses postcss or vite plugin
            local v4_root =
              util.root_pattern("postcss.config.js", "postcss.config.cjs", "postcss.config.mjs", "postcss.config.ts")(
                fname
              )
            if v4_root then
              on_dir(v4_root)
            end
          end,
        })
        vim.lsp.enable("tailwindcss")
        return true -- Prevent LazyVim from setting up the server again
      end,
      -- oxlint = function()
      --   local util = require("lspconfig.util")
      --   return {
      --     cmd = { "oxlint", "lsp-proxy" },
      --     filetypes = {
      --       "javascript",
      --       "javascriptreact",
      --       "json",
      --       "jsonc",
      --       "typescript",
      --       "typescript.tsx",
      --       "typescriptreact",
      --       "astro",
      --       "svelte",
      --       "vue",
      --       "css",
      --     },
      --     root_dir = util.root_pattern("package.json"),
      --     single_file_support = false,
      --   }
      -- end,
    },
    servers = {
      copilot = {
        enabled = false,
        -- Use the correct node version for copilot, it requires v22+ but some of my projects use node v20 via fnm
        -- Remove this once all my projects are on v22+
        cmd = {
          vim.fn.expand("~/.local/share/fnm/aliases/default/bin/node"),
          vim.fn.expand("~/.local/share/nvim/mason/bin/copilot-language-server"),
          "--stdio",
        },
      },
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      ["docker-language-server"] = {
        enabled = true,
      },
      ["gh-actions-language-server"] = {
        enabled = true,
      },
      -- TODO: Re-enable but only disable for .env files
      bashls = {
        enabled = false,
      },
      tsgo = {
        enabled = true,
      },
      biome = {
        enabled = true,
        settings = {
          format = true,
        },
        -- Use the biome version used in the project
        -- Disabled using it via npx as it's slower and might swallow errors and exist codes
        -- cmd = { "npx", "biome", "lsp-proxy" },
        -- Use Mason-installed biome binary instead
        -- filetypes = { "html", "css", "javascript", "typescript", "svelte", "vue", "astro", "markdown", "json" },
      },
      -- oxlint = {
      --   enabled = true,
      -- },
      eslint = {
        enabled = false,
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          -- Let prettier handle the formatting
          format = false,
          run = "onSave",
        },
      },
      -- tailwindcss is configured in setup hook below to prevent filetypes merging
      vtsls = {
        enabled = false,
        -- Monorepo support ? Tried to make it work correctly when working with a worspace as the CWD from a monorepo, but it didn't work
        -- See: https://github.com/neovim/nvim-lspconfig/issues/1830
        -- root_dir = function(fname)
        --   local root_pattern = require("lspconfig").util.root_pattern(".git")
        --   return root_pattern(fname)
        -- end,
        --
        -- -- See this config if more performance issues
        -- -- https://github.com/d7omdev/nvim/blob/b038a73e0bb2ebe879b4ef7868c11394ec10d053/lua/plugins/lspconfig.lua#L111C3-L111C115
        settings = {
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
                entriesLimit = 50,
              },
            },
          },
          typescript = {
            preferences = {
              includePackageJsonAutoImports = "off",
              -- autoImportFileExcludePatterns = [],
            },
            -- Commented out this as performance became really bad, even freezing neovim when opening a ts/tsx file with a large project
            -- If uncommenting, make sure performance is still decent after tryign a big frontend project
            tsserver = {
              maxTsServerMemory = 8192,
            },
            ts_ls = {
              maxTsServerMemory = 8192,
            },
          },
        },
      },
    },
  },
}
