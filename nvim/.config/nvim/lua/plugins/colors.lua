return {
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
        "ellisonleao/gruvbox.nvim",
        priority = 1000
    },

    {
        "shaunsingh/solarized.nvim",
        priority = 1000
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000
    },

}
