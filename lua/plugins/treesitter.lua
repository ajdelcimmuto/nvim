require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,
  },
  fold = {
      enable = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.brightscript = {
  install_info = {
    -- url = "~/Dev/tree-sitter-brightscript", -- local path or git repo
    url = "https://github.com/ajdelcimmuto/tree-sitter-brightscript",
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "developer"
  },
  filetype = "brs",
}

require'nvim-treesitter'.define_modules {
  brightscript_module = {
    attach = function(bufnr, lang)
      -- Enable highlighting
      require'nvim-treesitter'.highlight.attach(bufnr, lang)
      require'nvim-treesitter'.fold.attach(bufnr, lang)
    end,
    
    detach = function(bufnr)
      -- Disable highlighting
      require'nvim-treesitter'.highlight.detach(bufnr)
      require'nvim-treesitter'.fold.detach(bufnr)
    end,
    
    is_supported = function(lang)
      return lang == 'brightscript'
    end
  }
}

vim.treesitter.language.register('brightscript', 'brightscript')

