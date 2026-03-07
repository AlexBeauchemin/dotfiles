return {
  "NickvanDyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on `opencode_opts`.
    }

    -- Required for `vim.g.opencode_opts.auto_reload`.
    vim.o.autoread = true

    -- Recommended/example keymaps.
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask about this" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "Select prompt" })
    vim.keymap.set({ "n", "x" }, "<leader>o+", function()
      require("opencode").prompt("@this")
    end, { desc = "Add this" })
    vim.keymap.set("n", "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "Toggle embedded" })
    vim.keymap.set("n", "<leader>oc", function()
      require("opencode").command()
    end, { desc = "Select command" })
    vim.keymap.set("n", "<leader>on", function()
      require("opencode").command("session_new")
    end, { desc = "New session" })
    vim.keymap.set("n", "<leader>oi", function()
      require("opencode").command("session_interrupt")
    end, { desc = "Interrupt session" })
    vim.keymap.set("n", "<leader>oA", function()
      require("opencode").command("agent_cycle")
    end, { desc = "Cycle selected agent" })
    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("messages_half_page_up")
    end, { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("messages_half_page_down")
    end, { desc = "Messages half page down" })
  end,
}
