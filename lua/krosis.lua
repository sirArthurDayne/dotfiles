require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
        selection_caret = "> "
    }
}
--require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
