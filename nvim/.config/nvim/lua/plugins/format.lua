return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				template = { "djlint" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				["*"] = { "trim_newlines", "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			notify_on_error = false,
		},
	},
}
