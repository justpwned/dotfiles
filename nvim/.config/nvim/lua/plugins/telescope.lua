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

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<C-p>", builtin.git_files)

        vim.keymap.set("n", "<leader>fs", builtin.live_grep)
        vim.keymap.set("n", "<leader>bf", builtin.buffers)
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end)
        vim.keymap.set("n", "<leader>fw", builtin.grep_string)
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
    end,
}
