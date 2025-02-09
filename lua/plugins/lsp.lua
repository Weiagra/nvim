return {
    -- 配置 williamboman/mason.nvim 插件
    {
        "williamboman/mason.nvim",
        -- 插件的配置函数
        config = function()
            -- 调用 mason 插件的 setup 方法进行配置
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    -- 配置 williamboman/mason - lspconfig.nvim 插件
    {
        "williamboman/mason-lspconfig.nvim",
        -- 声明该插件依赖于 williamboman/mason.nvim
        dependencies = { "williamboman/mason.nvim" },
        -- 插件的配置函数
        config = function()
            -- 调用 mason-lspconfig 插件的 setup 方法进行配置
            require("mason-lspconfig").setup({
                -- 确保安装的 LSP 服务器列表，这里配置了 lua_ls
                ensure_installed = {
                    "lua_ls",
                    "texlab",
                },
            })
        end
    },
    -- 配置 neovim/nvim - lspconfig 插件
    {
        "neovim/nvim-lspconfig",
        -- 声明该插件依赖于 williamboman/mason - lspconfig.nvim 和 hrsh7th/cmp - nvim - lsp
        dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
        -- 插件的配置函数
        config = function()
            -- 获取 cmp_nvim_lsp 插件提供的默认 LSP 客户端能力
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- 对 lua_ls 语言服务器进行配置，将获取到的能力传递给它
            require("lspconfig").lua_ls.setup ({
                capabilities = capabilities,
            })
        end
    }
}
