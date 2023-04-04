local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter_configs.setup {
  ensure_installed = {
      "python",
      "c",
      "cpp",
      "lua",
      "cpp",
      "bash",
      "javascript",
      "typescript",
      "json",
      "markdown",
      "markdown_inline"
  },
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true, -- false will disable the whole extension
    custom_captures = {
      ["h1"] = "markdownH2",
      ["_h1"] = "_h1",
      ["h2"] = "h2",
      ["_h2"] = "_h2",
      ["h3"] = "h3",
      ["_h3"] = "_h3",
      ["h4"] = "h4",
      ["_h4"] = "_h4",
      ["h5"] = "h5",
      ["_h5"] = "_h5",
    },
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
