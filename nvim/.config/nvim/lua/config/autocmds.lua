-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Attach twoslash-queries to vtsls
require("lspconfig")["vtsls"].setup({
  on_attach = function(client, bufnr)
    require("twoslash-queries").attach(client, bufnr)
  end,
})

-- Auto save all the things
vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "autosave", pattern = "*", command = "silent! update" }
)
