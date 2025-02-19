return {
  "rachartier/tiny-glimmer.nvim",
  event = "TextYankPost",
  opts = {
    refresh_interval_ms = 1,
    transparency_color = nil,
    animations = {
      fade = {
        from_color = "#a6e3a1",
        to_color = "#000000",
        -- from_color = "DiffDelete",
        -- to_color = "Normal",
      },
    },
    overwrite = {
      redo = {
        enabled = true,
      },
      undo = {
        enabled = true,
      },
    },
  },
}
