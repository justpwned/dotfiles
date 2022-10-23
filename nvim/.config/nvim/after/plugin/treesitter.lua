require('nvim-treesitter.configs').setup({
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        -- Doesn't work yet
        enable = false,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        }
    }
})
