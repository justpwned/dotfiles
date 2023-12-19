return {
    'tpope/vim-surround',
    'tpope/vim-sleuth',

    {
        'asiryk/auto-hlsearch.nvim',
        config = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = false,
            },
        },
    },

    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
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

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require("todo-comments").setup()
            vim.keymap.set("n", "]t", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            vim.keymap.set("n", "[t", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })

            vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
        end
    },

    {
        'stevearc/dressing.nvim',
        opts = {},
    },
}
