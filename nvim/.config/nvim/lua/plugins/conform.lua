return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      formatters_by_ft = {
        typescript = {
          "oxfmt",
          "biome",
          -- https://github.com/stevearc/conform.nvim/pull/755/files
          -- "biome-organize-imports",
          -- "prettier",
          stop_after_first = true,
        },
        typescriptreact = {
          "oxfmt",
          "biome",
          -- https://github.com/stevearc/conform.nvim/pull/755/files
          -- "biome-organize-imports",
          -- "prettier",
          stop_after_first = true,
        },
        json = {
          "oxfmt",
          "biome",
          stop_after_first = true,
        },
      },
      formatters = {
        oxfmt = {
          require_cwd = true,
        },
      },
    })
    -- Override inherited Markdown formatters and disable LSP formatting.
    opts.formatters_by_ft.markdown = { lsp_format = "never" }
    return opts
  end,
}
