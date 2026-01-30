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
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "kanso-pearl"
        end
    },

    {
        "askfiy/visual_studio_code",
        -- "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("visual_studio_code").setup({
                -- `dark` or `light`
                mode = "light",
            })

            -- vim.cmd.colorscheme('vscode')
        end
    },

    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        config = function()
            -- vim.g.zenbones_darken_comments = 45
            -- vim.cmd.colorscheme('neobones')
        end
    },

    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
            })

            -- vim.cmd('colorscheme github_light_default')
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme "gruvbox"
        end
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
