require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true
})

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

local lsp_opts = {
    on_attach = function(client, bufnr)
        local opts = { buffer = 0 }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "]d", vim.lsp.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.lsp.diagnostic.goto_prev, opts)
        -- Local diagnostic list
        vim.keymap.set("n", "<leader>dl", vim.lsp.diagnostic.set_loclist, opts)
        -- Global diagnostic list
        vim.keymap.set("n", "<leader>dg", "<cmd>Telescope diagnostics<cr>", opts)

        vim.keymap.set("n", "<leader>bf", vim.lsp.buf.formatting, opts)

        if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec(
                [[
                  augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                  augroup END
                ]], false)
        end
    end,

    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

    handlers = {
        ["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
            border = "rounded"
        }
        ),

        ["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
            border = "rounded",
        }
        ),
    }
}

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        lspconfig[server_name].setup(lsp_opts)
    end,

    ["sumneko_lua"] = function()
        local lua_opts = vim.tbl_deep_extend("force", require("user.lsp_settings.sumneko_lua"), lsp_opts)
        lspconfig.sumneko_lua.setup(lua_opts)
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup(vim.tbl_deep_extend("force", require("user.lsp_settings.pyright"), lsp_opts))
    end,

    ["jsonls"] = function()
        lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("user.lsp_settings.jsonls"), lsp_opts))
    end
})
