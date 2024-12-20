local appearance = require 'config/appearance'
local fonts = require 'config/fonts'
local general = require 'config/general'
local keymaps = require 'config/keymaps'

local config = {}

appearance.apply_to_config(config)
fonts.apply_to_config(config)
general.apply_to_config(config)
keymaps.apply_to_config(config)

return config
