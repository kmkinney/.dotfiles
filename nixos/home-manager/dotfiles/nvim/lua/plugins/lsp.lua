-- NOTE: LSP Plugins

return {
  { "github/copilot.vim" },
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        rust_analyzer = {
          mason = false
        }
      },
    },
  },
  -- This stops copilot from breaking
  {
    "L3MON4D3/LuaSnip",
    ---@class PluginLspOpts
    keys = function()
      return {}
    end,
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
        -- "rust-analyzer",
        "prettierd",
        "black",
      },
    },
  },
}
