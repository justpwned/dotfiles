return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                layout_config = {
                    height = 0.5,
                }
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                },
                git_files = {
                    theme = "dropdown",
                    previewer = false,
                },
            }
        }

        telescope.load_extension 'fzf'


        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fp", builtin.git_files)
        vim.keymap.set("n", "<leader>fs", builtin.live_grep)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
    end,
}
