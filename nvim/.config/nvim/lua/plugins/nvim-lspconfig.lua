return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Disable eslint formatting as it's slow and timing out on big projects
    -- taken from https://github.com/LazyVim/LazyVim/pull/4225/files
    setup = {
      eslint = function()
        return
      end,
    },
    servers = {
      tsserver = {
        enabled = false,
      },
      -- use vtsls instead
      ts_ls = {
        enabled = false,
      },
      biome = {
        enabled = true,
        -- filetypes = { "html", "css", "javascript", "typescript", "svelte", "vue", "astro", "markdown", "json" },
      },
      -- Disable tailwin if no config file found
      -- https://www.reddit.com/r/neovim/comments/12hptw4/help_disable_tailwindcss_lsp_when_no_config_file/
      tailwindcss = {
        hovers = true,
        suggestions = true,
        root_dir = function(fname)
          local root_pattern =
            require("lspconfig").util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "postcss.config.js")
          return root_pattern(fname)
        end,
      },
      vtsls = {
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
