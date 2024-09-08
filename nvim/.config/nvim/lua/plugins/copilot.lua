return {
  "zbirenbaum/copilot.lua",
  event = { "VimEnter" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        keymap = {
          accept = "<M-CR>",
        },
      })
    end, 100)
  end,
}
