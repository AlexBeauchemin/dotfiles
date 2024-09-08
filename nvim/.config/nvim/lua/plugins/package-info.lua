return {
  "vuki656/package-info.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("package-info").setup()
  end,
  keys = {
    { "<leader>nu", "<cmd>lua require('package-info').change_version()<cr>", desc = "Update package version" },
  },
}
