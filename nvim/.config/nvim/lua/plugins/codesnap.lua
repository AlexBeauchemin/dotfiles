return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.0-beta.17",
  -- build = "make",
  -- This is necessary for fff.nvim to work, looks like this plugin conflicts with it
  cmd = { -- Only load when these commands are used
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
    "CodeSnapASCII",
  },
}
