return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- disable, replaced by harpoon
    { "<leader><leader>", false },
    -- change a keymap
    { "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
    -- looks like when using this, the cwd_only option is not working
    -- { "<leader>ff", "<cmd>Telescope smart_open<cr>", desc = "Find Files (Smart open)" },
    {
      "<leader>ff",
      "<cmd>lua require('telescope').extensions.smart_open.smart_open({cwd_only = true, follow = true})<cr>",
      desc = "Find Files (Smart open)",
    },
    { "<leader>sy", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
    { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Modified Files" },
    -- {
    --   "<leader>fg",
    --   "<cmd>lua require('telescope').extensions.changed_files.actions.find_changed_files()<cr>",
    --   desc = "Find Changed Files",
    -- },
    -- {
    --   "<leader>sg",
    --   "<cmd>Telescope live_grep hidden=true no_ignore=true<cr>",
    --   desc = "Grep (root dir22)",
    -- },
  },
  opts = {
    pickers = {
      colorscheme = {
        enable_preview = true,
      },
      find_files = {
        follow = true,
      },
    },
    defaults = {
      -- VSCode like file path in telescope (name of the file first and then the path)
      path_display = {
        filename_first = {
          reverse_directories = false,
        },
      },
      mappings = {
        i = {
          -- Cycle through search history
          ["<C-j>"] = require("telescope.actions").cycle_history_next,
          ["<C-k>"] = require("telescope.actions").cycle_history_prev,
        },
      },

    },
  },
}
