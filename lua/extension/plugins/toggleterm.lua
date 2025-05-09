return {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'VeryLazy',
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
