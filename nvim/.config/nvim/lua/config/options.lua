-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.material_style = "deep ocean"
vim.material_style = "deep ocean"
-- more sane behavior when using ctrl-o/ctrl-i -> https://www.reddit.com/r/neovim/comments/16nead7/can_someone_explain_set_jumpoptionsstack/k1e1nj5/
vim.opt.jumpoptions = "stack"
-- vim.lsp.inlay_hint.enable(false)
-- vim.g.zenbones_transparent_background = true
-- vim.g.nordbones_transparent_background = true

vim.g.lazyvim_picker = "snacks"
-- vim.g.lazyvim_picker = "telescope"

vim.g.lazyvim_prettier_needs_config = true

-- https://www.reddit.com/r/neovim/comments/1jo9oe9/i_set_up_my_config_to_use_virtual_lines_for/
-- vim.diagnostic.config({
--   update_in_insert = false,
--   virtual_text = {
--     enabled = true,
--     severity = {
--       max = vim.diagnostic.severity.WARN,
--     },
--   },
--   virtual_lines = {
--     enabled = true,
--     severity = {
--       min = vim.diagnostic.severity.ERROR,
--     },
--   },
-- })

-- https://www.reddit.com/r/neovim/comments/1ajpdrx/lazyvim_weird_live_grep_root_dir_functionality_in/kp3cab9/
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.root_spec = { "cwd" }
