return {
  "stevearc/overseer.nvim",
  opts = {},
  config = function()
    require("overseer").setup()
  end,
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Overseer Run Task" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Overseer Toggle Task" },
  },
}
