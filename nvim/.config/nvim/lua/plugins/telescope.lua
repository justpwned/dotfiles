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
        telescope.setup()
        telescope.load_extension('fzf')

        vim.keymap.set("n", "<leader>ff", function()
            require("telescope.builtin").find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<leader>fg", function()
            require("telescope.builtin").live_grep()
        end)
        vim.keymap.set("n", "<leader>/", function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end)
        vim.keymap.set("n", "<leader>fw", function()
            require("telescope.builtin").grep_string()
        end)
        vim.keymap.set("n", "<leader>fo", function()
            require("telescope.builtin").oldfiles()
        end)
        vim.keymap.set("n", "<leader>fd", function()
            require("telescope.builtin").diagnostics()
        end)
    end,
}
