local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "SignColumn",
  "EndOfBuffer",
}

local function clear_background()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = clear_background,
})

clear_background()

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "COMMIT_EDITMSG", "MERGE_MSG", "TAG_EDITMSG" },
  callback = function()
    vim.bo.filetype = "gitcommit"
    vim.cmd("setlocal syntax=gitcommit")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 72
    vim.opt_local.colorcolumn = "73"

    vim.cmd([[syntax include @GitCommitDiff syntax/diff.vim]])
    vim.cmd([[syntax region gitcommitDiff start=/^diff --git / end=/\%$/ contains=@GitCommitDiff keepend]])
  end,
})
