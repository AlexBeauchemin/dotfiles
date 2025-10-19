return {
  "sustech-data/wildfire.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("wildfire").setup({
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        node_decremental = "<BS>",
      },
    })
  end,
}
