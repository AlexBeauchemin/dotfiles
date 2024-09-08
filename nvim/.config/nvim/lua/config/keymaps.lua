-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- When pressing the escape key
-- Close notifications, quicfix, neotree and un-highlight search results
vim.keymap.set("n", "<Esc>", function()
  require("notify").dismiss({ silent = true, pending = true })
  vim.cmd("noh")
  vim.cmd("cclose")
  vim.cmd("Neotree close")
end, { silent = true })

-- Map M-l to M-CR for insert and normal mode
-- to accept supermaven suggestion using alt+l in addition to alt+enter
vim.keymap.set({ "i", "n" }, "<M-l>", "<M-CR>", { remap = true })
