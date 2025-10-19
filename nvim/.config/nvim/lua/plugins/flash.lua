return {
  "folke/flash.nvim",
  keys = {
    -- https://github.com/LazyVim/LazyVim/issues/6492#issuecomment-3316145117
    {
      -- disabled treesitter incremental selection, replaced with wildfire
      "<c-space>",
      mode = { "n", "o", "x" },
      false,
      --   function()
      --     require("flash").treesitter({
      --       actions = {
      --         ["<c-space>"] = "next",
      --         ["<BS>"] = "prev",
      --       },
      --       label = { after = false, before = false },
      --     })
      --   end,
      --   desc = "Treesitter Incremental Selection",
    },
  },
}
