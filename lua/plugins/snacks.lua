return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        explorer = {
            enabled = false
        },
        zen = {
            enabled = true,
            win = {
                -- Hide backdrop
                backdrop = {
                    transparent = false
                }
            },
            toggles = {
                -- Turn off dim plugin for zen mode
                dim = false
            },
            show = {
                statusline = false, -- can only be shown when using the global statusline
                tabline = false
            }
        },
        indent = {
            enabled = false
        } -- Disable indent guides
    },

    keys = { -- Zen mode
    {
        "<leader>cz",
        function()
            Snacks.zen()
        end,
        desc = "Toggle Zen Mode"
    }}
}
