return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'folke/tokyonight.nvim'
    },
    event = 'VeryLazy',
    keys = {
        { 'H', '<cmd>BufferLineCyclePrev<cr>', desc = '跳转到上一个 buffer' },
        { 'L', '<cmd>BufferLineCycleNext<cr>', desc = '跳转到下一个 buffer' },
        { '<leader>bp', '<cmd>BufferLinePick<cr>', desc = '给每一个 buffer 打上跳转标记' },
        { '<leader>bd', '<cmd>lua Snacks.bufdelete.delete()<cr>', desc = '关闭当前 buffer' },
        { '<leader>bo', '<cmd>lua Snacks.bufdelete.other()<cr>', desc = '关闭当前 buffer' }
    },
    opts = {
        options = {
            indicator = { style = 'underline' },
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'File Explorer',
                    text_align = 'center',
                    separator = true
                }
            }
        }
    }
}
