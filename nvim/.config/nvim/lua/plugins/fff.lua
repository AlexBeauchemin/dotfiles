return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    -- this will download prebuild binary or try to use existing rustup toolchain to build from source
    -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    -- pass here all the options
    -- prompt = '🪿 ',
    prompt = "⚡ ",
  },
  lazy = false,
  keys = {
    {
      "ff",
      function()
        require("fff").find_files() -- or find_in_git_root() if you only want git files
      end,
      desc = "FFFind files",
    },
  },
}
