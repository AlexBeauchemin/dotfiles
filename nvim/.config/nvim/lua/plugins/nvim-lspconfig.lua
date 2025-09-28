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
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      -- TODO: Re-enable but only disable for .env files
      bashls = {
        enabled = false,
      },
      biome = {
        enabled = true,
        settings = {
          format = true,
        },
        -- Use the biome version used in the project
        cmd = { "npx", "biome", "lsp-proxy" },
        -- filetypes = { "html", "css", "javascript", "typescript", "svelte", "vue", "astro", "markdown", "json" },
      },
      -- oxlint = {
      --   enabled = true,
      -- },
      eslint = {
        enabled = true,
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = "auto" },
          -- Let prettier handle the formatting
          format = false,
          run = "onSave",
        },
      },
      -- Disable tailwind if no config file found
      -- https://www.reddit.com/r/neovim/comments/12hptw4/help_disable_tailwindcss_lsp_when_no_config_file/
      tailwindcss = {
        -- hovers = true,
        -- suggestions = true,
        filetypes = { "templ", "vue", "html", "astro", "javascript", "typescript", "react", "htmlangular" },
      },
      vtsls = {
        enabled = true,
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
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
                entriesLimit = 20,
              },
            },
          },
          typescript = {
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
