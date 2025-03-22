-- visualize tabs
require("ibl").setup({
    scope = {
        enabled = true,
        include = {
            node_type = {
                brightscript = { -- Explicitly tell IBL what nodes to look for in brs files
                    "sub_statement",
                    "multi_line_if",
                    "function_statement",
                    "annonymous_sub",
                    "annonymous_function",
                    "conditional_compl",
                    "for_statement",
                    "while_statement",
                    "try_statement",
                    "array",
                    "assoc_array"
                }
            }
        }
    }
})
