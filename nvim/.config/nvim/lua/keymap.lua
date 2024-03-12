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
map("<C-c>", "<Esc>")
imap("<C-c>", "<Esc>")
tmap("<Esc>", "<C-\\><C-n>")
cmap("<Down>", "<C-n>")
cmap("<Up>", "<C-p>")

map("Q", "<Nop>")
map("<Space>", "<Nop>")

nmap("<leader>q", "<cmd>qa!<cr>")

-- Search and replace word under cursor
nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

nmap("<C-h>", "<cmd>wincmd h<cr>")
nmap("<C-j>", "<cmd>wincmd j<cr>")
nmap("<C-k>", "<cmd>wincmd k<cr>")
nmap("<C-l>", "<cmd>wincmd l<cr>")

nmap("<C-Up>", "<cmd>resize +10<cr>")
nmap("<C-Down>", "<cmd>resize -10<cr>")
nmap("<C-Left>", "<cmd>vertical resize -10<cr>")
nmap("<C-Right>", "<cmd>vertical resize +10<cr>")

vmap("<", "<gv")
vmap(">", ">gv")
vmap("p", '"_dP')
vmap("J", ":m '>+1<cr>gv=gv")
vmap("K", ":m '<-2<cr>gv=gv")
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

nmap("<C-j>", "<cmd>cnext<cr>zz")
nmap("<C-k>", "<cmd>cprev<cr>zz")
nmap("<leader>c", "<cmd>cclose<cr>")

nmap("<leader>k", "<cmd>lnext<cr>zz")
nmap("<leader>j", "<cmd>lprev<cr>zz")
