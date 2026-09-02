local mainMod = "SUPER"
local nipc = "noctalia msg "
local lpfx = "uwsm app -- "

-- Core binds
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(nipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(nipc .. "panel-toggle session"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(nipc .. "panel-toggle control-center"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(nipc .. "settings-toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(nipc .. "window-switcher"))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(lpfx .. "foot"))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(lpfx .. "firefox"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(lpfx .. "nautilus"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(lpfx .. "firefox"))
hl.bind(mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd(lpfx .. "firefox --private-window"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(lpfx .. "spotify"))

hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "d" }))

-- Toggle scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
-- Move window to scratchpad
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Multiple monitor binds
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + ALT + TAB", hl.dsp.window.move({ monitor = "+1", follow = false }))

-- Shrink windows up/down/left/right
hl.bind(mainMod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind(mainMod .. " + ALT + code:20", hl.dsp.window.resize({ x = -25, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + code:21", hl.dsp.window.resize({ x = 25, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -25, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 25, relative = true }))

hl.bind(mainMod .. " + CTRL + code:20", hl.dsp.window.resize({ x = -300, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + code:21", hl.dsp.window.resize({ x = 300, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -300, relative = true }))
hl.bind(mainMod .. " + CTRL + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 300, relative = true }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Toggle grouping
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
-- Move active window out of group
hl.bind(mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }))

-- Move window to group in left/right/top/bottom
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + ALT + UP", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.window.move({ into_group = "d" }))

-- Next/previous window in group
hl.bind(mainMod .. " + ALT + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + ALT + SHIFT + TAB", hl.dsp.group.prev())

-- Move grouped window focus left/right
hl.bind(mainMod .. " + CTRL + LEFT", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + RIGHT", hl.dsp.group.next())

-- Next/previous window in group
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.group.next())
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.group.prev())

-- Switch to group window _index_
for index = 1, 5 do
  hl.bind(mainMod .. " + ALT + code:" .. tostring(index + 9), hl.dsp.group.active({ index = index }))
end

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(nipc .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(nipc .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(nipc .. "volume-mute"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(nipc .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(nipc .. "brightness-down"), { locked = true, repeating = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(nipc .. "media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(nipc .. "playerctl toggle"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(nipc .. "playerctl toggle"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(nipc .. "media previous"), { locked = true })
