-- https://github.com/olivercederborg/poimandres.nvim/issues/39
-- There an issue with colors once lsp/treesitter kicks in

return {
  -- "olivercederborg/poimandres.nvim",
  "sponkurtus2/poimandres.nvim",
  -- dir = "~/web/poimandres.nvim", -- "olivercederborg/poimandres.nvim
  -- dev = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("poimandres").setup({
      disable_background = true,
      disable_float_background = true,
    })
  end,
}
