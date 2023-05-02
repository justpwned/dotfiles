return {
    'tpope/vim-sleuth',

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "latte"
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "v2.x",
        opts = {
            filesystem = {
                hijack_netrw_behavior = "open_current",
                follow_current_file = true,
            },
            window = {
                mappings = {
                    ["l"] = "open",
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "muniftanjim/nui.nvim",
        }
    },

    {
        'numtostr/comment.nvim',
        opts = {}
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {},
    },
}
