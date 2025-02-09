return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	tag = "v2.15", -- 最新版本的vimtex有些bug
	config = function()
		-- VimTeX configuration goes here, e.g.
		-- 设置 LaTeX 相关的全局变量
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_compiler_latexmk_engines = {['_'] = '-xelatex'}
        vim.g.vimtex_compiler_latexrun_engines = {['_'] = 'xelatex'}
        vim.g.vimtex_quickfix_mode = 1 --不自动弹出报错窗口
        vim.g.vimtex_compiler_progname = 'nvr'  -- 使用 neovim-remote 打开 PDF
        -- 设置 conceallevel
        vim.opt.conceallevel = 1
        -- 设置 TeX 隐藏字符选项
        vim.g.tex_conceal = 'abdmg'
        vim.g.vimtex_syntax_enabled = 0  -- 关闭自带的语法高亮，使用treesitter进行高亮

        vim.cmd('filetype plugin indent on')
	end,
}
