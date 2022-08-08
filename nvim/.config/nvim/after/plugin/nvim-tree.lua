local nvim_tree = require("nvim-tree")

nvim_tree.setup {
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_tab = true,
    hijack_cursor = false,
    -- sync_root_with_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        -- auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = "<S-l>", action = "cd" },
                { key = "<S-h>", action = "dir_up" },
                { key = { "l", "<CR>", "o" }, action = "edit" },
                { key = "h", action = "close_node" },
                { key = "v", action = "vsplit" },
                { key = "<Tab>", action = "" },
                { key = "t", action = "tabnew" }
            },
        },
        number = false,
        relativenumber = false,
    },
}
