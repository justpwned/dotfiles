local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local keymap = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping.confirm { select = true },

}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = keymap,

    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "luasnip" },
    },
})
