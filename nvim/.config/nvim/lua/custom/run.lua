local Terminal = require('toggleterm.terminal').Terminal
local uv = vim.loop

-- reusable terminal
local run_term = nil
local function get_terminal()
  if run_term == nil then
    run_term = Terminal:new {
      hidden = true,
      direction = 'horizontal',
      cmd = 'bash --noprofile --norc', -- force clean bash
      close_on_exit = false,
      auto_scroll = true,
    }
  end
  return run_term
end

-- Find project root (Cargo.toml, .git, fallback cwd)
local function get_project_root()
  local path = vim.fn.expand '%:p:h'
  while path ~= '/' do
    if uv.fs_stat(path .. '/Cargo.toml') or uv.fs_stat(path .. '/.git') then
      return path
    end
    path = vim.fn.fnamemodify(path, ':h')
  end
  return vim.fn.getcwd()
end

-- Compile & run file
local function run_file()
  local file = vim.fn.expand '%:p'
  local ext = vim.fn.expand '%:e'
  local cmd = ''

  if ext == 'cpp' then
    cmd = string.format('g++ %q -std=c++20 -Wall -O2 -o %q && ./%q', file, vim.fn.expand '%:r', vim.fn.expand '%:r')
  elseif ext == 'c' then
    cmd = string.format('gcc %q -Wall -O2 -o %q && ./%q', file, vim.fn.expand '%:r', vim.fn.expand '%:r')
  elseif ext == 'rs' then
    cmd = 'cargo run'
  elseif ext == 'py' then
    cmd = string.format('python3 %q', file)
  else
    print('No run command for file type: ' .. ext)
    return
  end

  local project_root = get_project_root()
  vim.cmd('lcd ' .. project_root)

  local t = get_terminal()
  t:toggle()
  vim.defer_fn(function()
    t:send(cmd, true)
  end, 100)
end

return {
  run_file = run_file,
}
