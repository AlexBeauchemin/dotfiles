--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "material"
vim.g.material_style = "deep ocean"
vim.opt.whichwrap = "b,s" -- doesn't jump to next/previous line when moving with "h"/"l"
vim.opt.scrolloff = 8 -- show 8 empty lines at eof
vim.opt.cmdheight = 1
-- vim.g.gitblame_date_format = "%r" -- use relative time for git blame

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

vim.opt.relativenumber = true
lvim.transparent_window = true
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch", "diff" }
lvim.builtin.lualine.sections.lualine_c = { "filename" }
lvim.builtin.lualine.on_config_done = function(lualine)
  local config = lualine.get_config()
  -- show the relative path of the file (from project root) instead of just the file name
  config.sections.lualine_c = {
    { 'filename',
      path = 1,
    }
  }
  lualine.setup(config)
end

vim.cmd([[autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>]]) -- close quickfix/definition window after selecting an item

-- Show lsp errors on hover
-- vim.opt.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- harpoon
lvim.keys.normal_mode["<leader><leader>"] = "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>"
lvim.builtin.which_key.mappings["a"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon - Add Mark" }
lvim.builtin.which_key.mappings["<leader>"] = {
  "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
  "Harpoon",
}
lvim.keys.normal_mode["<leader>1"] = "<CMD>lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<leader>2"] = "<CMD>lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<leader>3"] = "<CMD>lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<leader>4"] = "<CMD>lua require('harpoon.ui').nav_file(4)<CR>"

-- local whk_status, whk = pcall(require, "which-key")
-- if not whk_status then
--   return
-- end
-- whk.register {
--   ["<leader>1"] = { "<CMD>lua require('harpoon.ui').nav_file(1)<CR>", "Harpoon " },
--   ["<leader>2"] = { "<CMD>lua require('harpoon.ui').nav_file(2)<CR>", "Harpoon " },
--   ["<leader>3"] = { "<CMD>lua require('harpoon.ui').nav_file(3)<CR>", "Harpoon " },
--   ["<leader>4"] = { "<CMD>lua require('harpoon.ui').nav_file(4)<CR>", "Harpoon " },
-- }
lvim.keys.normal_mode["<leader>z"] = ":copen<cr>" -- focus QuickFix list
-- lvim.keys.normal_mode["<leader>p"] = "\"0p" -- paste from register at position 0
lvim.keys.normal_mode["L"] = ":bn<cr>" -- shift+l -> next buffer
lvim.keys.normal_mode["H"] = ":bp<cr>" -- shift+h -> previous buffer
lvim.keys.normal_mode["<leader>f"] = false
lvim.keys.normal_mode["<leader>sl"] = ":Telescope resume<cr>" -- reopen previous search results
lvim.keys.normal_mode["<leader>ff"] = ":Telescope git_files<cr>" -- reopen previous search results
lvim.keys.normal_mode["<leader>fl"] = ":Telescope resume<cr>" -- reopen previous search results
lvim.keys.normal_mode["<leader>fb"] = ":Telescope file_browser<cr>" -- replace file explorer, remove to bring back the explorer
lvim.keys.normal_mode["<leader>ft"] = ":Telescope current_buffer_fuzzy_find<cr>"
lvim.keys.normal_mode["<leader>fs"] = ":Telescope session-lens search_session<cr>"
lvim.keys.normal_mode["<leader>fp"] = ":Telescope yank_history<cr>"
lvim.keys.normal_mode["<leader>gg"] = ":LazyGit<CR>"
lvim.keys.normal_mode["<leader>h"] = ":cclose<CR>:TroubleClose<CR>:noh<CR>" -- close QuickFix window, trouble, and unhighlight search results
lvim.keys.normal_mode["<leader>dc"] = "oconsole.log()<ESC>F(a" -- shortcut for console.log()
lvim.keys.normal_mode["<leader>df"] = "oasync function x(): Promise<void> {}<ESC>Fxcl" -- shortcut for new function
lvim.keys.normal_mode["<leader>dd"] = ":Dirbuf<CR>"
lvim.keys.normal_mode["<leader>ds"] = ":DirbufSync -confirm<CR>"
vim.cmd("vmap y ygv<Esc>") -- after yanking text, stay at the end of selection instead of going back to the start of the selection
-- vim.cmd([[
--   nnoremap <Leader>xx <cmd>TroubleToggle<cr>
--   nnoremap <Leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
--   nnoremap <Leader>xd <cmd>TroubleToggle document_diagnostics<cr>
--   nnoremap <Leader>xq <cmd>TroubleToggle quickfix<cr>
--   nnoremap <Leader>xl <cmd>TroubleToggle loclist<cr>
-- ]])

-- yanky mappings
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Allow project-specific rules by loading .nvimrc from projects, see https://alpha2phi.medium.com/vim-neovim-managing-multiple-project-settings-b5b6a3a94dd0
-- vim.cmd("set secure exrc")

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["x"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- PERSONAL CUSTOM MAPPINGS
-- lvim.keys.normal_mode["<leader>b"] = ":NvimTreeToggle<cr>" -- use space+e instead
-- vim.keymap.set("n", "<C-l>", ":nohl<CR><C-l>", { noremap = true, silent = true }) -- clear search highlight, use space+h instead


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  --  "c",
  "javascript",
  "json",
  "lua",
  --  "python",
  "typescript",
  "tsx",
  "css",
  --  "rust",
  --  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "eslint", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json" } },
-- }

lvim.lsp.installer.setup.ensure_installed = {
  -- "eslint",
  "eslint_d",
  "null-ls",
  "prettier",
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript" },
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- args = { "--print-width", "100" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

lvim.plugins = {
  { "EdenEast/nightfox.nvim" },
  { "navarasu/onedark.nvim" },
  { "morhetz/gruvbox" },
  { "arcticicestudio/nord-vim" },
  { "dracula/vim" },
  -- { "folke/tokyonight.nvim" },
  { "marko-cerovac/material.nvim" },
  { "f-person/git-blame.nvim" },
  { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { "tpope/vim-surround" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-treesitter/nvim-treesitter-context" }, -- show function name at the top if it's out of view
  { "mhinz/vim-signify" }, -- show git hunks/modifications on the left
  { "kdheepak/lazygit.nvim" },
  { "ThePrimeagen/harpoon" },
  { "rmagatti/auto-session" },
  { "rmagatti/session-lens" },
  { "tpope/vim-unimpaired" },
  { "gbprod/yanky.nvim", config = function()
    require("yanky").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end },
  { "elihunter173/dirbuf.nvim", config = function()
    require("nvim-tree").setup {
      -- update_to_buf_dir = { enable = false }
    }
  end },
  -- { "folke/persistence.nvim" },
  -- { "ggandor/leap.nvim" },
  -- { "preservim/tagbar" }, -- show sidebar with list of functions and vars in a file
  -- { "wfxr/minimap.vim" },
  -- { "svermeulen/vim-cutlass" } -- change the behavior of "c" and "d" to not override the register
}

-- require('leap').set_default_keymaps()
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
require("telescope").load_extension "yank_history"
-- vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 1
-- -- vim.g.minimap_auto_start_win_enter = 1
-- vim.g.minimap_close_buftypes = { "nofile" }
-- vim.g.minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', 'NvimTree' }
-- vim.g.minimap_left = 1

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
