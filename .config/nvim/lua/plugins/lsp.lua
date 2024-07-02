return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "dockerls",
        "docker_compose_language_service",
        "pyright",
        "gopls",
        "tsserver",
        "ansiblels",
        "bashls",
        "lua_ls",
        -- "nginx_language_server",
      },
    })

    vim.keymap.set('n', '<S-k>', vim.lsp.buf.hover, bufopts)
  end
}
