return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    pickers = {
      find_files = {
        find_command = {
          'rg',
          '--ignore-vcs',
          '--hidden',
          '--files',
          '--glob=!.git',
          '--glob=!venv',
          '--glob=!.venv',
          '--glob=!.cache',
          '--glob=!venvs',
          '--glob=!virtualenv',
          '--glob=!virtualenvs',
          '--glob=!site-packages',
          '--glob=!__pycache__',
          '--glob=!node_modules',
          '--glob=!.vscode-server',
        },

      },
    },
    defaults = {
      prompt_prefix = '=> ',
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            vim.notify("cd")
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent cd %s", dir))
          end
        }
      },
    },
  },
  keys = {
    { 'ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
    { '<C-p>', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
    { 'fs', function() require('telescope.builtin').live_grep() end, desc = 'Find String' },
    { 'fb', function() require('telescope.builtin').buffers() end, desc = 'Find Buffers' },
    { 'fh', function() require('telescope.builtin').help_tags() end, desc = 'Find Help' },
  },
  -- Grep and find files ignore VCS and do faf fas to do find all
}

