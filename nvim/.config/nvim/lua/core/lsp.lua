require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    float = {
        focusable = false,
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local default_config = {
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<leader>dg", "<cmd>Telescope diagnostics<cr>", bufopts)
        vim.keymap.set("n", ']d', vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", 'gl', vim.diagnostic.open_float, bufopts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('v', '<F4>', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>fr', function() vim.lsp.buf.format { async = true } end)
    end,
    capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
    ),
    single_file_support = true,
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

require("mason-lspconfig").setup_handlers {
    function(server_name)
        lspconfig[server_name].setup(default_config)
    end,

    ["sumneko_lua"] = function()
        local lua_config = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                            "awesome",
                            "client",
                            "root"
                        },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                            ['/usr/share/nvim/runtime/lua'] = true,
                            ['/usr/share/nvim/runtime/lua/lsp'] = true,
                            ['/usr/share/awesome/lib'] = true
                        },
                    },
                },
            },
        }
        lua_config = vim.tbl_deep_extend("force", lua_config, default_config)
        lspconfig.sumneko_lua.setup(lua_config)
    end,

}
