return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
        { '<leader>tt', '<leader>tt', desc = '打开或关闭终端' }
    },
    opts = {
        open_mapping = '<leader>tt',
        insert_mappings = false,
        direction = 'float',
        shell = 'pwsh',
        float_opts = {
            border = 'curved',
            title_pos = 'left'
        }
    }
}
