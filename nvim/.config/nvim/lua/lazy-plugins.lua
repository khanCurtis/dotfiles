-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  require 'plugins.init',

  require 'plugins.autopairs',
  require 'plugins.blink-cmp',
  require 'plugins.conform',
  require 'plugins.debug',
  require 'plugins.devicons',
  require 'plugins.fterm',
  require 'plugins.gitsigns',
  require 'plugins.indent_line',
  require 'plugins.lint',
  require 'plugins.lspconfig',
  require 'plugins.mini',
  require 'plugins.neo-tree',
  require 'plugins.none-ls',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.treesitter',
  require 'plugins.vimbegood',
  require 'plugins.which-key',

  -- 'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  --FIXME { import = 'lazyvim.plugins.extras.lsp.none-ls' },

  -- Load Omarchy’s generated Neovim theme
  dofile(vim.fn.expand '~/.config/omarchy/current/theme/neovim.lua'),
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'cwd'

-- vim: ts=2 sts=2 sw=2 et
