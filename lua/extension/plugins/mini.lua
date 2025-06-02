return {
    {
        'echasnovski/mini.pairs',
        version = false,
        opts = {
            modes = {
                insert = true,
                command = false,
                terminal = false
            }
        }
    },
    {
        'echasnovski/mini.surround',
        version = false,
        keys = {
            { 'sa', 'sa', desc = '添加环绕符号' },
            { 'sd', 'sd', desc = '删除环绕符号' },
            { 'sr', 'sr', desc = '替换环绕符号' }
        },
        opts = {
            mappings = { -- 仅启用添加、删除和替换环绕符号
                add = 'sa',
                delete = 'sd',
                replace = 'sr',
                find = '',
                find_left = '',
                highlight = '',
                update_n_lines = '',
                suffix_last = '',
                suffix_next = ''
            }
        }
    }
}
