return {
    -- 指定要使用的插件，这里是 nvim-autopairs
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    -- 插件的配置函数，在插件加载时会执行其中的代码
    config = function()
        -- 安全地尝试加载 nvim-autopairs 插件
        -- pcall 函数用于捕获可能出现的错误，避免因插件加载失败导致后续代码无法执行
        local npairs_ok, npairs = pcall(require, "nvim-autopairs")
        -- 如果 nvim-autopairs 插件加载失败，直接返回，不再继续执行后续配置代码
        if not npairs_ok then
            return
        end

        -- 对 nvim-autopairs 插件进行详细配置
        npairs.setup {
            -- 启用 Tree-sitter 语法检查
            -- 这可以让插件根据不同的语法上下文来决定是否插入配对字符，避免在不合适的地方插入
            check_ts = true,
            -- 针对不同编程语言的 Tree-sitter 配置
            ts_config = {
                -- 对于 Lua 语言，在 "string" 和 "source" 语法节点中进行配对检查
                lua = { "string", "source" },
                -- 对于 JavaScript 语言，在 "string" 和 "template_string" 语法节点中进行配对检查
                javascript = { "string", "template_string" },
            },
            -- 快速包裹功能的配置
            fast_wrap = {
                -- 触发快速包裹功能的按键映射，这里设置为 <M-e>（通常是 Alt + e）
                map = '<M-e>',
                -- 可以进行快速包裹的字符列表
                chars = { '{', '[', '(', '"', "'" },
                -- 匹配的模式，用于确定快速包裹的触发位置
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                -- 结束快速包裹操作的按键，这里设置为 $
                end_key = '$',
                -- 用于选择快速包裹位置的按键列表
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                -- 是否检查逗号，确保在合适的位置插入配对字符
                check_comma = true,
                -- 快速包裹过程中高亮显示的颜色组，这里使用 'Search' 高亮组
                highlight = 'Search',
                -- 快速包裹过程中灰色提示的颜色组，这里使用 'Comment' 高亮组
                highlight_grey='Comment'
            },
        }

        -- 配置自动补全时自动添加配对字符的功能
        -- 引入 nvim-autopairs 与 nvim-cmp 集成的模块
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        -- 安全地尝试加载 nvim-cmp 插件
        local cmp_status_ok, cmp = pcall(require, "cmp")
        -- 如果 nvim-cmp 插件加载失败，直接返回，不再继续执行后续配置代码
        if not cmp_status_ok then
            return
        end
        -- 当 nvim-cmp 完成补全确认操作时，触发 nvim-autopairs 的自动添加配对字符功能
        -- map_char = { tex = "" } 表示在 LaTeX 文件类型中不进行特殊的配对字符映射
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
    end
}