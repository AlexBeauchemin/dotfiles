---@module "neominimap.config.meta"
return {
  "Isrothy/neominimap.nvim",
  enabled = true,
  lazy = false, -- NOTE: NO NEED to Lazy load
  -- Optional
  keys = {
    -- Global Minimap Controls
    { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
  },
  init = function()
    -- The following options are recommended when layout == "float"
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Put your configuration here
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = true,
    }
  end,
}
