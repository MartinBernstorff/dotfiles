local M = {
}
function M.config()
  local treesitter = require "nvim-treesitter"
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "rust", "toml"}, -- put the language you want in this array
    auto_install = true,
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = true,       -- false will disable the whole extension
      additional_vim_regex_highlighting=false,
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M
