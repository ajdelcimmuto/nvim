require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]]"] = "@function.outer",
                -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                ["]o"] = "@loop.*",
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                -- ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
                ["]d"] = "@conditional.outer",
            },
            goto_previous = {
                ["[d"] = "@conditional.outer",
            }
        },
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
    filetype = "brs"
}

require'nvim-treesitter'.define_modules {
    brightscript_module = {
        attach = function(bufnr, lang)
            -- Enable highlighting
            require'nvim-treesitter'.highlight.attach(bufnr, lang)
            require'nvim-treesitter'.indent.attach(bufnr, lang)
        end,

        detach = function(bufnr)
            -- Disable highlighting
            require'nvim-treesitter'.highlight.detach(bufnr)
            require'nvim-treesitter'.indent.detach(bufnr)
        end,

        is_supported = function(lang)
            return lang == 'brightscript'
        end
    }
}

vim.treesitter.language.register('brightscript', 'brightscript')

