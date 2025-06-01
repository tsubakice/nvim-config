return {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        {
            'nvimdev/lspsaga.nvim',
            dependencies = {
                'nvim-tree/nvim-web-devicons',
                {
                    'nvim-treesitter/nvim-treesitter',
                    branch = 'master'
                }
            }
        },
        'b0o/schemastore.nvim'
    },
    build = ':MasonUpdate',
    lazy = false,
    keys = {
        { '<leader>mc', '<cmd>Mason<cr>', desc = '打开 Mason 控制台' },
        { '<leader>lr', '<cmd>Lspsaga rename<cr>', desc = '重命名' },
        { '<leader>la', '<cmd>Lspsaga code_action<cr>', desc = '代码操作' },
        { '<leader>lh', '<cmd>Lspsaga hover_doc<cr>', desc = '文档查看' },
        { '<leader>ld', '<cmd>Lspsaga goto_definition<cr>', desc = '跳转到定义' },
        { '<leader>lo', vim.diagnostic.open_float, desc = '显示诊断信息' },
        { '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = '跳转到下一个诊断' },
        { '<leader>lp', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = '跳转到上一个诊断' },
        { '<leader>li', vim.lsp.buf.implementation, desc = '跳转到实现' },
        {
            '<leader>lf', function()
                local point = vim.api.nvim_win_get_cursor(0)
                vim.cmd('normal! ggVG=')
                vim.api.nvim_win_set_cursor(0, point)
            end, desc = '格式化代码'
        },
    },
    config = function ()

        -- lsp 服务器名称及其配置
        local lsp_servers = {
            ['lua-language-server'] = {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = {
                            globals = { 'vim', 'Snacks' }
                        },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false }
                    }
                }
            },
            ['json-lsp'] = {
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true }
                    }
                }
            },
            pyright = {
                settings = {
                    python = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = 'workspace',
                        typeCheckingMode = 'basic'
                    }
                }
            }
        }

        -- 配置 diagnostic 的显示样式
        vim.diagnostic.config({
            underline = false,
            virtual_text = { spacing = 2, prefix = '●' },
            update_in_insert = true,
            severity_sort = true,
            float = { border = 'rounded' },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                }
            },
        })

        local lspconfig = require('lspconfig')
        local registry = require('mason-registry')
        local mappings = require('mason-lspconfig.mappings')
        local cmp = require('blink.cmp')

        -- lspsaga 相关配置
        require('lspsaga').setup({
            code_action = { show_server_name = true },
            ui = { border = 'rounded', code_action = '' },
            rename = {
                keys = { quit = '<c-c>' }
            }
        })

        -- mason-org/mason.nvim 相关配置
        require('mason').setup({
            github = { -- 重定向 lsp 服务器的下载地址
                download_url_template = 'https://github.moeyy.xyz/https://github.com/%s/releases/download/%s/%s'
            },
            ui = {
                border = 'rounded', -- mason console 边框样式, 可选值请参阅 nvim_open_win()
                backdrop = 100,
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' '
                },
                keymaps = { uninstall_package = 'x' }
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
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, {
                formatting = false, -- 禁用格式化
                rangeFormatting = false -- 禁用范围格式化
            })
            -- 当传入配置的 capabilities 不为空时才进行合并
            if config.capabilities then
                capabilities = vim.tbl_deep_extend('force', capabilities, config.capabilities)
            end
            -- 再次合并 blink 提供的 capabilities
            config.capabilities = cmp.get_lsp_capabilities(capabilities)
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
