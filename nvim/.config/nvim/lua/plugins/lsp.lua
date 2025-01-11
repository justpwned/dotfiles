return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            config = true,
        },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = false,
            underline = true,
        })

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end
            local imap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("i", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
            nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
            -- nmap('[e', function() vim.diagnostic.goto_prev({ severity = "ERROR" }) end, "Go to previous error message")
            -- nmap(']e', function() vim.diagnostic.goto_next({ severity = "ERROR" }) end, "Go to next error message")
            nmap("<leader>dl", vim.diagnostic.setloclist, "Open diagnostics list")
            nmap("gl", vim.diagnostic.open_float, "Show diagnostics message")

            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
            nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

            local builtin = require("telescope.builtin")
            nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            nmap("<leader>gr", builtin.lsp_references, "[G]oto [R]eferences")
            nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
            nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
            nmap("<leader>ds", function()
                builtin.lsp_document_symbols({ symbol_width = 40 })
            end, "[D]ocument [S]ymbols")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            nmap("<C-p>", vim.lsp.buf.signature_help, "Signature Documentation")
            imap("<C-p>", vim.lsp.buf.signature_help, "Signature Documentation")

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
            nmap("<leader>fl", "<cmd>Format<cr>", "Format file")
        end

        local hover_config = {
            border = "rounded",
            max_width = 80,
        }

        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, hover_config),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, hover_config),
        }

        local servers_config = {
            gopls = {
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
            lua_ls = {
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
                },
            },
            rust_analyzer = {},
            -- clangd = {},
            -- pylsp = {},
            -- emmet_ls = {},
            -- jsonls = {},
            -- cssls = {},
            -- html = {
            -- 	format = {
            -- 		templating = true,
            -- 		wrapLineLength = 120,
            -- 		wrapAttributes = "auto",
            -- 	},
            -- 	hover = {
            -- 		documentation = true,
            -- 		references = true,
            -- 	},
            -- },
        }

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers_config),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers_config[server_name],
                    handlers = handlers,
                })
            end,
            ["emmet_ls"] = function()
                require("lspconfig")["emmet_ls"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    filetypes = {
                        "css",
                        "eruby",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "svelte",
                        "pug",
                        "typescriptreact",
                        "vue",
                        "template",
                    },
                    settings = servers_config["emmet_ls"],
                    handlers = handlers,
                })
            end,
            ["html"] = function()
                require("lspconfig")["html"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    filetypes = { "html", "template" },
                    settings = servers_config["html"],
                    handlers = handlers,
                })
            end,
        })

        local format_is_enabled = true
        vim.api.nvim_create_user_command("KickstartFormatToggle", function()
            format_is_enabled = not format_is_enabled
            print("Setting autoformatting to: " .. tostring(format_is_enabled))
        end, {})

        -- Create an augroup that is used for managing our formatting autocmds.
        --      We need one augroup per client to make sure that multiple clients
        --      can attach to the same buffer without interfering with each other.
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
            local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
            params.context = { only = { "source.organizeImports" } }

            local resp = client.request_sync("textDocument/codeAction", params, 3000, bufnr)
            for _, r in pairs(resp and resp.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
                else
                    print(r.command)
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end

        -- Whenever an LSP attaches to a buffer, we will run this function.
        -- See `:help LspAttach` for more information about this autocmd event.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
            -- This is where we attach the autoformatting for reasonable clients
            callback = function(args)
                local client_id = args.data.client_id
                local client = vim.lsp.get_client_by_id(client_id)
                local bufnr = args.buf

                -- Only attach to clients that support document formatting
                if not client.server_capabilities.documentFormattingProvider then
                    return
                end

                -- Tsserver usually works poorly. Sorry you work with bad languages
                -- You can remove this line if you know what you're doing :)
                if client.name == 'tsserver' then
                    return
                end

                -- Create an autocmd that will run *before* we save the buffer.
                --  Run the formatting command for the LSP that has just attached.
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = get_augroup(client),
                    buffer = bufnr,
                    callback = function(args)
                        if not format_is_enabled then
                            return
                        end

                        -- require("conform").format({bufnr = args.buf})

                        organize_imports(client, bufnr)

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
