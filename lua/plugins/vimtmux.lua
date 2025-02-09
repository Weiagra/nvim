-- 返回一个包含插件配置信息的表，此配置用于 lazy.nvim 的 Neovim 插件管理器
return {
  -- 该插件可实现 Neovim 和 Tmux 窗口之间的无缝导航切换
  "christoomey/vim-tmux-navigator",
  -- cmd 字段用于指定插件提供的命令
  -- 插件管理器会在需要执行这些命令时才加载该插件，实现按需加载以提高启动性能
  cmd = {
      -- 向左导航，可在 Neovim 窗口或 Tmux 窗格间向左切换
      "TmuxNavigateLeft",
      -- 向下导航，可在 Neovim 窗口或 Tmux 窗格间向下切换
      "TmuxNavigateDown",
      -- 向上导航，可在 Neovim 窗口或 Tmux 窗格间向上切换
      "TmuxNavigateUp",
      -- 向右导航，可在 Neovim 窗口或 Tmux 窗格间向右切换
      "TmuxNavigateRight",
      -- 导航到上一个窗口或窗格
      "TmuxNavigatePrevious",
      -- 列出 TmuxNavigator 相关进程
      "TmuxNavigatorProcessList",
  },

  -- keys 字段用于设置按键映射，方便用户通过快捷键来执行插件功能
  keys = {
      -- 将 Ctrl + h 组合键映射为执行 TmuxNavigateLeft 命令，用于向左导航
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      -- 将 Ctrl + j 组合键映射为执行 TmuxNavigateDown 命令，用于向下导航
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      -- 将 Ctrl + k 组合键映射为执行 TmuxNavigateUp 命令，用于向上导航
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      -- 将 Ctrl + l 组合键映射为执行 TmuxNavigateRight 命令，用于向右导航
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      -- 将 Ctrl + \ 组合键映射为执行 TmuxNavigatePrevious 命令，用于导航到上一个窗口或窗格
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}