-- lua/kornvim_configurator/init.lua

-- Define an empty table that will represent your plugin.
local M = {}

-- Load the core module, where the main logic will be.
require("kornvim_configurator.core")

--- The `setup()` function is a common convention for Neovim plugins.
-- It allows the user to configure your plugin by passing an options table.
-- @param opts table of configuration options
function M.setup(opts)
  -- Add your configuration logic here.
  -- e.g., if opts.some_option then ... end
  print("Kornvim Configurator is set up!")
end

-- Return the M table, making its functions accessible from the outside.
return M
