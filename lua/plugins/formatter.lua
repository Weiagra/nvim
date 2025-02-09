-- 代码自动格式化
return {
  "mhartington/formatter.nvim",  -- 使用 mhartington/formatter.nvim 插件实现代码自动格式化功能
  config = function()  -- 插件的配置函数，在插件加载时执行
      local util = require "formatter.util"  -- 引入 formatter 插件的工具模块，后续用于获取文件名、文件路径等操作，此处行末逗号多余，应去除
      require("formatter").setup {  -- 调用 formatter 插件的 setup 方法进行配置
          logging = true,  -- 开启日志记录功能，方便调试和查看格式化过程中的信息
          log_level = vim.log.levels.WARN,  -- 设置日志级别为 WARN，仅记录警告及以上级别的日志信息
          filetype = {  -- 按文件类型配置不同的格式化器
              lua = {  -- 针对 Lua 文件的格式化配置
                  require("formatter.filetypes.lua").stylua,  -- 使用 formatter 插件内置的 stylua 格式化器来格式化 Lua 文件
                  function()  -- 自定义一个格式化函数
                      if util.get_current_buffer_file_name() == "special.lua" then  -- 如果当前缓冲区的文件名是 special.lua
                          return nil  -- 则不进行格式化，返回 nil
                      end
                      return {  -- 对于其他 Lua 文件，使用 stylua 进行格式化
                          exe = "stylua",  -- 要执行的格式化程序为 stylua
                          args = {  -- stylua 的命令行参数
                              "--search-parent-directories",  -- 让 stylua 搜索父目录以查找配置文件
                              "--stdin-filepath",  -- 指定要格式化的文件路径，使用标准输入方式处理
                              util.escape_path(util.get_current_buffer_file_path()),  -- 对当前缓冲区文件路径进行转义处理后作为参数传入
                              "--",
                              "-",
                          },
                          stdin = true,  -- 使用标准输入传递要格式化的内容
                      }
                  end
              },
              ["*"] = {  -- 对所有文件类型（通用配置）的格式化配置
                  require("formatter.filetypes.any").remove_trailing_whitespace  -- 使用 formatter 插件内置的移除行尾空白的格式化器
              }
          }
      }
      -- nnoremap <silent> <leader>f :Format<CR>
      -- nnoremap <silent> <leader>F :FormatWrite<CR>
  end
}