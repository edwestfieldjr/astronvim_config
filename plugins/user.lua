return {
  -- installed by user on 2023-05-29: https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    -- event = edit_events,
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
    init = function()
      require("hologram").setup {
        auto_display = true, -- WIP automatic markdown image display, may be prone to breakini
      }
    end,
  },
}
