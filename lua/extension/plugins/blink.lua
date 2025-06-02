return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*'
        },
        'onsails/lspkind.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        keymap = {
            preset = 'none',
            ['<c-e>'] = { 'show', 'hide', 'fallback' },
            ['<c-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
            ['<c-n>'] = { 'select_next', 'fallback' },
            ['<c-p>'] = { 'select_prev', 'fallback' },
            ['<c-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
            ['<c-]>'] = { 'snippet_forward', 'fallback' },
            ['<c-[>'] = { 'snippet_backward', 'fallback' },
            ['<tab>'] = { 'select_and_accept', 'fallback' }
        },
        appearance = { nerd_font_variant = 'normal' },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false
                }
            },
            ghost_text = { enabled = true },
            documentation = {
                auto_show = true,
                window = { border = 'rounded' }
            },
            menu = {
                border = 'rounded',
                draw = {
                    treesitter = { 'lsp' },
                    columns = {
                        { 'label', 'label_description', gap = 2 },
                        { 'kind_icon', 'kind', gap = 1 }
                    },
                    components = {
                        kind_icon = {
                            text = function (ctx)
                                local icon = ctx.kind_icon
                                if ctx.source_name == 'path' then
                                    local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon =  require('lspkind').symbolic(ctx.kind, {
                                        mode = 'symbol'
                                    })
                                end
                                return icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if ctx.source_name == 'path' then
                                    local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                                    if dev_icon then
                                        return dev_hl
                                    end
                                end
                                return hl
                            end
                        }
                    }
                }
            }
        },
        cmdline = {
            enabled = true,
            keymap = { preset = 'inherit' },
            completion = {
                menu = { auto_show = true },
                ghost_text = { enabled = true }
            }
        },
        signature = {
            enabled = true,
            window = { border = 'rounded' }
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline', 'omni' },
            providers = {
                lsp = { score_offset = 4 },
                path = { score_offset = 3 },
                snippets = { score_offset = 5 },
                buffer = { score_offset = 2 },
                cmdline = {
                    score_offset = 1,
                    min_keyword_length = function (ctx)
                        if ctx.mode == 'cmdline' and not string.find(ctx.line, ' ') then
                            return 3
                        end
                        return 1
                    end
                },
                omni = { score_offset = 1 }
            }
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
    opts_extend = { 'sources.default' },
    config = function (_, opts)
        require('blink.cmp').setup(opts)
        require('luasnip.loaders.from_vscode').lazy_load({
            paths = { vim.fn.stdpath('config') }
        })
    end
}
