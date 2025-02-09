local option = vim.opt  
local buffer = vim.b    
local global = vim.g    

-- ========== 全局设置==========
option.showmode = false  -- 不显示当前模式信息，例如在底部不再显示 "-- INSERT --" 等提示，因为有些插件或状态栏会提供此信息
option.backspace = { "indent", "eol", "start" }  -- 设置退格键的行为，允许退格删除缩进、行末空白和行首字符
option.tabstop = 4  -- 设置一个制表符显示的宽度为 4 个空格
option.shiftwidth = 4  -- 设置自动缩进时使用的空格数为 4
option.expandtab = true  -- 将制表符转换为空格，确保代码中使用空格进行缩进
option.shiftround = true  -- 自动缩进时将缩进量舍入到 shiftwidth 的倍数
option.autoindent = true  -- 新行自动使用上一行的缩进
option.smartindent = true  -- 智能缩进，根据代码语法自动调整缩进，例如在 C、Python 等语言中更合理地缩进代码
option.number = true  -- 在编辑器左侧显示行号
option.relativenumber = true  -- 显示相对行号，方便使用数字 + 操作命令进行快速移动，当前行显示为 0，上方和下方的行显示相对距离
option.wildmenu = true  -- 启用命令行补全菜单，当输入命令时，提供候选补全项的菜单
option.hlsearch = false  -- 搜索后不高亮显示匹配结果，避免搜索后文本一直高亮干扰视线
option.ignorecase = true  -- 搜索时忽略大小写，除非搜索模式中包含大写字母
option.smartcase = true  -- 与 ignorecase 配合使用，如果搜索模式中有大写字母，则区分大小写
option.completeopt = { "menuone", "noselect" }  -- 补全选项设置，当只有一个补全项时也显示菜单，且不自动选择补全项，让用户手动选择
option.cursorline = true  -- 高亮显示当前光标所在的行，方便定位光标位置
option.termguicolors = true  -- 启用真彩色支持，使 Neovim 能够显示更丰富的颜色，适配具有真彩色显示能力的终端
option.signcolumn = "yes"  -- 始终显示符号列，用于显示诊断信息（如代码检查的错误、警告）、Git 状态等图标
option.autoread = true  -- 当文件在外部被修改时，自动重新读取文件内容
option.title = true  -- 设置终端窗口标题为当前编辑的文件名，方便在多个窗口之间区分编辑的文件
option.swapfile = false  -- 不使用交换文件，交换文件用于在意外崩溃时恢复数据，但可能会占用磁盘空间和造成隐私问题
option.backup = false  -- 不创建备份文件，备份文件是在保存文件时自动创建的副本
option.updatetime = 50  -- 设置更新时间为 50 毫秒，影响一些插件的响应速度，例如诊断信息的实时更新
option.mouse = "a"  -- 启用鼠标在所有模式（正常模式、插入模式、可视模式等）下的操作，如点击、滚动等
option.undofile = true  -- 启用持久化撤销功能，允许在不同会话之间保留撤销历史记录
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')  -- 设置撤销文件的存储目录为用户主目录下的 .local/share/nvim/undo 文件夹
option.exrc = true  -- 允许使用 .exrc 文件进行局部配置，.exrc 文件可以为特定项目设置个性化的 Neovim 选项
option.wrap = false  -- 不自动换行，文本超出窗口宽度时会显示滚动条，方便查看长行代码
option.splitright = true  -- 垂直分割窗口时，新窗口在右侧显示

-- ========== 缓冲区设置 ==========
buffer.fileencoding = "utf-8"  -- 设置当前缓冲区的文件编码为 UTF - 8，确保文件以 UTF - 8 编码进行读写

-- 启用语法高亮和文件类型检测
-- vim.cmd([[
--   syntax enable
--   filetype plugin indent on
-- ]])