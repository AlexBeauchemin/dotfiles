return {
  "Sebastian-Nielsen/better-type-hover",
  config = function()
    require("better-type-hover").setup({
      fallback_to_old_on_anything_but_interface_and_type = true,
    })
  end,
}
