return {
  "nemanjamalesija/ts-expand-hover.nvim",
  enabled = true,
  ft = { "typescript", "typescriptreact" },
  opts = {
    -- Set in nvim-lspconfig instead so the mapping is not overwritten
    keymaps = { hover = false },
  },
}
