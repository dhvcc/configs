return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "folke/neodev.nvim", -- Add this for better Neovim config development
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp = require("cmp")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup neodev for Neovim Lua development
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })

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
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
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
      -- Mappings
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    end


    local on_attach_python = function(client, bufnr)
      -- Function to find Python virtual environment
      local function get_python_venv(workspace)
        local util = require('lspconfig.util')
        local path = util.path
        local home = os.getenv("HOME")

        local hasPoetry = vim.fn.executable("poetry") == 1
        if hasPoetry then
          local poetryPath = vim.fn.system("poetry -C " .. workspace .. " env info --path")
          if vim.v.shell_error == 0 and poetryPath ~= "" then
            return poetryPath
          end
        end

        -- Function to check for venv in a directory
        local function check_venv(dir)
          local venv_paths = {
            path.join(dir, '.venv'),
            path.join(dir, 'venv'),
          }
          for _, venv_path in ipairs(venv_paths) do
            -- vim.notify("Checking for venv in: " .. venv_path)
            if path.exists(venv_path) then
              return venv_path
            end
          end
          return nil
        end

        -- Start from the workspace and move up to parent directories
        local current_dir = workspace
        while current_dir ~= home and current_dir ~= "/" do
          local venv = check_venv(current_dir)
          if venv then
            return venv
          end
          current_dir = path.dirname(current_dir)
        end

        -- Check home directory as the last resort
        return check_venv(home)
      end

      local venv = get_python_venv(vim.fn.expand('%:p'))
      if venv then
        client.config.settings.python.pythonPath = venv .. '/bin/python'
      end
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      on_attach(client, bufnr)
    end

    -- Configure Python (pyright)
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach_python,
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

    
    -- Configure Lua (lua_ls)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end
}