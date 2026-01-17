vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    -- skip non-file buffers (terminal, floating, help, etc.)
    if vim.bo.buftype ~= '' then
      return
    end

    local file = vim.fn.expand '%:p'
    if file == '' then
      return
    end

    local dir = vim.fn.fnamemodify(file, ':h')
    if vim.fn.isdirectory(dir) == 1 then
      vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
    end
  end,
})
