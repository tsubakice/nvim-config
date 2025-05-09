return {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        {
            'nvimdev/lspsaga.nvim',
            dependencies = {
                {
                    'neovim/nvim-lspconfig',
                    dependencies = {
                        'saghen/blink.cmp'
                    }
                },
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
            }
        },
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    {
                        path = '${3rd}/luv/library', words = { 'vim%.uv' }
                    }
                }
            }
        }
    },
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall' },
    event = 'VeryLazy',
    keys = {
        { '<leader>lr', '<cmd>Lspsaga rename<cr>', desc = '重命名变量' },
        { '<leader>lc', '<cmd>Lspsaga code_action<cr>', desc = '列出错误诊断措施' },
        { '<leader>ld', '<cmd>Lspsaga goto_definition<cr>', desc = '查看定义' },
        { '<leader>lh', '<cmd>Lspsaga hover_doc<cr>', desc = '查看帮助文档' },
        { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = '查看帮助文档' },
        { '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = '跳转到下一个诊断' },
        { '<leader>lp', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = '跳转到下一个诊断' },
        {
            '<leader>lf',
            function ()
                local point = vim.api.nvim_win_get_cursor(0)
                vim.cmd('normal! ggVG=')
                vim.api.nvim_win_set_cursor(0, point)
            end,
            desc = '格式化文档'
        }
    },
    build = ':MasonUpdate',
    config = function ()

        -- 配置 lsp 在 insert 模式中显示
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true
        })

        -- lsp 服务器名称及其配置
        local lsp_servers = {
            ['lua-language-server'] = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            },
            ['html-lsp'] = {},
            ['css-lsp'] = {},
            ['typescript-language-server'] = {
                init_options = {
                    plugins = {
                        {
                            name = '@vue/typescript-plugin',
                            location = vim.fn.stdpath('data') .. '\\mason\\packages\\vue-language-server\\node_modules\\@vue\\language-server',
                            languages = { 'vue' }
                        }
                    }
                },
                filetypes = {
                    'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'
                }
            },
            ['vue-language-server'] = {}
        }

        local lspconfig = require('lspconfig')
        local registry = require('mason-registry')
        local mappings = require('mason-lspconfig.mappings')
        local cmp = require('blink.cmp')

        -- lspsaga 相关配置
        require('lspsaga').setup({
            symbol_in_winbar = { folder_level = 0 },
            code_action = { show_server_name = true },
            ui = { border = 'rounded' }
        })

        -- mason-org/mason.nvim 相关配置
        require('mason').setup({
            github = { -- 重定向 lsp 服务器的下载地址
                download_url_template = 'https://www.gitproxy.click/https://github.com/%s/releases/download/%s/%s'
            },
            ui = {
                border = 'rounded', -- mason console 边框样式, 可选值请参阅 nvim_open_win()
                backdrop = 100,
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' '
                },
                keymaps = {
                    uninstall_package = 'x'
                }
            }
        })

        -- 将 package 名称转换成 lsp 名称
        local tmp = mappings.get_mason_map()
        local package_to_lspconfig = function (server)
            return tmp.package_to_lspconfig[server]
        end

        -- 安装 lsp 服务器
        local install_lsp_server = function (server)
            local success, package = pcall(registry.get_package, server)
            if success and not package:is_installed() then
                package:install()
            end
        end

        -- 配置 lsp 服务器
        local configuration_lsp_server = function (config)
            config.capabilities = cmp.get_lsp_capabilities()
        end

        -- 启动 lsp 服务器
        local launch_lsp_server = function (server, config)
            install_lsp_server(server)
            configuration_lsp_server(config)
            server = package_to_lspconfig(server)
            lspconfig[server].setup(config)
        end

        -- 统一启动所有 lsp
        for server, config in pairs(lsp_servers) do
            launch_lsp_server(server, config)
        end

        -- 手动启动 lsp
        vim.cmd('LspStart')
    end
}
