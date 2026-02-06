return {
  "rachartier/tiny-glimmer.nvim",
  -- Use the latest git commit
  version = false,
  event = "VeryLazy",
  -- event = "TextYankPost",
  priority = 10, -- Low priority to catch other plugins' keybindings
  config = function()
    require("tiny-glimmer").setup({
      -- refresh_interval_ms = 1,
      transparency_color = "#333333",
      -- animations = {
      --   fade = {
      --     from_color = "#a6e3a1",
      --     to_color = "#000000",
      --     -- from_color = "DiffDelete",
      --     -- to_color = "Normal",
      --   },
      -- },
      overwrite = {
        redo = {
          enabled = true,
        },
        undo = {
          enabled = true,
        },
      },
    })
  end,
}
