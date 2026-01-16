-- automatically set window-local cwd to current file's folder
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.cmd 'lcd %:p:h'
  end,
})
