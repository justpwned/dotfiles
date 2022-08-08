require("toggleterm").setup {
    -- size = 20,
    open_mapping = [[<c-\>]],
    direction = "float",
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    insert_mappings = true,
    -- persist_size = true,
    -- close_on_exit = true,
    -- shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

-- NOTE: <C-\><C-n> enters into normal  mode
function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local liveserver = Terminal:new({
    cmd = "live-server",
    hidden = true,
    start_in_insert = false,
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<leader>v", "<cmd>close<CR>", {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>v", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
})

function _LIVESERVER_TOGGLE()
    liveserver:toggle()
end


