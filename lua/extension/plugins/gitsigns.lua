return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>gc', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = '以幽灵文本的形式显示光标所在行的 commit' },
        { '<leader>gd', '<cmd>Gitsigns preview_hunk<cr>', desc = '预览当前 buffer 中修改过的块' },
        { '<leader>gl', '<cmd>Gitsigns blame_line<cr>', desc = '以块的形式显示光标所在行的 commit' },
        { '<leader>gb', '<cmd>Gitsigns blame<cr>', desc = '显示当前 buffer 的 commit' }
    },
    opts = {
        current_line_blame_opts = { delay = 500 },
        preview_config = { border = 'rounded' }
    }
}
