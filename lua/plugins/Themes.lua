return {
  {
      "folke/tokyonight.nvim",
      dependencies = {
          "nvim-lualine/lualine.nvim",
          "nvim-tree/nvim-web-devicons",
          "utilyre/barbecue.nvim",
          "SmiteshP/nvim-navic",
      },
      config = function()
        vim.cmd[[colorscheme tokyonight-moon]]
        -- 调用 lualine 的 setup 方法进行配置
        require('lualine').setup ({
            -- 通用配置选项
            options = {
                icons_enabled = true, -- 启用图标显示，需要 nvim-web-devicons 插件支持
                theme = 'auto', -- 自动选择主题，也可指定具体主题，如 'tokyonight'
                -- 组件分隔符，用于分隔同一部分内的不同组件
                component_separators = { left = '', right = ''},
                -- 部分分隔符，用于分隔不同的状态栏部分
                section_separators = { left = '', right = ''},
                -- 禁用状态栏和 winbar 的文件类型列表
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                -- 忽略焦点变化的文件类型列表
                ignore_focus = {},
                -- 始终在中间分隔状态栏
                always_divide_middle = true,
                -- 始终显示标签栏
                always_show_tabline = true,
                -- 是否使用全局状态栏，设为 false 则每个窗口有独立状态栏
                globalstatus = false,
                -- 刷新间隔，单位为毫秒
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            -- 活动状态栏部分配置
            sections = {
                -- 显示当前模式，如 normal、insert 等
                lualine_a = {'mode'},
                -- 显示版本控制分支、文件差异和诊断信息
                lualine_b = {'branch', 'diff', 'diagnostics'},
                -- 显示当前打开的文件名
                lualine_c = {'filename'},
                -- 显示文件编码、文件格式和文件类型
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                -- 显示文件的进度，如百分比
                lualine_y = {'progress'},
                -- 显示光标在文件中的位置，如行号和列号
                lualine_z = {'location'}
            },
            -- 非活动状态栏部分配置
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            -- 标签栏配置，留空表示使用默认配置
            tabline = {},
            -- winbar 配置，留空表示使用默认配置
            winbar = {},
            -- 非活动 winbar 配置，留空表示使用默认配置
            inactive_winbar = {},
            -- 扩展配置，留空表示不使用扩展
            extensions = {}
        })

        --调用 barbecue 的 setup 方法进行配置
          require('barbecue').setup({
              theme = 'auto',
          })
      end
  },
}