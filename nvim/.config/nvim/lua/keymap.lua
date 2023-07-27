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

nmap("<leader>e", "<cmd>Neotree toggle dir=./<cr>")
-- nmap("<leader>pv", vim.cmd.Ex)
-- nmap("<leader>s", "<cmd>update<cr>")
-- nmap("<leader>m", "<cmd>messages<cr>")
-- nmap("<leader>l", "<cmd>noh<cr>", { silent = true })
-- nmap("<leader>c", "<cmd>close<cr>")

-- Center cursor location on next occurrence
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("J", "mzJ`z")

-- nmap("<C-h>", "<cmd>wincmd h<cr>")
-- nmap("<C-j>", "<cmd>wincmd j<cr>")
-- nmap("<C-k>", "<cmd>wincmd k<cr>")
-- nmap("<C-l>", "<cmd>wincmd l<cr>")

vmap("<", "<gv")
vmap(">", ">gv")
vmap("p", '"_dP')
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
