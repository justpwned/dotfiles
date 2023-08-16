return {
    'stevearc/oil.nvim',
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
}
