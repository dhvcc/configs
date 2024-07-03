return {
  "supermaven-inc/supermaven-nvim",
  enabled = vim.env.ENABLE_SUPERMAVEN == "true",
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
