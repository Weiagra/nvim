-- 返回一个包含插件配置信息的表，用于 Neovim 的插件管理
return {
    -- 指定要使用的插件，这里是 nvim-telescope/telescope.nvim，它是一个强大的模糊查找工具
    "nvim-telescope/telescope.nvim",
    -- 定义该插件所依赖的其他插件
    dependencies = {
        -- plenary.nvim 为 telescope.nvim 提供了许多实用的 Lua 函数，是必需的依赖库
        "nvim-lua/plenary.nvim",
        {
            -- telescope-fzf-native.nvim 是 telescope.nvim 的扩展，使用 fzf 算法提升查找速度
            'nvim-telescope/telescope-fzf-native.nvim',
            -- build 字段指定在安装此插件时执行的操作，这里是一个自定义的编译函数
            build = function()
                -- 定义要执行的编译命令，这里是 make
                local make_command = 'make'
                -- 获取插件的安装目录，作为编译命令的工作目录
                local cwd = vim.fn.stdpath('data') .. '/lazy/telescope-fzf-native.nvim'
                -- 执行 make 命令进行编译，并将结果存储在 result 变量中
                local result = vim.fn.system({ 'make' }, { cwd = cwd })
                -- 检查 shell 命令的返回值，如果不为 0 表示编译失败
                if vim.v.shell_error ~= 0 then
                    -- 使用 vim.notify 函数给出错误提示，包含错误信息
                    vim.notify('Failed to build telescope-fzf-native.nvim: ' .. result, vim.log.levels.ERROR)
                end
            end
        }
    },
    -- 插件的配置函数，在插件加载时执行
    config = function()
        -- 尝试加载 telescope 模块，将加载结果和模块对象存储在 status_ok 和 telescope 变量中
        local status_ok, telescope = pcall(require, 'telescope')
        -- 如果加载失败
        if not status_ok then
            -- 使用 vim.notify 函数给出错误提示
            vim.notify('Failed to load telescope.nvim', vim.log.levels.ERROR)
            -- 直接返回，不继续执行后续配置
            return
        end

        -- 定义一个函数，用于设置 telescope 的基本配置和加载扩展
        local function setup_telescope()
            -- 调用 telescope 的 setup 方法进行配置
            telescope.setup {
                -- 配置扩展选项
                extensions = {
                    -- 配置 fzf 扩展
                    fzf = {
                        -- 启用模糊匹配，设为 false 则只进行精确匹配
                        fuzzy = true,
                        -- 覆盖通用的排序器，使用 fzf 的排序算法
                        override_generic_sorter = true,
                        -- 覆盖文件排序器，使用 fzf 的排序算法
                        override_file_sorter = true,
                        -- 设置大小写模式为智能大小写，即根据输入自动处理大小写
                        case_mode = "smart_case",
                        -- 设置查找结果的布局策略为水平布局
                        layout_strategy = "horizontal",
                        -- 配置布局的具体参数
                        layout_config = {
                            -- 将搜索框置于顶部
                            prompt_position = "top",
                        },
                    }
                }
            }
            -- 加载 fzf 扩展，使 telescope 能使用 fzf 的功能
            telescope.load_extension('fzf')
        end

        -- 定义一个函数，用于设置 telescope 的按键映射
        local function setup_keymaps()
            -- 引入 telescope 的内置功能模块
            local builtin = require('telescope.builtin')
            -- 在普通模式下，按下 <leader>ff 调用查找文件功能，并添加描述信息
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            -- 在普通模式下，按下 <leader>fg 调用实时全局搜索功能，并添加描述信息
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
            -- 在普通模式下，按下 <leader><space> 调用查找缓冲区功能，并添加描述信息
            vim.keymap.set('n', '<leader>bu', builtin.buffers, { desc = 'Find Buffers' })
            -- 在普通模式下，按下 <leader>fh 调用查找帮助标签功能，并添加描述信息
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp Tags' })
            -- 在普通模式下，按下 <leader>? 调用查找最近打开的文件功能，并添加描述信息
            vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
            -- 在普通模式下，按下 <leader>/ 调用在当前缓冲区进行模糊搜索的功能，并添加描述信息
            vim.keymap.set('n', '<leader>/', function()
                -- 调用 current_buffer_fuzzy_find 函数进行当前缓冲区的模糊搜索
                -- 使用 get_dropdown 主题，设置窗口透明度为 10，不显示预览器
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            -- 为该按键映射添加描述信息
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- 可选的按键映射：在普通模式下，按下 <leader>gf 调用查找 Git 文件功能，并添加描述信息
            -- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
            -- 可选的按键映射：在普通模式下，按下 <leader>ps 调用项目搜索功能，并添加描述信息
            -- vim.keymap.set('n', '<leader>ps', function()
            --     提示用户输入搜索关键字，并在项目中进行全局搜索
            --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
            -- end, { desc = '[P]roject [S]earch' })
        end

        -- 调用 setup_telescope 函数进行 telescope 的基本配置和扩展加载
        setup_telescope()
        -- 调用 setup_keymaps 函数设置按键映射
        setup_keymaps()
    end
}
