return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'super-tab',
            ['<C-p>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        signature = {
            enabled = true,
            window = {
                border = 'rounded'
            }
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            menu = {
                border = "rounded",
                winhighlight =
                "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            },
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'cmdline' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust" }
    },
    opts_extend = { "sources.default" }
}
