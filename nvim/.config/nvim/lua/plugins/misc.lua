return {
    'tpope/vim-surround',
    'tpope/vim-sleuth',

    {
        'asiryk/auto-hlsearch.nvim',
        config = true,
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            git = { enabled = true },
            gitbrowse = { enabled = true },
            bigfile = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            picker = { enabled = false },
        },
        keys = {
            { "<leader>fo", function() Snacks.gitbrowse() end, desc = "Grep" },
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
        opts = {
            theme = 'vscode',
        },
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

            vim.keymap.set("n", "<leader>fn", "<cmd>TodoTelescope<cr>")
        end
    },

    {
        'stevearc/dressing.nvim',
        opts = {},
    },

    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
        config = function()
            require('dropbar').setup({
                bar = {
                    sources = function()
                        return {
                            require('dropbar.sources.path')
                        }
                    end,
                },
            })
            -- local dropbar_api = require('dropbar.api')
            -- vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
            -- vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
            -- vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
        end
    }
}
