return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
        -- {'3rd/image.nvim', opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        {
            '<leader>e',
            function ()
                require('neo-tree.command').execute({
                    source = 'filesystem',
                    toggle = true,
                    reveal_force_cwd = true,
                    dir = vim.fn.getcwd()
                })
            end,
            desc = '打开文件管理器'
        }
    },
    opts = {
        close_if_last_window = true,
        use_default_mappings = false,
        window = {
            mappings = {
                ['o'] = 'open',
                ['<cr>'] = 'open',
                ['a'] = {
                    'add',
                    config = {
                        show_path = 'none' -- 'none', 'relative', 'absolute'
                    }
                },
                ['A'] = 'add_directory',
                ['d'] = 'delete',
                ['r'] = 'rename',
                ['y'] = 'copy_to_clipboard',
                ['x'] = 'cut_to_clipboard',
                ['p'] = 'paste_from_clipboard',
                ['c'] = {
                    'copy',
                    config = {
                        show_path = 'none'
                    }
                },
                ['m'] = 'move',
                ['q'] = 'close_window',
                ['?'] = 'show_help',
                ['<'] = 'prev_source',
                ['>'] = 'next_source',
                ['i'] = {
                    'show_file_details',
                    config = {
                        create_format = '%Y-%m-%d %I:%M %p',
                        modified_format = 'relative'
                    }
                }
            }
        },
        filesystem = {
            filtered_items = {
                always_show_by_pattern = {
                    '.*ignore'
                }
            },
            window = {
                mappings = {
                    ['<bs>'] = 'navigate_up',
                    ['.'] = 'set_root',
                    ['H'] = 'toggle_hidden',
                    ['/'] = 'fuzzy_finder'
                }
            }
        }
    }
}
