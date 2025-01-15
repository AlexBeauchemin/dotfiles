-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- When pressing the escape key
-- Close notifications, quicfix, neotree and un-highlight search results
vim.keymap.set("n", "<Esc>", function()
  -- require("notify").dismiss({ silent = true, pending = true })
  Snacks.notifier.hide()
  vim.cmd("noh")
  vim.cmd("cclose")
  vim.cmd("Neotree close")
  Close_floats()
  local suggestion = require("supermaven-nvim.completion_preview")
  if suggestion.has_suggestion() then
    suggestion.hide()
  end
end, { silent = true })

-- Map M-l to M-CR for insert and normal mode
-- to accept supermaven suggestion using alt+l in addition to alt+enter
vim.keymap.set({ "i", "n" }, "<M-l>", "<S-CR>", { remap = true })

-- Replicate the behavior of the ctrl+backspace/alt+backspace key in other softwares (delete word under the cursor)
vim.keymap.set("n", "<C-BS>", "daw", { remap = true, silent = true })
vim.keymap.set("i", "<C-BS>", "<esc>caw", { remap = true, silent = true })
vim.keymap.set("n", "<M-BS>", "daw", { remap = true, silent = true })
vim.keymap.set("i", "<M-BS>", "<esc>caw", { remap = true, silent = true })

-- Restart language server
vim.keymap.set("n", "<leader>cx", ":LspRestart<CR>", { silent = true, desc = "Restart LSP" })

-- Open full line diagnostic in a floating window to see the full error message
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", { silent = true, desc = "Show full line diagnostic" })

-- Yank the line on `dd` only if it is non-empty
vim.keymap.set("n", "dd", function()
  if vim.fn.getline("."):match("^%s*$") then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Rename" })

-- Function to close diagnostic floats and other
-- taken from: https://www.reddit.com/r/neovim/comments/1335pfc/is_there_any_generic_simple_way_to_close_floating/ji918lo/
function Close_floats()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end

-- Execute selected code with SnipRun
vim.keymap.set({ "n", "x", "v" }, "<leader>cr", ":SnipRun<CR>", { desc = "Execute code", silent = true })
