return {
  "zbirenbaum/copilot.lua",
  opts = {
    -- Use the correct node version for copilot, it requires v22+ but some of my projects use node v20 via fnm
    -- Remove this once all my projects are on v22+
    copilot_node_command = vim.fn.expand("~/.local/share/fnm/aliases/default/bin/node"),
  },
}
