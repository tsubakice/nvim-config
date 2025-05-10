return {
    'folke/snacks.nvim',
    dependencies = { -- 防止 bufferline 和 lualine 在 snacks_dashboard 中显示异常
        'akinsho/bufferline.nvim',
        'nvim-lualine/lualine.nvim'
    },
    event = 'VeryLazy',
    opts = {
        styles = {
            input = {
                keys = {
                    n_esc = { '<c-c>', { 'cmp_close', 'cancel' }, mode = 'n', expr = true },
                    i_esc = { '<c-c>', { 'cmp_close', 'stopinsert' }, mode = 'i', expr = true }
                }
            }
        },
        input = { enabled = true },
        indent = { enabled = true },
        bufdelete = { enabled = true },
        notifier = {
            enabled = true,
            style = 'fancy'
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
    },
    config = function (_, opts)
        require('snacks').setup(opts)

        -- 创建高级 lsp 进度
        local progress = vim.defaulttable()
        vim.api.nvim_create_autocmd('LspProgress', {
            callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                local value = event.data.params.value
                if not client or type(value) ~= 'table' then
                    return
                end
                local p = progress[client.id]

                for i = 1, #p + 1 do
                    if i == #p + 1 or p[i].token == event.data.params.token then
                        p[i] = {
                            token = event.data.params.token,
                            msg = ('[%3d%%] %s%s'):format(
                                value.kind == 'end' and 100 or value.percentage or 100,
                                value.title or '',
                                value.message and (' **%s**'):format(value.message) or ''
                            ),
                            done = value.kind == 'end',
                        }
                        break
                    end
                end

                local msg = {}
                progress[client.id] = vim.tbl_filter(function(v)
                    return table.insert(msg, v.msg) or not v.done
                end, p)

                local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
                vim.notify(table.concat(msg, '\n'), vim.log.levels.INFO, {
                    id = 'lsp_progress',
                    title = client.name,
                    opts = function(notif)
                        notif.icon = #progress[client.id] == 0 and ' '
                        or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                    end,
                })
            end,
        })
    end
}
