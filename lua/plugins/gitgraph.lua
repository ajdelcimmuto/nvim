local gitgraph = require('gitgraph')

gitgraph.setup({
  symbols = {
    merge_commit = 'M',
    commit = '*',
  },
  format = {
    timestamp = '%H:%M:%S %d-%m-%Y',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {
    -- Check diff of a commit
    on_select_commit = function(commit)
      local command = 'DiffviewOpen ' .. commit.hash .. '^!'
      vim.notify(command)
      vim.cmd(command)
    end,
    -- Check diff from commit a -> commit b
    on_select_range_commit = function(from, to)
      local command = 'DiffviewOpen ' .. from.hash .. '~1..' .. to.hash
      vim.notify(command)
      vim.cmd(command)
    end,
  },
})
