-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.material_style = "deep ocean"
vim.material_style = "deep ocean"
-- more sane behavior when using ctrl-o/ctrl-i -> https://www.reddit.com/r/neovim/comments/16nead7/can_someone_explain_set_jumpoptionsstack/k1e1nj5/
vim.opt.jumpoptions = "stack"
vim.lsp.inlay_hint.enable(false)
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

-- Autocomplete, from: https://github.com/echasnovski/nvim/blob/ad7e513e0cb941c7be5bbe88e77153eeaab86f5a/plugin/10_options.lua#L99-L103
-- and https://www.reddit.com/r/neovim/comments/1n7al7n/how_do_you_set_up_completion_behaviour/
vim.o.completeopt = "menuone,noselect" -- Show popup even with one item and don't autoselect first
if vim.fn.has("nvim-0.11") == 1 then
  vim.o.completeopt = "menuone,noselect,fuzzy,nosort" -- Use fuzzy matching for built-in completion
end
vim.o.complete = ".,w,b,kspell" -- Use spell check and don't use tags for completion

-- Spelling ===================================================================
vim.o.spelllang = "en" -- Define spelling dictionaries
vim.o.spelloptions = "camel" -- Treat parts of camelCase words as seprate words
