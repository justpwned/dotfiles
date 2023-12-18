return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "latte",
            integrations = {
                mason = true,
                neotest = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            -- vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbox"
        end
    },

    {
        "shaunsingh/solarized.nvim",
        priority = 1000
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        opts = {
            variant = 'dawn',
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            -- vim.cmd.colorscheme "rose-pine"
        end
    },

}
