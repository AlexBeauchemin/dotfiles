-- Make floating windows transparent on colorschemes that don't support it

vim.g.transparent_groups =
  vim.list_extend(vim.g.transparent_groups or {}, { "WhichKeyGroup", "WhichKey", "WhichKeyFloat" })

return {
  "xiyaowong/transparent.nvim",
}
