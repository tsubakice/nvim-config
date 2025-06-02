return {
    'folke/snacks.nvim',
    dependencies = { -- 防止 bufferline 和 lualine 在 snacks_dashboard 中显示异常
        'akinsho/bufferline.nvim',
        'nvim-lualine/lualine.nvim'
    },
    opts = {
        bufdelete = { enabled = true },
        indent = { enabled = true },
        words = { enabled = true, debounce = 100 },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = ' ', key = '<leader>ff', desc = 'Find File', action = '<cmd>Telescope find_files<cr>' },
                    { icon = ' ', key = '<leader>nf', desc = 'New File', action = '<cmd>ene | startinsert<cr>' },
                    { icon = ' ', key = '<leader>fg', desc = 'Find Grep', action = '<cmd>Telescope live_grep<cr>' },
                    { icon = '󰒲 ', key = '<leader>lc', desc = 'Lazy Console', action = '<cmd>Lazy<cr>' },
                    { icon = ' ', key = '<leader>mc', desc = 'Mason Console', action = '<cmd>Mason<cr>' },
                    { icon = ' ', key = '<leader>?', desc = 'Recent Files', action = '<cmd>Telescope oldfiles<cr>' },
                    { icon = ' ', key = 'q', desc = 'Quit Neovim', action = '<cmd>qa<cr>' }
                }
            }
        }
    }
}
