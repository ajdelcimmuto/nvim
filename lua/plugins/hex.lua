-- hex.nvim configuration for binary patching

require('hex').setup {
  -- cli command used to dump hex data
  dump_cmd = 'xxd -g 1 -u',

  -- cli command used to assemble from hex data
  assemble_cmd = 'xxd -r',

  -- function that runs on BufReadPre to determine if it's binary or not
  is_buf_binary_pre_read = function()
    -- Check file extension
    local ext = vim.fn.expand('%:e')
    if ext == 'so' or ext == 'a' or ext == 'o' or ext == 'bin' then
      return true
    end
    return false
  end,

  -- function that runs on BufReadPost to determine if it's binary or not
  is_buf_binary_post_read = function()
    -- Check for null bytes in first 8KB
    local bytes = vim.api.nvim_buf_get_lines(0, 0, 8192, false)
    for _, line in ipairs(bytes) do
      if line:find('\0') then
        return true
      end
    end
    return false
  end,
}

-- Keymaps for quick access
vim.keymap.set('n', '<leader>hd', function() require('hex').dump() end,
  { desc = 'Hex: Dump (switch to hex view)' })
vim.keymap.set('n', '<leader>ha', function() require('hex').assemble() end,
  { desc = 'Hex: Assemble (back to normal view)' })
vim.keymap.set('n', '<leader>ht', function() require('hex').toggle() end,
  { desc = 'Hex: Toggle hex/normal view' })

-- Helper function to search for text in hex view
vim.keymap.set('n', '<leader>hs', function()
  local search_term = vim.fn.input('Search for text: ')
  if search_term ~= '' then
    vim.cmd('/' .. search_term)
  end
end, { desc = 'Hex: Search for text' })

-- Quick command to open .so files
vim.api.nvim_create_user_command('HexOpenSO', function(opts)
  local file = opts.args
  if file == '' then
    file = vim.fn.input('Enter .so file path: ', '', 'file')
  end
  if file ~= '' then
    vim.cmd('edit ' .. file)
    require('hex').dump()
  end
end, { nargs = '?', complete = 'file' })

-- Auto-backup before editing binary files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.so',
  callback = function()
    local file = vim.fn.expand('%:p')
    local backup = file .. '.backup'
    -- Only create backup if it doesn't exist
    if vim.fn.filereadable(backup) == 0 then
      vim.fn.system(string.format('cp %s %s', vim.fn.shellescape(file), vim.fn.shellescape(backup)))
      vim.notify('Created backup: ' .. backup, vim.log.levels.INFO)
    end
  end,
})
