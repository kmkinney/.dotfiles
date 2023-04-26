-- NOTE: LSP Plugins

return {
  { "github/copilot.vim" },
  { "simrat39/rust-tools.nvim" },
  {
    "L3MON4D3/LuaSnip",
    ---@class PluginLspOpts
    keys = function()
      return {}
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ---@class PluginLspOpts
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.black,
      }
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
        "rust-analyzer",
        "black",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "javascript",
            "typescript",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L26
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
}
