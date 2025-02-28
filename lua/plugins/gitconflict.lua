return {
  "akinsho/git-conflict.nvim",
  version = "*",
  lazy = false,
  opts = {
    default_mappings = true,
    default_commands = true,
  },
  config = function(_, opts)
    require("git-conflict").setup(opts)
  end,
}
