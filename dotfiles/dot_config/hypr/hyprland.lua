require("~/.config/hypr/bindings.lua")
require("~/.config/hypr/workspaces.lua")

hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm app -- noctalia")
end)

-- Place 2nd monitor to the left (DP indicaters sometimes change)
hl.monitor({ output = "DP-2", mode = "preferred", position = "1920x0", scale = "1" })
hl.monitor({ output = "DP-3", mode = "preferred", position = "0x0", scale = "1" })

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
  },

  input = {
    kb_layout = "us,us",
    kb_variant = "basic,intl",
    kb_options = "caps:swapescape", -- caps:escpae or caps:swapescape
  },

  decoration = {
    rounding = 20,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },

  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },
})
