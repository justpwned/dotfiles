return {
    'tpope/vim-surround',
    'tpope/vim-sleuth',
    'lukas-reineke/indent-blankline.nvim',
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
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
}
