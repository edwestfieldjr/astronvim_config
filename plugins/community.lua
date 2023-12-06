return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
      },
    },
  },

  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },

  { import = "astrocommunity.file-explorer.oil-nvim" },
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
        max_width = 100,
        max_height = 80,
      },
    },
    init = function()
      vim.keymap.set("n", "<A-2>", require("oil").toggle_float, { desc = "Toogle Oil" })
      vim.keymap.set("n", "<A-3>", require("oil").toggle_hidden, { desc = "Oil: Toogle Hidden" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { import = "astrocommunity.editing-support.auto-save-nvim" },
  {
    "pocco81/auto-save.nvim", -- HACK: use fork until PR is accepted: https://github.com/AstroNvim/astrocommunity/pull/511
    init = function() vim.keymap.set("n", "<leader>v", ":ASToggle<CR>", { desc = "toggle auto-save" }) end,
  },

  { import = "astrocommunity.color.ccc-nvim" },
  {
    "uga-rosa/ccc.nvim",
    init = function()
      local ccc = require "ccc"
      ccc.setup {
        -- Your preferred settings
        -- Example: enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        pickers = {
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.css_hwb,
          ccc.picker.css_lab,
          ccc.picker.css_lch,
          ccc.picker.css_oklab,
          ccc.picker.css_oklch,
          ccc.picker.css_name,
        },
        convert = {
          { ccc.picker.hex, ccc.output.css_rgb },
          { ccc.picker.css_rgb, ccc.output.hex },
        },
        mappings = {
          ["<Esc>"] = ccc.mapping.quit;
        }
      }
    end,
  },
}
