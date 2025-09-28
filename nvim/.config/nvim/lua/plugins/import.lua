return {
  "piersolenski/import.nvim",
  dependencies = {
    -- One of the following pickers is required:
    -- 'nvim-telescope/telescope.nvim',
    "folke/snacks.nvim",
    -- 'ibhagwan/fzf-lua',
  },
  opts = {
    picker = "snacks",
  },
  keys = {
    {
      "<leader>i",
      function()
        require("import").pick()
      end,
      desc = "Import picker",
    },
  },
}
