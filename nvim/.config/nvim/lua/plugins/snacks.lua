return {
  "snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      layout = "telescope",
      formatters = {
        file = {
          -- filename_first = true,
        },
      },
      -- filter = {
      --   cwd = true,
      -- },
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          layout = { layout = { position = "right" } },
          hidden = true,
        },
      },
      -----------------------------------------------------------
      -- WORKAROUND: Neovim 0.12 prompt buffer cursor jump bug
      -- On Neovim 0.12+, a right_align virtual text extmark in
      -- snacks picker input (the spinner/totals display) causes
      -- the cursor to miscalculate its column at EOL on prompt
      -- buffers, pushing the cursor back after the first char.
      -- Setting virtualedit="all" on the input window prevents
      -- the cursor from snapping to invalid positions.
      --
      -- Upstream issues:
      --   https://github.com/folke/snacks.nvim/issues/2810
      --   https://github.com/folke/snacks.nvim/issues/2796
      --   https://github.com/folke/snacks.nvim/issues/2707
      --
      -- TODO: Check if a fix has been pushed or if this is still necessary
      -- Update: It seems the issue is with mawkler/modicator.nvim, disabling that plugin fixes the issue
      -----------------------------------------------------------
      -- win = {
      --   input = {
      --     wo = {
      --       virtualedit = "all",
      --     },
      --   },
      -- },
    },
    dashboard = {
      preset = {
        header = [[
██████╗ ██╗   ██╗███████╗███████╗
██╔══██╗██║   ██║██╔════╝██╔════╝
██████╔╝██║   ██║█████╗  █████╗  
██╔═══╝ ██║   ██║██╔══╝  ██╔══╝  
██║     ╚██████╔╝██║     ██║     
╚═╝      ╚═════╝ ╚═╝     ╚═╝     ]],
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader><space>", false },
    { "<leader>ff", false },
    -- { "<leader>ff", LazyVim.pick("smart"), desc = "Find Files (smart)" },
    -- { "<leader>uC", function() Snacks.picker.colorschemes({ layout = { preset = "vscode" } }) end, desc = "Colorschemes" },
  },
}
