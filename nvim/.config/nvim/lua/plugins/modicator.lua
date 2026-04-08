return {
  "mawkler/modicator.nvim",
  -- Disabled as this breaks the snack's picker input. See: https://github.com/folke/snacks.nvim/issues/2810
  enabled = false,
  dependencies = "catppuccin/nvim", -- Add your colorscheme plugin here
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    -- Warn if any required option above is missing. May emit false positives
    -- if some other plugin modifies them, which in that case you can just
    -- ignore. Feel free to remove this line after you've gotten Modicator to
    -- work properly.
    show_warnings = true,
  },
}
