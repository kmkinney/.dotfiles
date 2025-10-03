-- NOTE: LSP Plugins

return {
  { "jmbuhr/otter.nvim" },
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        vtsls = false,

        -- vtsls = {
        --   typescript = {
        --     updateImportsOnFileMove = { enabled = "always" },
        --     suggest = {
        --       completeFunctionCalls = true,
        --     },
        --     inlayHints = {
        --       enabled = false,
        --     },
        --   },
        -- },
        tsserver = false,
        tsgo = {
          mason = false,
        },
        biome = {
          mason = false,
        },
        eslint = false,
        rust_analyzer = false,
        -- rust_analyzer = {
        --   mason = false,
        -- },
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
    "mason-org/mason.nvim",
    ---@class PluginLspOpts
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        "json-lsp",
        "tailwindcss-language-server",
        "css-lsp",
        "prettierd",
        "black",
      },
    },
  },
}
