-- vim.g:limelight_conceal_ctermfg = 240
-- vim.g:limelight_conceal_guifg("#777777")

return {
  "junegunn/limelight.vim",
  init = function()
    vim.g.limelight_conceal_ctermfg = "DarkGray"
    vim.g.limelight_conceal_guifg = "#767c9d"
  end,
}
