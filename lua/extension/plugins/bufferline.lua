return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
        'folke/tokyonight.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    lazy = false,
    keys = {
        { 'H', '<cmd>BufferLineCyclePrev<cr>', desc = '跳转到左侧 buffer' },
        { 'L', '<cmd>BufferLineCycleNext<cr>', desc = '跳转到右侧 buffer' },
        { '<leader>bp', '<cmd>BufferLinePick<cr>', desc = '给 buffer 打上跳转标记' },
        { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = '关闭左侧 buffer' },
        { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = '关闭右侧 buffer' },
        { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = '关闭其他 buffer' },
        {
            '<leader>bd',
            function ()
                Snacks.bufdelete.delete()
            end,
            desc = '关闭当前 buffer'
        }
    },
    opts = {
        options = {
            indicator = { style = 'underline' },
            separator_style = 'slope',
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Resources Manager',
                    text_align = 'center',
                    separator = true
                }
            },
            diagnostics = 'nvim_lsp'
        }
    }
}
