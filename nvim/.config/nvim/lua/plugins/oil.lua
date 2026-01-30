return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require('oil')

        oil.setup {
            skip_confirmation_for_simple_edits = true,
            delete_to_trash = true,
            keymaps = {
                ["<C-v>"] = "actions.select_vsplit",
                ["q"] = "actions.close",
            },
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },
        }

        vim.keymap.set("n", "<leader>e", oil.open)

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end
}
