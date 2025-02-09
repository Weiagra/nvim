return{
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config =function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  -- Set header
  dashboard.section.header.val = {
    "                                                                                         ",
    "                                                                                         ",
    "                                                                                         ",
    "  ████╗   ████╗ ██╗   ██╗ ███╗   ██╗ ████████╗  ██████╗  ██╗       ██╗ ██╗ ████╗   ████╗ ",
    "  ██╔██╗ ██╔██║ ╚██╗ ██╔╝ ████╗  ██║ ██╔═════╝ ██╔═══██╗ ╚██╗     ██╔╝ ██║ ██╔██╗ ██╔██║ ",
    "  ██║╚████╔╝██║  ╚████╔╝  ██╔██╗ ██║ ██████╗   ██║   ██║  ╚██╗   ██╔╝  ██║ ██║╚████╔╝██║ ",
    "  ██║ ╚██╔╝ ██║   ╚██╔╝   ██║╚██╗██║ ██╔═══╝   ██║   ██║   ╚██╗ ██╔╝   ██║ ██║ ╚██╔╝ ██║ ",
    "  ██║  ╚═╝  ██║    ██║    ██║ ╚████║ ████████╗ ╚██████╔╝    ╚████╔╝    ██║ ██║  ╚═╝  ██║ ",
    "  ╚═╝       ╚═╝    ╚═╝    ╚═╝  ╚═══╝ ╚═══════╝  ╚═════╝      ╚═══╝     ╚═╝ ╚═╝       ╚═╝ ",
    "                                                                                         ",
    "                                                                                         ",
    "                                                                                         ",

    -- "███╗   ███╗██╗   ██╗███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "████╗ ████║╚██╗ ██╔╝████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "██╔████╔██║ ╚████╔╝ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "██║╚██╔╝██║  ╚██╔╝  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "██║ ╚═╝ ██║   ██║   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                                                                      
  }
  -- Set menu
  dashboard.section.buttons.val = {
    dashboard.button( "e", "  > 新建文件"  , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "󰈞  > 查找文件"  , ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button( "r", "󱋡  > 历史文件"  , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > 本地配置"  , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "p", "  > 插件服务"  , "<Cmd>Lazy<CR>"),
    dashboard.button( "m", "  > Mason服务" ,"<Cmd>Mason<CR>" ),
    dashboard.button( "q", "󰅚  > 退出nvim" , ":qa<CR>"),
  }
  
  -- Set footer
  dashboard.section.footer.val = {
    "Welcome to use MyNeovim.",
    "    Author: Weiagra     ",
  }

  -- Send config to alpha
  alpha.setup(dashboard.opts)
  -- Disable folding on alpha buffer
  vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end
}

