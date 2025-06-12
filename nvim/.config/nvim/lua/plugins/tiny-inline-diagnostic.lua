return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- Or `VeryLazy`
  enabled = true,
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup({
      options = {
        show_source = true,
        multilines = true,
        virt_texts = {
          priority = 9999,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>dd",
      function()
        require("tiny-inline-diagnostic").toggle()
      end,
      desc = "Toggle TinyInlineDiagnostics",
    },
  },
}
