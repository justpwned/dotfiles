vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = "menuone,noselect"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.breakindent = true
vim.opt.signcolumn = 'yes'

vim.g.python3_host_prog = '/Users/joiput/miniconda3/envs/pynvim/bin/python'

-- Fix ctrl-c in SQL files
vim.g.ftplugin_sql_omni_key = ''

-- See `:help vim.highlight.on_yank`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
