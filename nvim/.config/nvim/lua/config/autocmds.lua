-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Attach twoslash-queries to vtsls
-- require("lspconfig")["vtsls"].setup({
--   on_attach = function(client, bufnr)
--     require("twoslash-queries").attach(client, bufnr)
--   end,
-- })
-- INFO: Using this instead of the above, as the above on_attach seems to override any config I set in nvim-lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    elseif client.name == "vtsls" then
      require("twoslash-queries").attach(client, args.buf)
    elseif client.name == "tsgo" then
      require("twoslash-queries").attach(client, args.buf)
    end
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

-- https://www.reddit.com/r/neovim/comments/1iu04ut/whats_this_weird_character_dont_think_its_a/mdx6xob/
-- https://github.com/yedhink/dotfiles_ikigai/blob/main/.config/nvim/init.lua#L134-L158
-- When copy pasting from PDFs, replace weird characters with their popular equivalents
vim.api.nvim_create_user_command("FixWeirdChars", function()
  local weird_chars_map = {
    ["\u{00A0}"] = " ", -- Non-breaking space → Normal space
    ["\u{200B}"] = "", -- Zero-width space → Remove
    ["\u{202F}"] = " ", -- Narrow no-break space → Normal space
    ["\u{2060}"] = "", -- Word joiner → Remove
    ["\u{201C}"] = '"', -- Left double quotation mark → Normal double quote
    ["\u{201D}"] = '"', -- Right double quotation mark → Normal double quote
    ["\u{2018}"] = "'", -- Left single quotation mark → Normal apostrophe
    ["\u{2019}"] = "'", -- Right single quotation mark → Normal apostrophe
    ["\u{2212}"] = "-", -- Minus sign (−) → Normal hyphen (-)
    ["\u{FF0C}"] = ",", -- Full-width comma (，) → Normal comma (,)
  }
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for i, line in ipairs(lines) do
    for char, replacement in pairs(weird_chars_map) do
      line = line:gsub(char, replacement)
    end
    lines[i] = line
  end
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.opt_local.modified = false
end, {})

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

vim.lsp.config["tsgo"] = {
  cmd = { "tsgo", "--lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git", "tsconfig.base.json" },
}
vim.lsp.enable("tsgo")
