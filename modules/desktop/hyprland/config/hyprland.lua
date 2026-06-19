require("vars")
require("style")
require("keybinds")
require("input_devices")
require("window_rules")

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = 1.6,
})

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("awww-daemon & sleep 0.5 && awww clear 101010")
end)
