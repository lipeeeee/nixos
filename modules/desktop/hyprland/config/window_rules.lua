hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

hl.window_rule({
  name   = "wiremix-settings",
  match  = { initial_title = "^(wiremix)$" },
  float  = true,
  center = true,
  size   = { "monitor_w * 0.5", "monitor_h * 0.5" },
})

hl.window_rule({
  name   = "yazi-floating",
  match  = { initial_title = "^(yazi-float)$" },
  float  = true,
  center = true,
  size   = { "monitor_w * 0.67", "monitor_h * 0.67" },
})

hl.window_rule({
  name   = "python-floating",
  match  = { initial_title = "^(python-float)$" },
  float  = true,
  center = true,
  size   = { "monitor_w * 0.67", "monitor_h * 0.67" },
})

hl.window_rule({
  name   = "nmtui-settings",
  match  = { initial_title = "^(nmtui)$" },
  float  = true,
  center = true,
  size   = { "monitor_w * 0.4", "monitor_h * 0.6" },
})
