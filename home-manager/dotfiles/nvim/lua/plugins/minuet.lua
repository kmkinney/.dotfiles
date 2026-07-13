-- Claude-powered completion for SQL buffers (copilot handles everything else)
-- Schema-aware: the compact roofworx schema is baked into the system prompt
-- and served from Anthropic's prompt cache (~0.1x price after first request).
return {
  {
    "milanglacier/minuet-ai.nvim",
    enabled = false, -- ponytail: inline Claude completion wasn't helpful, re-enable if reconsidered
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "sql", "mysql" },
    config = function()
      require("minuet").setup({
        provider = "claude",
        n_completions = 1, -- one suggestion per request; cheaper and faster
        provider_options = {
          claude = {
            model = "claude-sonnet-5",
            max_tokens = 512,
            api_key = "ANTHROPIC_API_KEY",
            stream = true,
            system = {
              -- default template + schema appended; keys below fill {{{placeholders}}}
              template = "{{{prompt}}}\n{{{guidelines}}}\n{{{n_completion_template}}}\n\n"
                .. "# Database schema\n"
                .. "MySQL (PlanetScale/Vitess), database `roofworx`. One line per table: name(col type, ...).\n"
                .. "Only use tables and columns that appear here:\n\n{{{schema}}}",
              schema = function()
                local f = io.open(vim.fn.expand("~/workspace/db/schema-compact.sql"), "r")
                if not f then
                  return "(schema file missing)"
                end
                local s = f:read("*a")
                f:close()
                return s
              end,
            },
            transform = {
              -- turn the system string into a block with cache_control so the
              -- ~19k-token schema prefix is cached across completions
              function(data)
                data.body.system = {
                  { type = "text", text = data.body.system, cache_control = { type = "ephemeral" } },
                }
                return data
              end,
            },
          },
        },
        virtualtext = {
          auto_trigger_ft = { "sql", "mysql" },
          keymap = {
            accept = "<A-a>",
            accept_line = "<A-l>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
      })
    end,
  },
}
