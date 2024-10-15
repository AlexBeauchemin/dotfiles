vim.g.material_style = "deep ocean"

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
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyobones",
      colorscheme = "material",
      -- colorscheme = "aura-dark",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "carbonfox",
      -- colorscheme = "poimandres",
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
