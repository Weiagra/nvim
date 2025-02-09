return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {}
        -- 默认进入状态不开启nvim-tree
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end
}
