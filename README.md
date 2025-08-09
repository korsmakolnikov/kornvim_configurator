# Kornvim configurator

### **Kornvim Configurator**
This repository contains the core configuration for my Neovim setup, structured
as a modular plugin. The primary goal is to separate my foundational settings
from my other, more project-specific configurations, ensuring a clean and
manageable `init.lua`.

-----

### **Features**
  * **Modular Design**: Centralizes all core Neovim settings into a single,
    self-contained plugin.
  * **Easy Provisioning**: Simplifies the process of setting up my configuration
    on new machines.
  * **Separation of Concerns**: Keeps base configurations separate from plugin
    management and project-specific tweaks.

-----

### **Getting Started**
To use this plugin, simply include it in your Neovim configuration. If you're
using a plugin manager like `lazy.nvim`, your `init.lua` might look something
like this:

```lua
-- ~/.config/nvim/init.lua

require("lazy").setup({
  -- Other plugins...

  {
    "path/to/kornvim_configurator",
    config = function()
      require("kornvim_configurator").setup({
        -- Optional configuration options here
      })
    end,
  },
})
```

The `setup()` function can be used to pass in any custom options you wish to
apply to the core configuration.

-----

### **License**
This project is licensed under the MIT License. See the `LICENSE` file for
details.
