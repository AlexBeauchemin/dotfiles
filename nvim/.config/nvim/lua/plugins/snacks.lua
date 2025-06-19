return {
  "snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      layout = "telescope",
      formatters = {
        file = {
          -- filename_first = true,
        },
      },
      -- filter = {
      --   cwd = true,
      -- },
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          layout = { layout = { position = "right" } },
          hidden = true,
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader><space>", false },
    { "<leader>ff", LazyVim.pick("smart"), desc = "Find Files (smart)" },
    -- { "<leader>uC", function() Snacks.picker.colorschemes({ layout = { preset = "vscode" } }) end, desc = "Colorschemes" },
  },
}
