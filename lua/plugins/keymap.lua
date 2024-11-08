local keymap_plugins = {
  {
    "folke/which-key.nvim",
    opts = require("config.plugin_confs.which-key"),
    keys = require("config.keybindings").which_key_bindings,
  }
}

return keymap_plugins
