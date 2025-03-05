return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
          languages = {
            php_only = "// %s",
            php = "// %s",
          },
          custom_calculation = function(node, language_tree)
            if vim.bo.filetype == "blade" then
              if language_tree._lang == "html" then
                return "{{-- %s --}}"
              else
                return "// %s"
              end
            end
          end,
        },
      },
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "http",
        "json",
        "scss",
        "vim",
        "lua",
        "c_sharp",
        "vue",
        -- "blade",
        "html",
        "dockerfile",
        "git_config",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "comment",
        "make",
        "markdown",
        "php",
        "php_only",
        "phpdoc",
        "python",
        "rust",
        "sql",
        "xml",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },
  -- Currently unable to install the blade parser
  -- config = function(_, opts)
  --   ---@class ParserInfo[]
  --   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  --
  --   parser_config.blade = {
  --     install_info = {
  --       url = "https://github.com/EmranMR/tree-sitter-blade",
  --       files = { "src/parser.c" },
  --       branch = "main",
  --       generate_requires_npm = true,
  --       requires_generate_from_grammar = true,
  --     },
  --     filetype = "blade",
  --   }
  --
  --   vim.filetype.add({
  --     pattern = {
  --       [".*%.blade%.php"] = "blade",
  --     },
  --   })
  --
  --   require("nvim-treesitter.configs").setup(opts)
  -- end,
}
