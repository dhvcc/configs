return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp = require("cmp")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

    -- Configure completion
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    })

    -- Common on_attach function for LSP related keymaps and settings
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end

    -- Common on_attach function for LSP related keymaps and settings
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end

    -- Function to find Python virtual environment
    local function get_python_venv(workspace)
      local util = require('lspconfig.util')
      local path = util.path
      local venv_paths = {
        workspace .. '/.venv',
        workspace .. '/venv',
      }
      for _, venv_path in ipairs(venv_paths) do
        if path.exists(venv_path) then
          return venv_path
        end
      end
      return nil
    end

    -- Configure Python (pyright)
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      before_init = function(_, config)
        local venv = get_python_venv(config.root_dir)
        if venv then
          config.settings.python.pythonPath = venv .. '/bin/python'
        end
      end,
    })

    -- Configure TypeScript (tsserver)
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Configure Go (gopls)
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
}