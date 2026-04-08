vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, { desc = "Show LSP health information" })

vim.api.nvim_create_user_command("LspClients", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  vim.print(vim.tbl_map(function(client)
    return client.name
  end, clients))
end, { desc = "Show active LSP clients for the current buffer" })
