return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-treesitter/nvim-treesitter'
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = '查找 lsp 诊断' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '查找文件' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '查找文本片段' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = '查找 buffer' },
        { '<leader>fr', '<cmd>Telescope resume<cr>', desc = '打开最近的 telescope 窗口' },
        { '<leader>fo', '<cmd>Telescope vim_options<cr>', desc = '查找 nvim 的选项' },
        { '<leader>fm', '<cmd>Telescope marks<cr>', desc = '查找标记' },
        { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = '查找历史文件' },
        { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '查找当前 buffer 的文本片段' }
    },
    config = function ()
        local telescope = require('telescope')
        telescope.setup({
            defaults = { prompt_prefix = '   ' },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case'
                },
                ['ui-select'] = { require('telescope.themes').get_dropdown({}) }
            }
        })
        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
    end
}
