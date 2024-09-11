return {
  "supermaven-inc/supermaven-nvim",
  -- TODO: Try VeryLazy instead of VimEnter, if causing issues, go back to VimEnter
  event = { "VeryLazy" },
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<M-CR>",
        clear_suggestion = "<C-]>",
      },
      color = {
        suggestion_color = "#D0679D",
        cterm = 244,
      },
      log_level = "warn",
    })
  end,
}
