-- NOTE: LSP Plugins

return {
  { "github/copilot.vim" },
  { "jmbuhr/otter.nvim" },
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- tsserver = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git")(...)
        --   end,
        -- },
        vtsls = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enabled = false,
            },
          },
        },
        rust_analyzer = {
          mason = false,
        },
        tsgo = {
          mason = false,
        },
      },
      -- Intercept setup for tsgo and register a native LSP config
      setup.tsgo = function(_, server_opts)
        -- Neovim 0.11+ way: define and enable a custom config
        -- (preferred; aligns with nvim-lspconfig’s current guidance)
        vim.lsp.config("tsgo", vim.tbl_deep_extend("force", {
          name = "tsgo",
          cmd = { "tsgo", "--lsp", "--stdio" },
          -- Adjust filetypes as tsgo evolves; TSX/JSX support is still in flux.
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          root_markers = { "tsconfig.json", "package.json", ".git" },
          single_file_support = true,
          capabilities = opts.capabilities, -- reuse LazyVim’s shared caps (inlay hints, etc.)
        }, server_opts or {}))

        vim.lsp.enable("tsgo")
        return true -- prevent LazyVim from calling lspconfig.setup() for this server
      end
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
