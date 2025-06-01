return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'nvim-tree/nvim-web-devicons',
        'onsails/lspkind.nvim',
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*'
        }
    },
    opts = {
        keymap = {
            preset = 'none',
            ['<c-e>'] = { 'hide', 'fallback' },
            ['<c-n>'] = { 'select_next', 'fallback' },
            ['<c-p>'] = { 'select_prev', 'fallback' },
            ['<tab>'] = { 'accept', 'fallback' },
            ['<c-]>'] = { 'snippet_forward', 'fallback' },
            ['<c-[>'] = { 'snippet_backward', 'fallback' }
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
                    },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                    local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require('lspkind').symbolic(ctx.kind, { mode = 'symbol' })
                                end
                                return icon .. ctx.icon_gap
                            end
                        }
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
                ['<up>'] = { 'fallback' },
                ['<down>'] = { 'fallback' }
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
            default = { 'lsp', 'path', 'snippets', 'buffer' }
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' },
    config = function (_, opts)
        require('blink.cmp').setup(opts)
        require('luasnip.loaders.from_vscode').lazy_load({
            paths = {
                vim.fn.stdpath('config')
            }
        })
    end
}
