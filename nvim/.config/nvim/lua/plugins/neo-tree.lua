-- lvim.builtin.nvimtree.setup.view.side = "right"
-- lvim.builtin.nvimtree.setup.view.adaptive_size = true
-- lvim.builtin.nvimtree.setup.renderer.highlight_opened_files = "all"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.nvimtree.setup.respect_buf_cwd = true
-- lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
-- lvim.builtin.nvimtree.setup.update_focused_file.enable = true

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
    },
    log_level = "warn",
  },
}
