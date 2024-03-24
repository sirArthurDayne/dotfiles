require("krosis.config")
require("krosis.lazy")
require("krosis.telescope-config")
require("krosis.toggleterm-config")
require("krosis.autopairs-config")
require("krosis.mason-config")
require("krosis.nulls-config")
require("krosis.notify-config")
require("krosis.harpoon-config")
require("krosis.dap-config")
require("krosis.gopher-config")
require("krosis.noise-config")

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
