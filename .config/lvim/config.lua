-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.transparent_window = true
vim.opt.relativenumber = true -- relative line numbers

lvim.plugins = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },
  { -- Inline git blame
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = true }
    end,
  },
  { -- Function signature as you type
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup({})
    end,
  },
  { -- Repeat last command with .
    "tpope/vim-repeat"
  },
  { -- Outline (LSP structure)
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    config = function()
      require("outline").setup({})
      lvim.builtin.which_key.mappings["s"] = {
        "<cmd>Outline<CR>", "Toggle outline",
      }
    end
  },
  { -- Highlight TODOs
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- THEMES --
  { 'tomasiser/vim-code-dark' },
  { 'Mofiqul/vscode.nvim' },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({ style = 'warmer' })
    end
  },
  -- THEMES --
}

lvim.colorscheme = "vscode"

lvim.builtin.nvimtree.on = true
lvim.keys.normal_mode["<C-b>"] = ":NvimTreeToggle<CR>"

lvim.builtin.which_key.mappings["h"] = { "<C-w>h", "Move to split to the left" }
lvim.builtin.which_key.mappings["j"] = { "<C-w>j", "Move to split below" }
lvim.builtin.which_key.mappings["k"] = { "<C-w>k", "Move to split above" }
lvim.builtin.which_key.mappings["l"] = { "<C-w>l", "Move to split to the right" }

lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.terminal.direction = 'horizontal'
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-n>" -- Allow ESC to go into visual mode in terminal

lvim.builtin.which_key.mappings["t"] = {
  ":ToggleTerm<CR>", "Toggle terminal"
}
lvim.builtin.which_key.mappings["P"] = {
  ":Telescope projects<CR>", "Open project"
}
lvim.builtin.which_key.mappings["o"] = {
  ":Outline<CR>", "Toggle outline",
}

lvim.builtin.which_key.mappings["y"] = {
  '"+y', "Copy to system clipboard buffer",
}
lvim.builtin.which_key.mappings["p"] = {
  '"+p', "Paste from system clipboard buffer",
}

lvim.lsp.buffer_mappings.visual_mode["f"] = {
  [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], "Search Selection"
}

