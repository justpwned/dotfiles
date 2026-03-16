return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            config = true,
        },
        "williamboman/mason-lspconfig.nvim",
        'saghen/blink.cmp',
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = false,
            underline = true,
        })

        vim.lsp.config("gopls", {
            settings = {
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
                buildFlags = { "-tags=integration" }
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    hint = {
                        arrayIndex = "Disable",
                        paramName = "Disable",
                        paramType = false,
                    }
                },

            },
        })

        vim.lsp.config("html", {
            filetypes = { "html", "template" },
        })

        -- Enable all configured LSPs
        vim.lsp.enable({ "gopls", "lua_ls", "sqls", "rust_analyzer", "html" }, true)

        -- Mason: ensure LSP servers are installed
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = { "gopls", "lua_ls", "sqls", "rust_analyzer", "html" },
        })

        -- Formatting setup
        local format_is_enabled = true
        vim.api.nvim_create_user_command("KickstartFormatToggle", function()
            format_is_enabled = not format_is_enabled
            print("Setting autoformatting to: " .. tostring(format_is_enabled))
        end, {})

        local _augroups = {}
        local get_augroup = function(client)
            if not _augroups[client.id] then
                local group_name = "kickstart-lsp-format-" .. client.name
                local id = vim.api.nvim_create_augroup(group_name, { clear = true })
                _augroups[client.id] = id
            end
            return _augroups[client.id]
        end

        local function organize_imports(client, bufnr)
            local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding(bufnr))
            params.context = { only = { "source.organizeImports" } }

            local resp = client.request_sync("textDocument/codeAction", params, 3000, bufnr)
            for _, r in pairs(resp and resp.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding(bufnr))
                else
                    print(r.command)
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if not client.server_capabilities.documentFormattingProvider then
                    return
                end

                if client.name == 'tsserver' or client.name == 'sqls' then
                    return
                end

                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = get_augroup(client),
                    buffer = args.buf,
                    callback = function()
                        if not format_is_enabled then
                            return
                        end

                        if client.name == "gopls" then
                            organize_imports(client, args.buf)
                        end

                        vim.lsp.buf.format {
                            async = false,
                            filter = function(c)
                                return c.id == client.id
                            end,
                        }
                    end,
                })
            end,
        })
    end,
}
