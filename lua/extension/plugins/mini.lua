return {
    {
        'echasnovski/mini.pairs',
        version = false,
        event = 'InsertEnter',
        opts = {}
    },
    {
        'echasnovski/mini.surround',
        version = false,
        event = 'VeryLazy',
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
