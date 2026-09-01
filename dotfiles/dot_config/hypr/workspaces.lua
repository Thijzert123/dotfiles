local monitor1 = "DP-2"
local monitor2 = "DP-3"

hl.workspace_rule({ workspace = "1", monitor = monitor1, persistent = true, default_name = "1" })
hl.workspace_rule({ workspace = "2", monitor = monitor1, persistent = true, default_name = "2" })
hl.workspace_rule({ workspace = "3", monitor = monitor1, persistent = true, default_name = "3" })
hl.workspace_rule({ workspace = "4", monitor = monitor1, persistent = true, default_name = "4" })
hl.workspace_rule({ workspace = "5", monitor = monitor1, persistent = true, default_name = "5" })
hl.workspace_rule({ workspace = "6", monitor = monitor1, persistent = true, default_name = "6" })
hl.workspace_rule({ workspace = "7", monitor = monitor1, persistent = true, default_name = "7" })
hl.workspace_rule({ workspace = "8", monitor = monitor1, persistent = true, default_name = "8" })
hl.workspace_rule({ workspace = "9", monitor = monitor1, persistent = true, default_name = "9" })
hl.workspace_rule({ workspace = "10", monitor = monitor1, persistent = true, default_name = "0" })

hl.workspace_rule({ workspace = "11", monitor = monitor2, persistent = true, default_name = "1" })
hl.workspace_rule({ workspace = "12", monitor = monitor2, persistent = true, default_name = "2" })
hl.workspace_rule({ workspace = "13", monitor = monitor2, persistent = true, default_name = "3" })
hl.workspace_rule({ workspace = "14", monitor = monitor2, persistent = true, default_name = "4" })
hl.workspace_rule({ workspace = "15", monitor = monitor2, persistent = true, default_name = "5" })
hl.workspace_rule({ workspace = "16", monitor = monitor2, persistent = true, default_name = "6" })
hl.workspace_rule({ workspace = "17", monitor = monitor2, persistent = true, default_name = "7" })
hl.workspace_rule({ workspace = "18", monitor = monitor2, persistent = true, default_name = "8" })
hl.workspace_rule({ workspace = "19", monitor = monitor2, persistent = true, default_name = "9" })
hl.workspace_rule({ workspace = "20", monitor = monitor2, persistent = true, default_name = "0" })

-- Split monitor workspaces
package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")
smw.setup({
  workspace_count = 10,
})
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    local code = tostring(i + 9) -- Use code:10 value instead of number 1 (otherwise it doens't work idk)
    if n == "10" then n = "0" end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    -- Switch to the Nth workspace on the currently focused monitor.
    hl.bind("SUPER + code:" .. code, smw.workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor
    hl.bind("SUPER + SHIFT + code:" .. code, smw.move_to_workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor silently
    hl.bind("SUPER + SHIFT + ALT + code:" .. code, smw.move_to_workspace_silent(n))
end
