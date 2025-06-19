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

-- Run biome lint and send report to quickfix

local function find_biome_executable()
  local cwd = vim.fn.getcwd()

  -- Check for local biome executable in node_modules
  local paths_to_check = {
    cwd .. "/node_modules/.bin/biome",
    cwd .. "/../node_modules/.bin/biome",
    cwd .. "/../../node_modules/.bin/biome",
  }

  for _, path in ipairs(paths_to_check) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  -- Fallback to npx with specific version
  return "npx @biomejs/biome@v2"
end

local function biome_lint()
  local file = vim.fn.expand("%")
  local biome_cmd = find_biome_executable()

  -- Redirect stderr to /dev/null to hide the warning
  local cmd = biome_cmd
    .. " lint --diagnostic-level=error --reporter=json "
    -- .. vim.fn.shellescape(file)
    .. " 2>/dev/null"
  local output = vim.fn.system(cmd)

  if vim.trim(output) == "" then
    print("No Biome issues found")
    vim.fn.setqflist({})
    return
  end

  local ok, json_data = pcall(vim.fn.json_decode, output)
  if not ok then
    print("Failed to parse Biome JSON output")
    return
  end

  local qf_list = {}

  if json_data.diagnostics then
    for _, diagnostic in ipairs(json_data.diagnostics) do
      local location = diagnostic.location
      if location and location.path then
        -- Parse line/column from span and source code
        local line = 1
        local col = 1

        if location.span and location.sourceCode then
          local start_pos = location.span[1]
          local source_lines = vim.split(location.sourceCode, "\n")
          local char_count = 0

          for line_num, line_content in ipairs(source_lines) do
            if char_count + #line_content >= start_pos then
              line = line_num
              col = start_pos - char_count + 1
              break
            end
            char_count = char_count + #line_content + 1 -- +1 for newline
          end
        end

        table.insert(qf_list, {
          filename = location.path.file,
          lnum = line,
          col = col,
          type = diagnostic.severity == "error" and "E" or "W",
          text = diagnostic.category .. ": " .. diagnostic.description,
        })
      end
    end
  end

  vim.fn.setqflist(qf_list)
  if #qf_list > 0 then
    vim.cmd("copen")
    print("Found " .. #qf_list .. " Biome issue(s)")
  else
    print("No Biome issues found")
  end
end

vim.api.nvim_create_user_command("BiomeLint", biome_lint, {})
