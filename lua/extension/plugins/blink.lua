return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'moyiz/blink-emoji.nvim'
    },
    event = 'VeryLazy',
    opts = {
        keymap = {
            preset = 'none',
            ['<c-p>'] = { 'select_prev', 'fallback' },
            ['<c-n>'] = { 'select_next', 'fallback' },
            ['<cr>'] = { 'accept', 'fallback' },
            ['<tab>'] = { 'accept', 'fallback' }
        },
        appearance = {
            nerd_font_variant = 'normal'
        },
        completion = {
            menu = { border = 'rounded' },
            ghost_text = { enabled = true },
            documentation = {
                auto_show = true,
                window = { border = 'rounded' }
            },
            list = {
                cycle = {
                    from_top = true,
                    from_bottom = true
                }
            }
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'emoji' },
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
                        return vim.tbl_contains({
                            'gitcommit', 'markdown'
                        }, vim.o.filetype)
                    end
                }
            }
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' }
}
