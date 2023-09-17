local edit_events = {
  "TextChanged",
  "TextChangedI",
  "BufEnter",
  "BufWinEnter",
  "BufLeave",
  "InsertEnter",
  "InsertChange",
  "InsertLeave",
  "BufNewFile",
  "BufReadPre",
  "BufRead",
  "BufReadPost",
  "FileReadPre",
  "FileReadPost",
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --   {
  -- installed by user on 2023-05-16: https://github.com/
  -- {
  --   "Pocco81/auto-save.nvim",
  --   cmd = { "ASToggle" },
  --   -- lazy = false,
  --   event = edit_events,
  --   config = function() require("auto-save").setup() end,
  -- },
  --
  -- installed by user on 2023-05-16: https://github.com/codota/tabnine-nvim
  -- {
  --   "codota/tabnine-nvim",
  --   event = edit_events,
  --   -- lazy = false,
  --   config = function()
  --     require("tabnine").setup {
  --       disable_auto_comment = true,
  --       accept_keymap = "<M-Tab>",
  --       dismiss_keymap = "<M-Esc>",
  --       debounce_ms = 800,
  --       suggestion_color = { gui = "#808080", cterm = 244 },
  --       exclude_filetypes = { "TelescopePrompt" },
  --       log_file_path = nil, -- absolute path to Tabnine log file
  --     }
  --   end,
  --   build = "./dl_binaries.sh",
  -- },

  -- installed by user on 2023-05-20: https://github.com/stevearc/oil.nvim
  -- {
  --   "stevearc/oil.nvim",
  --   opts = {
  --     default_file_explorer = false,
  --     view_options = {
  --       show_hidden = true,
  --     },
  --     float = {
  --       padding = 4,
  --       max_width = 100,
  --       max_height = 80,
  --     },
  --   },
  --   init = function()
  --     vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open Oil (press '-' again for parent dir)" })
  --   end,
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function(this)
  --     require("oil").setup(this.opts)
  --   end,
  -- },

  -- installed by user on 2023-05-29: https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    event = edit_events,
    init = function()
      vim.cmd "let g:VM_maps = {}"
      vim.cmd "let g:VM_maps['Find Under'] = '<C-x>'"
      vim.cmd "let g:VM_maps['Find Subword Under'] = '<C-x>'"
    end,
    --      override to ensure lsp automatically on new/open file
  },

  -- installed by user on 2023-05-30: https://github.com/barrett-ruth/live-server.nvim
  {
    "barrett-ruth/live-server.nvim",
    build = "npm i -g live-server",
    ft = { "html", "css", "javascript" },
    init = function()
      vim.keymap.set("n", "=", ":LiveServerStart<CR>", { desc = "Start Live Server" })
      vim.keymap.set("n", "<C-=>", ":LiveServerStop<CR>", { desc = "Stop Live Server" })
    end,
    config = function() require("live-server").setup() end,
  },

  -- installed by user on 2023-09-15: https://github.com/edluffy/hologram.nvim
  {
    "edluffy/hologram.nvim",
    event = edit_events,
    config = function()
      require("hologram").setup {
        auto_display = true, -- WIP automatic markdown image display, may be prone to breakini
      }
    end,
  },
}
