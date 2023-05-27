return {
    'tpope/vim-surround',
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
        'rose-pine/neovim',
        name = 'rose-pine'
    },

    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
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

    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
}
