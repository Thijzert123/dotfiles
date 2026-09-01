local mainMod = "SUPER"
local nipc = "noctalia msg "
local lpfx = "uwsm app -- "

-- Core binds
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(nipc .. "panel-toggle launcher"))
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(nipc .. "panel-toggle control-center"))
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(nipc .. "settings-toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(nipc .. "window-switcher"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(nipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(nipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(nipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(nipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(nipc .. "brightness-down"))
