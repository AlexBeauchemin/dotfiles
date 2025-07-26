return {
  "rachartier/tiny-code-action.nvim",
  -- keymap interferes with default code action
  -- plus not sure what value this provides over the default code action
  enabled = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},
      },
    },
  },
  event = "LspAttach",
  opts = {
    picker = "snacks",
  },
}
