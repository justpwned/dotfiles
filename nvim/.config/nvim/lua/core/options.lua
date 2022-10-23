vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"

vim.g.python3_host_prog = "/home/joiput/.pyenv/versions/pynvim/bin/python"

if vim.g.neovide then
    vim.g.neovide_cursor_trail_length = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.opt.guifont = "JetBrainsMono Nerd Font:h9"
end

