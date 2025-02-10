return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },

    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>",          desc = "Tag a file" },
        { "<c-e>",     "<cmd>Grapple toggle_tags<cr>",     desc = "Toggle tags menu" },

        { "<leader>y", "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
        { "<leader>u", "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
        { "<leader>i", "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
        { "<leader>o", "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },

        { "<c-s-n>",   "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
        { "<c-s-p>",   "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
    },
}
