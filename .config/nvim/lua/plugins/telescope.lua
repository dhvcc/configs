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
    },
  }
}
