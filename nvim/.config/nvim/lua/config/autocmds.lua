-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Attach twoslash-queries to vtsls
require("lspconfig")["vtsls"].setup({
  on_attach = function(client, bufnr)
    require("twoslash-queries").attach(client, bufnr)
  end,
})

-- Auto save all the things
vim.api.nvim_create_autocmd(
  { "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
  { desc = "autosave", pattern = "*", command = "silent! update" }
)

-- Setup the :TSC command to get project-wide diagnostics
require("tsc").setup({
  run_as_monorepo = true,
})

-- When renaming, display the new name as live preview in the buffer
-- https://github.com/smjonas/inc-rename.nvim
require("inc_rename").setup({
  input_buffer_type = "dressing",
})

-- Close on "q"
-- https://www.reddit.com/r/neovim/comments/1i2xw2m/share_your_favorite_autocmds/m7ies9g/
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "man",
    "checkhealth",
    "neotest-output-panel",
    "neotest-summary",
    "lazy",
  },
  command = [[
          nnoremap <buffer><silent> q :close<CR>
          nnoremap <buffer><silent> <ESC> :close<CR>
          set nobuflisted
      ]],
})

-- TODO: Find a way to implement this to send eslint errors to quickfix
-- https://notes.eliasnorrby.com/vim/eslint-quickfix
-- set makeprg=npx\ eslint\ -f\ unix\ --quiet\ 'src/**/*.{js,ts,jsx,tsx}'
-- :make

-- Copy relative path of current buffer to the system clipboard
-- Taken from https://www.reddit.com/r/neovim/comments/u221as/how_can_i_copy_the_current_buffers_relative_path/
vim.api.nvim_create_user_command("CopyPath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("" .. path .. '" to the clipboard!')
end, {})

