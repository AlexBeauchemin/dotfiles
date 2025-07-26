return {
  "AlexBeauchemin/biome-lint.nvim",
  -- dir = "~/nvim-plugins/biome-lint.nvim",
  -- dev = true,
  config = function()
    require("biome-lint").setup({
      severity = "error", -- error, warn, info
    })
  end,
}
