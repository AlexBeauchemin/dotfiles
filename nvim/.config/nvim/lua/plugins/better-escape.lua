return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      mappings = {
        i = {
          k = {
            j = "<Esc>",
          },
        },
      },
      -- mapping = { "jk", "jj", "kj" },
    })
  end,
}
