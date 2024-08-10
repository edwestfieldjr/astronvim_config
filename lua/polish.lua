-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    mysql = "sql",
  },
  filename = {
    ["mysql"] = "sql",
  },
  pattern = {
    ["~/%.config/mysql/.*"] = "sql",
  },
}

-- Enable & customize spell checking
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.api.nvim_set_hl(
  0, -- global highlight group
  "SpellBad",
  { fg = "PaleGoldenRod", bg = "darkred", underline = true }
)
