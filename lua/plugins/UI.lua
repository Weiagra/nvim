return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		-- event = "VeryLazy",
		-- lazy = true,
		version = "*",
		config = function()
			-- 调用 bufferline 插件的 setup 函数进行详细配置
			require("bufferline").setup({
				-- 配置 bufferline 的各项选项
				options = {
					-- 设置诊断信息的来源为 Neovim 内置的 LSP（语言服务器协议），
					-- 这样 bufferline 会显示 LSP 提供的诊断信息，如错误、警告等
					diagnostics = "nvim_lsp",
					-- 配置偏移量，用于为特定文件类型的窗口让出空间，避免界面重叠
					offsets = {
						{
							-- 指定需要让出空间的文件类型为 "NvimTree"，
							-- 即 NvimTree 文件浏览器插件的窗口
							filetype = "NvimTree",
							-- 在偏移区域显示的文本内容，这里显示 "File Explorer" 作为提示
							text = "File Explorer",
							-- 显示文本所使用的高亮组，这里使用 "Directory" 高亮组来设置文本样式
							highlight = "Directory",
							-- 文本在偏移区域的对齐方式，设置为左对齐
							text_align = "left",
						},
					},
				},
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true,
	},

	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("illuminate").configure()
		end,
	},
}
