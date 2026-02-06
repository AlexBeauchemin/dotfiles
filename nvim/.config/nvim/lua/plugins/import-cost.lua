return {
  "barrett-ruth/import-cost.nvim",
  -- disabled because pnpm is not supported by import-cost
  enabled = false,
  build = "sh install.sh pnpm",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  config = function()
    require("import-cost").setup()
  end,
}
