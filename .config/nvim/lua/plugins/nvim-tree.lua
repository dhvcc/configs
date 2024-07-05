return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    -- Set Ctrl+B to toggle NvimTreeToggle
    vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
  end,
}
