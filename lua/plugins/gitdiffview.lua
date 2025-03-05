return {
  "sindrets/diffview.nvim",
  lazy = true,
  enabled = true,
  event = "BufRead",
  config = function()
    require("plugins.git.diffview")
  end,
  keys = {
    { "<Leader>gd", "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = "diff file" },
    { "<Leader>gS", "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>", desc = "status" },
  },
}
