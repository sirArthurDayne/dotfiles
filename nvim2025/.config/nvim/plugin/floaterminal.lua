-- Create a floating terminal centered with optional config
local state = {
    floating = {
        buf = -1, --default state = invalid
        win = -1,
    },
}
function OpenFloatingTerm(opts)
    opts = opts or {}

    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor((opts.width or 0.6) * ui.width)
    local height = math.floor((opts.height or 0.6) * ui.height)

    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
    end


    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })
    -- Optional: go back to normal mode with <Esc>
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n><CR>", { buffer = buf, silent = true })

    return { buf = buf, win = win }
end

--make a command available
local toogle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = OpenFloatingTerm({ width = 0.8, height = 0.8, buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
    vim.cmd("normal i")
    -- print(vim.inspect(state.floating))
end
vim.api.nvim_create_user_command("FloatTerminal", toogle_terminal, {})

vim.keymap.set({ "n", "t" }, "<C-\\>", toogle_terminal)
