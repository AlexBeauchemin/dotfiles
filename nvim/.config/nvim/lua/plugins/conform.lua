return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      typescript = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
      typescriptreact = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
      json = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
    },
    formatters = {
      biome = { require_cwd = true },
    },
  },
}
