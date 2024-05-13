-- Autocommand to detect .brs files
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.brs",
--   command = "setfiletype brightscript"
-- })

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
      enable = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.brightscript = {
  install_info = {
    url = "C:/Users/ajdel/Dev/tree-sitter-brightscript", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
  },
  filetype = "brs"
}

require'nvim-treesitter'.define_modules {
  brightscript_module = {
    attach = function(bufnr, lang)
      -- Enable highlighting
      require'nvim-treesitter'.highlight.attach(bufnr, lang)
      
      -- Add any additional custom functionality here
      -- require'nvim-treesitter'.indent.attach(bufnr, lang)
    end,
    
    detach = function(bufnr)
      -- Disable highlighting
      require'nvim-treesitter'.highlight.detach(bufnr)
      
      -- Undo any additional custom functionality here
      -- require'nvim-treesitter'.indent.detach(bufnr)
    end,
    
    is_supported = function(lang)
      return lang == 'brightscript'
    end
  }
}

vim.treesitter.language.register('brightscript', 'brightscript')

-- require'nvim-treesitter'.define_modules {
--   brightscript_highlights = {
--     attach = function(_, bufnr)
--       -- Load the highlights.scm file
--       local parser = vim.treesitter.get_parser(bufnr, "brightscript")
--       parser:setLocals(vim.treesitter.query.get("brightscript", "highlights"))
--     end,
--     detach = function(_, bufnr)
--       -- Clear the highlights
--       vim.treesitter.highlighter.clear(bufnr, "brightscript")
--     end,
--     is_supported = function(lang)
--       return lang == "brightscript"
--     end
--   }
-- }

