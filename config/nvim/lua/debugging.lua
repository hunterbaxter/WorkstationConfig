local dap, ui = require("dap"), require("dapui")

ui.setup({
  controls = {
    enabled = true,
    element = "repl",
    icons = {
      pause = "pause",
      play = "play",
      step_into = "step_into",
      step_over = "step_over",
      step_out = "step_out",
      step_back = "step_back",
      run_last = "run_last",
      terminate = "terminate",
    },
  },
})

-- local status_ok_vt, dap_vt = pcall(require, "nvim-dap-virtual-text")
-- if not dap_vt then
--   vim.notify("dap virtual text require failed")
--   return
-- end
--
-- dap_vt.setup()

-- local status_ok_dap_python, dap_python = pcall(require, "dap-python")
-- if not status_ok_dap_python then
--   vim.notify("dap python require failed")
--   return
-- end
-- dap_python.setup("/usr/bin/python3")

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/h/.local/lib/vscodecpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.c = dap.configurations.cpp

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function() return "/usr/bin/python" end,
  },
}
dap.adapters.python = {
  type = "executable",
  -- command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
  command = "/usr/bin/python3",
  args = { "-m", "debugpy.adapter" },
}

dap.listeners.after.event_initialized["dapui_config"] = function() ui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() ui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() ui.close() end
