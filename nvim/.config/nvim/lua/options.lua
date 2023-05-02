vim.o.fileencoding = "utf-8"
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2
vim.o.completeopt = "menuone,noselect"
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.showmode = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.writebackup = false
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.numberwidth = 4
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.breakindent = true
vim.o.signcolumn = 'yes'

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"

-- See `:help vim.highlight.on_yank`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
