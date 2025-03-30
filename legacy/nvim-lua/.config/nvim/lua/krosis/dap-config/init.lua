local dap = require("dap")
--invoke dap languages
require("krosis.dap-config.node")
require("krosis.dap-config.go")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(1)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
--invoke mappings
require("krosis.dap-config.mappings")
