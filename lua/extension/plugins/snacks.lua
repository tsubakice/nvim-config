return {
    'folke/snacks.nvim',
    dependencies = { -- 防止 bufferline 和 lualine 在 snacks_dashboard 中显示异常
        'akinsho/bufferline.nvim',
        'nvim-lualine/lualine.nvim'
    },
    opts = {
        bufdelete = { enabled = true },
        indent = { enabled = true },
        words = { enabled = true, debounce = 100 }
    }
}
