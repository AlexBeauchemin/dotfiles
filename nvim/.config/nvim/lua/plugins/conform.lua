local biome_cache = {}

local function find_biome_in_tree(start_path)
  if biome_cache[start_path] then
    return biome_cache[start_path]
  end

  local current_dir = start_path

  while current_dir and current_dir ~= "/" do
    local biome_path = current_dir .. "/node_modules/.bin/biome"
    if vim.fn.executable(biome_path) == 1 then
      biome_cache[start_path] = biome_path
      return biome_path
    end

    -- Move up one directory
    local parent = vim.fn.fnamemodify(current_dir, ":h")
    if parent == current_dir then
      break
    end
    current_dir = parent
  end

  -- Fallback to global
  biome_cache[start_path] = "biome"
  return "biome"
end

-- Clear cache when changing directories
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    biome_cache = {}
  end,
})

return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      typescript = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
      typescriptreact = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
      json = {
        "biome",
        "prettier",
        stop_after_first = true,
      },
    },
    formatters = {
      biome = {
        require_cwd = true,
        -- Use the biome version used in the project
        -- command = "npx",
        -- args = { "biome", "format", "--stdin-file-path", "$FILENAME" },
        --
        -- This approach is fatser, the one above needs to spawn a node process on every save, making it slow
        command = function(self, ctx)
          -- Use the file's directory as starting point
          local file_dir = vim.fn.fnamemodify(ctx.filename, ":h")
          return find_biome_in_tree(file_dir)
        end,
        args = { "format", "--stdin-file-path", "$FILENAME" },
      },
    },
  },
}
