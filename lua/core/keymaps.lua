local global = vim.g
local keymap = vim.keymap

global.mapleader = " " -- 设置全局领导者键为空格

-- ---------- 插入模式 ---------- ---
-- 在插入模式下，将 jk 按键组合映射为按下 ESC 键，以便快速从插入模式回到正常模式
--keymap.set("i", "jk", "<ESC>")  -- 此映射被注释，未生效

-- ---------- 视觉模式 ---------- ---
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- 在视觉模式下，按下 J 键将选中的文本向下移动一行，并重新选中和调整缩进
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- 在视觉模式下，按下 K 键将选中的文本向上移动一行，并重新选中和调整缩进

-- ---------- 正常模式 ---------- ---
keymap.set("n", "<leader>sv", "<C-w>v") -- 在正常模式下，按下 <leader>sv（即空格键 + s + v）水平分割窗口，创建一个新的垂直窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 在正常模式下，按下 <leader>sh（即空格键 + s + h）垂直分割窗口，创建一个新的水平窗口
keymap.set("n", "<A-n>", "<cmd>bNext<CR>") -- 在正常模式下，按下 Alt + Tab 组合键切换到下一个缓冲区
keymap.set("n", "<leader>bc", "<cmd>bd<CR>") -- 在正常模式下，按下 <leader>bc（即空格键 + b + c）关闭当前缓冲区
keymap.set("n", "<leader>nh", ":nohl<CR>") -- 在正常模式下，按下 <leader>nh（即空格键 + n + h）取消搜索结果的高亮显示
keymap.set("n", "<C-L>", ":bnext<CR>") -- 在正常模式下，按下 Ctrl + L 组合键切换到下一个缓冲区
keymap.set("n", "<C-H>", ":bprevious<CR>") -- 在正常模式下，按下 Ctrl + H 组合键切换到上一个缓冲区

-- ---------- 混合 ---------- ---
-- 在正常模式、插入模式和视觉模式下，禁用方向键
-- keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
-- keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

keymap.set({ "v", "n" }, "<leader>y", '"+y') -- 在视觉模式和正常模式下，按下 <leader>y（即空格键 + y）将选中的内容复制到系统剪贴板

-- ---------- 插件 ---------- ---
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- 在正常模式下，按下 <leader>e（即空格键 + e）切换 NvimTree 文件树插件的显示与隐藏
keymap.set("n", "<leader>f", ":Format<CR>")
keymap.set("n", "<leader>sf", ":FormatWrite<CR>")
