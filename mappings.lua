-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local opts = { noremap = true, silent = true, nowait = true }
return {
  -- first key is the mode

  -- {n, v, i} = {},    -- local map = vim.keymap.set
  -- -- Add Neotree toggle keymap
  -- map(
  --   "<C-;>",
  --   "<Esc>:Neotree toggle<CR>",
  -- -- Move lines and blocks
  --   { desc = "Toggle Neotree", noremap = true, silent = true }
  -- )
  --   { "n", "v", "i" },
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
    ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
    ["<A-l>"] = { "yyp", desc = "Duplicate line" },
    -- [";"] = { ":", "Enter command mode" },
  },

  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move block down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "move block up" },
    ["<A-l>"] = { "Vy0P", desc = "Duplicate block" },
  },

  i = {
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move block down" },
    ["<A-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "move block up" },
    ["<A-l>"] = { "<Esc>yyp", desc = "Duplicate block" },
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
