return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
  keys = {
    -- Bind ctrl+B to toggle nvim-tree in lua
    { "<C-b>", function() require("nvim-tree.api").tree.toggle() end, desc = "Toggle nvim-tree" },
    { "<leader>b", function() require("nvim-tree.api").tree.toggle() end, desc = "Toggle nvim-tree" },
    -- TODO: Fix the keymaps, they are atrocious
    -- { "cd", function() require("nvim-tree.api").tree.change_root_to_node() end, desc = "Chdir to root" },
  },
}
