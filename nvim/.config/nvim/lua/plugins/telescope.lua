function vim.project_files()
    local builtin = require('telescope.builtin')
    -- We cache the results of "git rev-parse"
    -- Process creation is expensive in Windows, so this reduces latency
    local is_inside_work_tree = {}

    local project_files = function()
        local opts = {} -- define here if you want to define something

        local cwd = vim.fn.getcwd()
        if is_inside_work_tree[cwd] == nil then
            vim.fn.system("git rev-parse --is-inside-work-tree")
            is_inside_work_tree[cwd] = vim.v.shell_error == 0
        end

        if is_inside_work_tree[cwd] then
            builtin.git_files(opts)
        else
            builtin.find_files(opts)
        end
    end

    return project_files()
end

function vim.find_files_from_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
    end
    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end
    local opts = {}
    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end
    require("telescope.builtin").find_files(opts)
end

return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                layout_config = {
                },
                mappings = {
                    i = {
                        ["<C-u>"] = false
                    }
                }
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                },
                git_files = {
                    theme = "dropdown",
                    previewer = false,
                },
            },
        }

        telescope.load_extension 'fzf'

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fp", vim.find_files_from_project_git_root)
        vim.keymap.set("n", "<leader>fP", builtin.git_files)
        vim.keymap.set("n", "<leader>fs", builtin.live_grep)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
    end,
}
