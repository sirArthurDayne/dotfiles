return {
    {
        'echasnovski/mini.nvim',
        config = function()
            local mini_ai = require("mini.ai")
            mini_ai.setup()
            local status_line = require("mini.statusline")
            status_line.setup { use_icons = true }
            local notify = require("mini.notify")
            notify.setup {}
            local surround = require("mini.surround")
            surround.setup {}
            local completion = require("mini.completion")
            completion.setup {}
            local indent_scope = require("mini.indentscope")
            indent_scope.setup {}
            require('mini.icons').setup()
            MiniIcons.tweak_lsp_kind()         --enable in lsp completion
            MiniIcons.mock_nvim_web_devicons() -- allow integration to plugint that use nvim_web_devicons
        end
    }
}
-- [ a, b ] [ p , q ]
