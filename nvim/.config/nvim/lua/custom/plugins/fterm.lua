return {
  {
    'numToStr/FTerm.nvim',
    config = function()
      local FTerm = require 'FTerm'
      local uv = vim.loop

      -- Setup FTerm
      FTerm.setup {
        dimensions = { height = 0.9, width = 0.9 },
        border = 'rounded',
        close_on_exit = false,
      }

      -- Open floating terminal in current file's directory
      local function open_terminal()
        local dir = vim.fn.expand '%:p:h' -- directory of current file
        if dir == '' then
          dir = vim.fn.getcwd()
        end

        -- Change current terminal directory
        vim.cmd('lcd ' .. dir)

        -- Create floating terminal with plain bash
        local term = FTerm:new {
          cmd = 'bash --noprofile --norc', -- clean bash
          ft = 'fterm',
        }
        term:toggle()
      end

      -- Expose globally
      _G.ToggleFloatTerminal = open_terminal
    end,
  },
}
