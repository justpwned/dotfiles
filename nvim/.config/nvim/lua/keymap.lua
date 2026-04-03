local default_opts = { noremap = true }

local update_opts = function(opts)
    return vim.tbl_extend("force", default_opts, opts or {})
end

local map = function(lhs, rhs, opts)
    vim.keymap.set("", lhs, rhs, update_opts(opts))
end

local nmap = function(lhs, rhs, opts)
    vim.keymap.set("n", lhs, rhs, update_opts(opts))
end

local imap = function(lhs, rhs, opts)
    vim.keymap.set("i", lhs, rhs, update_opts(opts))
end

local vmap = function(lhs, rhs, opts)
    vim.keymap.set("x", lhs, rhs, update_opts(opts))
end

local tmap = function(lhs, rhs, opts)
    vim.keymap.set("t", lhs, rhs, update_opts(opts))
end

local cmap = function(lhs, rhs, opts)
    vim.keymap.set("c", lhs, rhs, update_opts(opts))
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Regular "map" doesn't remap in insert mode (see :help map-modes)
nmap("<C-c>", "<Esc>")
imap("<C-c>", "<Esc>")
tmap("<Esc>", "<C-\\><C-n>")
cmap("<Down>", "<C-n>")
cmap("<Up>", "<C-p>")

map("Q", "<Nop>")
map("<Space>", "<Nop>")

nmap("<leader>q", "<cmd>qa!<cr>")

-- Search and replace word under cursor
-- nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("mzJ`z", "J")

-- nmap("<C-h>", "<cmd>wincmd h<cr>")
-- nmap("<C-j>", "<cmd>wincmd j<cr>")
-- nmap("<C-k>", "<cmd>wincmd k<cr>")
-- nmap("<C-l>", "<cmd>wincmd l<cr>")

nmap("<C-M-k>", "<cmd>resize +10<cr>")
nmap("<C-M-j>", "<cmd>resize -10<cr>")
nmap("<C-M-h>", "<cmd>vertical resize -10<cr>")
nmap("<C-M-l>", "<cmd>vertical resize +10<cr>")

vmap("<", "<gv")
vmap(">", ">gv")
vmap("p", '"_dP')
vmap("<Down>", ":m '>+1<cr>gv=gv")
vmap("<Up>", ":m '<-2<cr>gv=gv")
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

nmap("<C-j>", "<cmd>cnext<cr>zz")
nmap("<C-k>", "<cmd>cprev<cr>zz")
nmap("<leader>c", "<cmd>cclose<cr>")

nmap("<leader>k", "<cmd>lnext<cr>zz")
nmap("<leader>j", "<cmd>lprev<cr>zz")

nmap("<leader>r", "<cmd>LspRestart<cr>")


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
        end

        nmap("[d", function() vim.diagnostic.jump({ count = -1, }) end, "Go to previous diagnostic message")
        nmap("]d", function() vim.diagnostic.jump({ count = 1, }) end, "Go to next diagnostic message")

        nmap("<leader>dl", function() vim.diagnostic.setqflist() end, "Open diagnostics list")
        nmap("gl", vim.diagnostic.open_float, "Show diagnostics message")

        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        local builtin = require("telescope.builtin")
        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("<leader>gr", builtin.lsp_references, "[G]oto [R]eferences")
        nmap("gr", function()
            vim.lsp.buf.references(nil, {
                on_list = function(options)
                    vim.fn.setqflist({}, " ", options)
                    vim.cmd.copen()
                    vim.cmd.cfirst()
                end,
            })
        end, "[G]oto [R]eferences")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", function()
            builtin.lsp_document_symbols({ symbol_width = 40 })
        end, "[D]ocument [S]ymbols")

        nmap("K", function()
            vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
        end, "Hover Documentation")

        nmap("<C-p>", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
            vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
        nmap("<leader>fl", "<cmd>Format<cr>", "Format file")
    end,
})
