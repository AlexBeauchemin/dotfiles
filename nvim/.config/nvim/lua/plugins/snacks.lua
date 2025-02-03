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
      filter = {
        cwd = true,
      },
      sources = {
        files = { hidden = true },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader><space>", false },
    { "<leader>ff", LazyVim.pick("smart"), desc = "Find Files (smart)" },
  },
}
