return {
  {
    "stevearc/conform.nvim",
    ---@class ConformOpts
    opts = {
      -- This is where you can add custom formatters per file type
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        nix = { "alejandra" }
      },
      -- formatters = {
      --   biome = {
      --     command = "biome",
      --     args = {"check", "--write", "$FILENAME"},
      --     stdin = false
      --   }
      -- }
    },
  },
}
