return {
  "stevearc/oil.nvim",
  enabled = true,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    float = {
      padding = 2,
      max_width = 100,
      -- max_height = 0,
    },
    win_options = {
      wrap = true,
      signcolumn = "yes:2",
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<esc>"] = "actions.close",
      ["<C-s>"] = "actions.save",
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "Oil Float" },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
