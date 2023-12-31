local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end


local mappings = {
  ["r"] = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
  ["t"] = { "<cmd>ToggleTerm direction=float<cr>", "Floating terminal" },
  b = {
    "Buffer",
    v = { "<cmd>vsplit<cr>", "Split vertically" },
    q = { "<cmd>q<cr>", "Quit window" },
  },
  d = { "Debug",
    {
      b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle break point"},
      c = { "<cmd>DapContinue<cr>", "Continue"},
      e = { "<cmd>lua require('dapui').eval()<cr>", "Evaluate" },
      r = { "<cmd>DapRestartFrame<cr>", "Restart"},
      s = { "<cmd>DapTerminate<cr>", "Stop"},
    }
  },
  f = { "File",
    {
      o = { "<cmd>:Telescope git_files<cr>", "Open file browser" },
      s = { "<cmd>:Telescope live_grep<cr>", "Search for files" },
    }
  },
  g = { "Git", {
    s = {
      "<cmd>Git<cr>", "[S]tatus" }
    },
    p = {
      "<cmd>Git push<cr>", "Push",
    }
  },
  j = {
    "Jump",
    {
      o = {
        "<cmd>SymbolsOutline<cr>", "Outline of symbols",
      },
      i = {
        "<cmd>Telescope lsp_document_symbols symbols=class,function,struct,enum<cr>", "Symbols [i]n document",
      },
      w = {
        "<cmd>Telescope lsp_workspace_symbols symbols=class,function,struct,enum<cr>", "Symbols in [w]orkspace"
      }

    }},
  p = { "Projects", 
    s = { "<cmd>Telescope projects<cr>", "[S]earch projects"}
  },
  q = { "Quit",
    a = { "<cmd>wqa<cr>", "Quit [a]ll"},
  },
  u = { "<cmd>UndotreeToggle<cr>", "Undotree"},
  w = { "<cmd>bd<cr>", "Close editor" },
  U = { "UI", {
    t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
  }
  },
  ["1"] = { "<cmd>:exe 1 'wincmd w' <cr>", "Focus buffer 1" },
  ["2"] = { "<cmd>:exe 2 'wincmd w' <cr>", "Focus buffer 2" },
  ["3"] = { "<cmd>:exe 3 'wincmd w' <cr>", "Focus buffer 3" },
  ["4"] = { "<cmd>:exe 4 'wincmd w' <cr>", "Focus buffer 4" },
  ["5"] = { "<cmd>:exe 5 'wincmd w' <cr>", "Focus buffer 5" },
  ["6"] = { "<cmd>:exe 6 'wincmd w' <cr>", "Focus buffer 6" },
  ["7"] = { "<cmd>:exe 7 'wincmd w' <cr>", "Focus buffer 7" },
  ["8"] = { "<cmd>:exe 8 'wincmd w' <cr>", "Focus buffer 8" },
  ["9"] = { "<cmd>:exe 9 'wincmd w' <cr>", "Focus buffer 9" },
}

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = {"n", "v"},     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}


which_key.setup(setup)
which_key.register(mappings, opts)
