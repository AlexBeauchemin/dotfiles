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
      ts_ls = {
        enabled = false,
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
