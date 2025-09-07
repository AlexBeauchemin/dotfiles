return {
  "akinsho/bufferline.nvim",
  -- Temporary fix for lazyvim: https://github.com/LazyVim/LazyVim/pull/6354
  init = function()
    local bufline = require("catppuccin.groups.integrations.bufferline")
    function bufline.get()
      return bufline.get_theme()
    end
  end,
  opts = {
    options = {
      indicator = {
        style = "underline",
      },
      show_buffer_close_icons = false,
    },
    -- highlights = {
    --   indicator_selected = {
    --     bg = "#7287fd",
    --   },
    --   buffer_selected = {
    --     bg = "#7287fd",
    --     fg = "#ffffff",
    --   },
    --   close_button_selected = {
    --     bg = "#7287fd",
    --     fg = "#ffffff",
    --   },
    -- },
  },
}
