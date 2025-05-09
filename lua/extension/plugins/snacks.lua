return {
    'folke/snacks.nvim',
    event = 'VeryLazy',
    opts = {
        indent = { enabled = true },
        bufdelete = { enabled = true },
        notifier = {
            enabled = true,
            style = 'fancy',
            wo = {
                wrap = true
            }
        },
        words = {
            enabled = true,
            debounce = 100
        },
        statuscolumn = {
            enabled = true,
            folds = { open = true }
        },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                keys = {
                    { icon = ' ', key = '<leader>ff', desc = 'Find File', action = function () require('telescope.builtin').find_files() end },
                    { icon = ' ', key = '<leader>fg', desc = 'Find Text', action = function () require('telescope.builtin').live_grep() end },
                    { icon = ' ', key = '<leader>?', desc = 'History Files', action = function () require('telescope.builtin').oldfiles() end },
                    { icon = ' ', key = '<leader>M', desc = 'Open Mason', action = '<cmd>Mason<cr>' },
                    { icon = '󰒲 ', key = '<leader>L', desc = 'Open Lazy', action = '<cmd>Lazy<cr>' },
                    { icon = ' ', key = 'n', desc = 'New File', action = '<cmd>ene | startinsert<cr>' },
                    { icon = ' ', key = 'q', desc = 'Quit', action = '<cmd>qa<cr>' }
                }
            }
        }
    }
}
