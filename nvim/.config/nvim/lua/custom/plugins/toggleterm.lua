return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        open_mapping = [[<c-\>]],
        direction = 'horizontal',
        close_on_exit = true,
        auto_scroll = true,
      }
    end,
  },
}
