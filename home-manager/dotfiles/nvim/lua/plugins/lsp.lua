-- NOTE: LSP Plugins

return {
  { "jmbuhr/otter.nvim" },
  { "simrat39/rust-tools.nvim" },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local grp = vim.api.nvim_create_augroup("BiomeFixOnSave", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = grp,
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.jsonc" },
        callback = function()
          -- Apply Biome safe fixes (and organize imports) via LSP code actions
          vim.lsp.buf.code_action({
            context = { only = { "source.fixAll.biome", "source.organizeImports.biome", "source.action.useSortedKeys.biome" } },
            apply = true,
          })
        end,
      })
    end,
    -- setup = {
    --   biome = function()
    --   end
    -- },
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
        cue = { mason = false },
        tsserver = false,
        tsgo = { mason = false, },
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
