-- NOTE: LSP Plugins

return {
  { "luckasRanarison/tree-sitter-hypr" },
  { "github/copilot.vim" },
  { "simrat39/rust-tools.nvim" },
  {
    "L3MON4D3/LuaSnip",
    ---@class PluginLspOpts
    keys = function()
      return {}
    end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   ---@class PluginLspOpts
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = {
  --       nls.builtins.formatting.stylua,
  --       nls.builtins.formatting.shfmt,
  --       nls.builtins.formatting.prettierd,
  --       nls.builtins.formatting.black,
  --     }
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        -- eslint = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git")(...)
        --   end,
        -- },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    ---@class PluginLspOpts
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        "json-lsp",
        "tailwindcss-language-server",
        "css-lsp",
        "rust-analyzer",
        "prettierd",
        "black",
      },
    },
  },
}
