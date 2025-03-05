return {
  "adalessa/laravel.nvim",
  lazy = true,
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>pa", ":Laravel artisan<cr>" },
    { "<leader>pr", ":Laravel routes<cr>" },
    { "<leader>pm", ":Laravel related<cr>" },
  },
  opts = {
    lsp_server = "intelephense",
  },
  config = true,
}
