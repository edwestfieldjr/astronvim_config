-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- fix AutoSave/Autoformat/Undo Bug
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/879#issuecomment-1133925084
-- [ 1 / 2 ]
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.sql_formatter,
      -- null_ls.builtins.formatting.autopep8,
    }
    -- fix AutoSave/Autoformat/Undo Bug
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/879#issuecomment-1133925084
    -- [ 2 / 2 ]
    -- config.on_attach = function(client, bufnr)
    --   if client.supports_method "textDocument/formatting" then
    --     vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
    --       -- or vim.lsp.buf.formatting(bufnr) on 0.8
    --       vim.lsp.buf.formatting_sync()
    --     end, {})
    --
    --     -- you can leave this out if your on_attach is unique to null-ls,
    --     -- but if you share it with multiple servers, you'll want to keep it
    --     vim.api.nvim_clear_autocmds {
    --       group = augroup,
    --       buffer = bufnr,
    --     }
    --
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       group = augroup,
    --       buffer = bufnr,
    --       command = "undojoin | LspFormatting",
    --     })
    --   end
    -- end
    --

    return config -- return final config table
  end,
}
