
return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "onsails/lspkind-nvim",  -- Add lspkind for symbol icons
    },
    config = function()
        -- Import codeium module
        local codeium = require("codeium")

        -- Set up codeium
        codeium.setup({
            -- Add specific configuration options here if needed
        })

        -- Import nvim-autopairs completion functionality
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        -- Import nvim-cmp plugin (completions plugin)
        local cmp = require("cmp")

        -- Import lspkind for formatting icons in completions
        local lspkind = require("lspkind")

        -- Set up nvim-cmp with lspkind formatting and autopairs integration
        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",        -- Show symbols only
                    maxwidth = 50,          -- Max width of completion popup
                    ellipsis_char = '...',  -- Use ellipsis for truncated items
                    symbol_map = { Codeium = "" },  -- Symbol for Codeium
                })
            },
        })

        -- Make codeium and nvim-autopairs completion work together
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
