return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        'rafamadriz/friendly-snippets',
        'moyiz/blink-emoji.nvim'
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        keymap = {
            preset = 'none',
            ['<c-p>'] = { 'select_prev', 'fallback' },
            ['<c-n>'] = { 'select_next', 'fallback' },
            ['<c-e>'] = { 'cancel', 'fallback' },
            ['<tab>'] = { 'select_and_accept', 'fallback' },
            ['<cr>'] = { 'select_and_accept', 'fallback' }
        },
        appearance = { nerd_font_variant = 'normal' },
        completion = {
            menu = {
                border = 'rounded',
                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 2 },
                        { 'source_name' }
                    }
                }

            },
            ghost_text = { enabled = true },
            documentation = {
                auto_show = true,
                window = { border = 'rounded' }
            }
        },
        cmdline = {
            enabled = true,
            keymap = {
                preset = 'inherit',
                ['<cr>'] = { 'fallback' }
            },
            completion = {
                menu = { auto_show = true }
            }
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lsp', 'path', 'buffer', 'snippets', 'lazydev', 'emoji' },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100
                },
                emoji = {
                    module = 'blink-emoji',
                    name = 'Emoji',
                    score_offset = 15,
                    opts = { insert = true },
                    should_show_items = function()
                        return vim.tbl_contains({ 'gitcommit', 'markdown' }, vim.o.filetype)
                    end
                }
            }
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' },
    config = function (_, opts)
        require('blink.cmp').setup(opts)
        require('luasnip.loaders.from_vscode').lazy_load({
            paths = {
                vim.fn.stdpath('config') .. '\\snippets'
            }
        })
    end
}
