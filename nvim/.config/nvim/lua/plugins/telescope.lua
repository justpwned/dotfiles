local function find_files_from_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
    end
    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end
    local opts = {
        hidden = true,
        no_ignore = true,
    }
    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
            hidden = true,
            no_ignore = true,
        }
    end
    require("telescope.builtin").find_files(opts)
end

local function live_grep_from_project_git_root()
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")

        return vim.v.shell_error == 0
    end

    local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
    end

    local opts = {
        hidden = true,
        no_ignore = true,
    }

    if is_git_repo() then
        opts = {
            cwd = get_git_root(),
            hidden = true,
            no_ignore = true,
        }
    end

    require("telescope.builtin").live_grep(opts)
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
        local telescopeConfig = require('telescope.config')
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
        table.insert(vimgrep_arguments, "--hidden")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")

        telescope.setup {
            defaults = {
                vimgrep_arguments = vimgrep_arguments,
                mappings = {
                    i = {
                        ["<C-u>"] = false
                    },
                },
                file_ignore_patterns = { "^vendor/" },
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                    previewer = false,
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
                git_files = {
                    theme = "dropdown",
                    previewer = false,
                },
                colorscheme = {
                    theme = "dropdown",
                    previewer = true,
                }
            },
        }

        telescope.load_extension 'fzf'

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>fp", find_files_from_project_git_root)
        vim.keymap.set("n", "<leader>fs", live_grep_from_project_git_root)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
        vim.keymap.set("n", "<leader>gs", builtin.git_status)
        vim.keymap.set("n", "<leader>fc", function() builtin.colorscheme({ enable_preview = true }) end)
    end,
}
