return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    }, {
      mode = "foreground",
      -- names = true,
      -- css = true,
      -- css_fn = true,
    })
  end,
}
