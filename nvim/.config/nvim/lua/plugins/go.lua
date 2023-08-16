return {
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = "go",
        opts = {},
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
        keys = {
            {
                "<leader>ie",
                "<cmd>:GoIfErr<cr>",
            },
            {
                "<leader>tj",
                "<cmd>:GoTagAdd json<cr>",
            },
            {
                "<leader>ty",
                "<cmd>:GoTagAdd yaml<cr>",
            },
        }
    }
}
