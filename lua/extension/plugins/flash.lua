return {
    'folke/flash.nvim',
    keys = {
        {
            '<leader>s',
            mode = { 'n', 'x', 'o' },
            function ()
                require('flash').jump()
            end,
            desc = '通过搜索进行跳转'
        }
    },
    opts = {
        search = {
            exclude = { -- 不在以下 buffer 类型中搜索
                'notify',
                'cmp_menu',
                'noice',
                'flash_prompt',
                'neo-tree',
                function (win)
                    return not vim.api.nvim_win_get_config(win).focusable
                end
            }
        },
        label = {
            rainbow = { -- 开启彩色跳转标签
                enabled = true,
                shade = 9
            }
        },
        modes = {
            char = { -- 禁用 fFtT 唤醒 flash
                enabled = false
            }
        },
        prompt = { -- 自定义搜索前缀图标
            prefix = {{ ' ', 'FlashPromptIcon' }}
        }
    }
}
