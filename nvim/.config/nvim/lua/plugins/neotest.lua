return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-go",
        },
        config = function()
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        print(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
                status = {
                    virtual_text = true,
                },
                output = {
                    open_on_run = true,
                }
            }, neotest_ns)
            require("neotest").setup({
                adapters = {
                    require("neotest-go"),
                }
            })
        end,
        keys = {
            {
                "<leader>ta",
                function() require("neotest").run.run(vim.fn.expand("%")) end,
                desc = "Run File"
            },
            {
                "<leader>td",
                function() require("neotest").run.run(vim.loop.cwd()) end,
                desc = "Run All Test Files"
            },
            {
                "<leader>te",
                function() require("neotest").run.run() end,
                desc = "Run Nearest"
            },
            {
                "<leader>ts",
                function() require("neotest").summary.toggle() end,
                desc = "Toggle Summary"
            },
            {
                "<leader>to",
                function() require("neotest").output.open({ enter = true, auto_close = true }) end,
                desc = "Show Output"
            },
            {
                "<leader>tp",
                function() require("neotest").output_panel.toggle() end,
                desc = "Toggle Output Panel"
            },
            {
                "<leader>tS",
                function() require("neotest").run.stop() end,
                desc = "Stop"
            },
            {
                "]e",
                function() require("neotest").jump.next({ status = "failed" }) end,
                desc = "Jump to next failed test"
            },
            {
                "[e",
                function() require("neotest").jump.prev({ status = "failed" }) end,
                desc = "Jump to previous failed test"
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<leader>tD", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
        },
    },
}
