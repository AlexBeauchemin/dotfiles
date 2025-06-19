return {
  "vuki656/package-info.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  -- Only load when editing json files
  ft = "json",
  config = function()
    require("package-info").setup({
      autostart = true,
      hide_up_to_date = true,
    })
  end,
  keys = {
    { "<leader>cu", "<cmd>lua require('package-info').change_version()<cr>", desc = "Update package version" },
  },
}
