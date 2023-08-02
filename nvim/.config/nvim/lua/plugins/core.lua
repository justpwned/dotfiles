return {
    'tpope/vim-surround',
    'tpope/vim-sleuth',

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local oil = require('oil')

            oil.setup {
                skip_confirmation_for_simple_edits = true,
                keymaps = {
                    ["<C-v>"] = "actions.select_vsplit",
                    ["q"] = "actions.close",
                }
            }

            vim.keymap.set("n", "<leader>e", oil.open)

            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end
    },

    {
        'numtostr/comment.nvim',
        opts = {}
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
}
