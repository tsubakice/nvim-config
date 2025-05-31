return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'folke/tokyonight.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            theme = {
                normal = {
                    a = { bg = '#7aa2f7', fg = '#080808', gui = 'bold' },
                    b = { bg = '#303030', fg = '#c6c6c6' },
                    c = { bg = '#1a1b26', fg = '#c6c6c6' }
                },
                insert = {
                    a = { bg = '#c4e98e', fg = '#080808', gui = 'bold' },
                    b = { bg = '#303030', fg = '#c6c6c6' },
                    c = { bg = '#1a1b26', fg = '#c6c6c6' }
                },
                visual = {
                    a = { bg = '#8adeff', fg = '#080808', gui = 'bold' },
                    b = { bg = '#303030', fg = '#c6c6c6' },
                    c = { bg = '#1a1b26', fg = '#c6c6c6' }
                },
                replace = {
                    a = { bg = '#f0945d', fg = '#080808', gui = 'bold' },
                    b = { bg = '#303030', fg = '#c6c6c6' },
                    c = { bg = '#1a1b26', fg = '#c6c6c6' }
                },
                command = {
                    a = { bg = '#c893eb', fg = '#080808', gui = 'bold' },
                    b = { bg = '#303030', fg = '#c6c6c6' },
                    c = { bg = '#1a1b26', fg = '#c6c6c6' }
                }
            },
            globalstatus = true,
            component_separators = '',
            section_separators = { left = '', right = '' }
        },
        extensions = { 'neo-tree' },
        disabled_filetypes = { },
        sections = {
            lualine_a = {
                {
                    'mode',
                    separator = { left = '' }
                }
            },
            lualine_b = {
                {
                    'filename',
                    symbols = {
                        modified = '  ',
                        readonly = '  ',
                        unnamed = '  ',
                        newfile = '  '
                    }
                },
                'branch'
            },
            lualine_c = {
                {
                    'diagnostics',
                    update_in_insert = true
                }
            },
            lualine_x = {
                {
                    'fileformat',
                    padding = { right = 2 }
                },
                {
                    'encoding',
                    padding = { right = 2 }
                },
                {
                    'filesize',
                    padding = { right = 2 }
                }
            },
            lualine_y = {
                {
                    'filetype',
                    separator = { left = '' }
                },
                {
                    'progress',
                    padding = { right = 1 }
                }
            },
            lualine_z = {
                {
                    'location',
                    separator = { right = '' },
                    padding = { left = 1, right = 1 }
                }
            }
        }
    }
}
