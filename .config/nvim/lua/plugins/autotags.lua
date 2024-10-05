return {
    "windwp/nvim-ts-autotag",
    config = function()
        local autotag = require("nvim-ts-autotag")
        autotag.setup({
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close_on_slash = true,
                filetypes = {
                    "html",
                    "xml",
                    "htmldjango",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "jsx",
                },
            },
        })
    end,
}
