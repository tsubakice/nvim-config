return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim'
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '使用 telescope 查找文件' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '使用 telescope 查找文本片段' },
        { '<leader><space>', '<cmd>Telescope buffers<cr>', desc = '使用 telescope 查找 buffer' },
        { '<leader>fr', '<cmd>Telescope resume<cr>', desc = '打开最近的 telescope 窗口' },
        { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = '使用 telescope 查找历史文件' },
        { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '使用 telescope 查找当前 buffer 的指定内容' }
    },
    config = function ()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                prompt_prefix = '   ',
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case'
                },
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown({})
                }
            }

        })
        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
    end
}
