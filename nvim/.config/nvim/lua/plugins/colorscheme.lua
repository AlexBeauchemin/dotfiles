vim.g.material_style = "deep ocean"
vim.g.nord_disable_background = true

return {
  {
    "marko-cerovac/material.nvim",
    -- "folke/tokyonight.nvim",
    -- opts = { transparent = true, styles = { sidebars = "transparent", floats = "transparent" } },
    opts = {
      disable = {
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
      },
      contrast = {
        -- cursorline = true,
      },
      custom_highlights = {
        CursorLine = { bg = "#202331" },
      },
      styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
      },
      lualine_style = "stealth",
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        "dashboard",
        -- "eyeliner",
        -- "fidget",
        "flash",
        "gitsigns",
        "harpoon",
        -- "hop",
        -- "illuminate",
        "indent-blankline",
        -- "lspsaga",
        "mini",
        "neogit",
        "neotest",
        "neo-tree",
        -- "neorg",
        "noice",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
        "nvim-notify",
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- mocha, macchiato
      transparent_background = true,
      term_colors = true,
    },
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "oled",
    },
  },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      -- vim.cmd([[colorscheme aura-dark]])
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_pickers = true,
      terminal_colors = true,
    },
  },
  {
    "aliqyan-21/darkvoid.nvim",
    -- Not sure why but when setting the opts object here, it prevent other colorschemes from loading properly
    -- ie: if I change the default colorscheme in colorscheme.lua, it won't apply on load
    -- opts = {
    -- transparent = true,
    -- glow = true,
    --   -- colors = {
    --     -- Make errors pop more
    --     -- error = "#f7547f",
    --   },
    -- },
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = true, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
      },
    },
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = true,
    },
  },
  {
    "shaunsingh/nord.nvim",
  },
  { "fcancelinha/nordern.nvim", branch = "master", priority = 1000 },
  -- https://github.com/olivercederborg/poimandres.nvim/issues/39
  -- There an issue with colors once lsp/treesitter kicks in
  {
    -- "olivercederborg/poimandres.nvim",
    "sponkurtus2/poimandres.nvim",
    -- dir = "~/web/poimandres.nvim", -- "olivercederborg/poimandres.nvim
    -- dev = true,
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_background = true,
        disable_float_background = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "moon",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  { "miikanissi/modus-themes.nvim", priority = 1000, opts = { transparent = false } },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "oldworld",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "modus",
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "material",
      -- colorscheme = "poimandres",
      -- colorscheme = "tokyobones",
      -- colorscheme = "aura-dark",
      -- colorscheme = "tokyonight",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "carbonfox",
      -- colorscheme = "darkvoid",
      -- colorscheme = "nordbones",
      -- colorscheme = "flow",
      -- colorscheme = "cyberdream",
      -- colorscheme = "nordern",
      -- colorscheme = "sakura",
      -- colorscheme = "lackluster-mint",
    },
  },
}
