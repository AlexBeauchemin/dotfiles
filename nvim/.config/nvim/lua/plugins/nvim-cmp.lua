-- Supertab setup https://www.lazyvim.org/configuration/recipes#supertab
-- INFO: This plugin was replaced by blink, can delete this file
return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  ---@param opts cmp.ConfigSchema
  -- opts = function(_, opts)
  --   local has_words_before = function()
  --     unpack = unpack or table.unpack
  --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --   end
  --
  --   local luasnip = require("luasnip")
  --   local cmp = require("cmp")
  --
  --   opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --     ["<Tab>"] = cmp.mapping(function(fallback)
  --       if cmp.visible() then
  --         -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --         cmp.select_next_item()
  --       -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --       -- this way you will only jump inside the snippet region
  --       elseif luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       elseif has_words_before() then
  --         cmp.complete()
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" }),
  --     ["<S-Tab>"] = cmp.mapping(function(fallback)
  --       if cmp.visible() then
  --         cmp.select_prev_item()
  --       elseif luasnip.jumpable(-1) then
  --         luasnip.jump(-1)
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" }),
  --   })
  -- end,
  -- Enable <Tab> and <S-Tab> to navigate cpm items
  -- Taken from https://github.com/sho-87/dotfiles/blob/master/nvim/lua/plugins/nvim-cmp.lua
  -- And from https://www.reddit.com/r/neovim/comments/12nnxbr/nvimcmp_without_broken_insert_navigation/jgfdb48/
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      -- Use <Tab> to navigate to next item in suggestions
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Disable autocomplete on "Enter", jump to a new line instead
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ select = false })
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Use shift+enter to use the first suggestion without using <Tab> to preselect it
      -- ["<S-CR>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() and cmp.get_active_entry() then
      --     cmp.confirm({ select = true })
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
    })
  end,
}
