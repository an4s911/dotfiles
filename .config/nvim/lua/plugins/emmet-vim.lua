return {
    "mattn/emmet-vim",
    config = function()
        local function map(m, k, v, opts)
            vim.keymap.set(m, k, v, opts)
        end

        map(
            "x",
            "<Leader>ew",
            "<Plug>(emmet-expand-abbr)",
            { desc = "Emmet: Expand Abbreviation", silent = true, noremap = true }
        )
    end,
}
