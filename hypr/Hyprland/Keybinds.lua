-- Things I want to shorten --
local terminal = "kitty"
local filemgr  = terminal .. " -e spf"
local browser  = "firefox"
local ide      = "code"
local launcher = ""

-- Windows key on the keyboard --
local mainMod  = "SUPER" 

-- Workspace switching --
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }), { description = "Changes to the workspace according to which numkey is pressed." })
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }), { description = "Changes the focused window to the workspace according to which numkey is pressed." })
end

-- Screenshots --
hl.bind("Print", hl.dsp.exec_cmd([[grim - | wl-copy]]), { description = "Screenshots the entire screen and copies it." })
hl.bind("CTRL + Print", hl.dsp.exec_cmd([[wayfreeze --hide-cursor --after-freeze-cmd 'grim -g "$(slurp -d -b 000000aa -c 00000000 -s ffffff33)" - | wl-copy; killall wayfreeze']]), { description = "Sreenshots a selected portion of the screen and copies it/" })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[mkdir -p ~/Screenshots && grim ~/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png]]), { description = "Screenshots the entire screen and saves it to the ~/Screenshots folder." })
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd([[mkdir -p ~/Screenshots && wayfreeze --hide-cursor --after-freeze-cmd 'grim -g "$(slurp -d -b 000000aa -c 00000000 -s ffffff33)" ~/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; killall wayfreeze']]), { description = "Sreenshots a selected portion of the screen and saves it to the ~/Screenshots folder." })

-- Changing focused window inside a workspace --
hl.bind(mainMod .. " + W", hl.dsp.focus({ direction = "up" }), { description = "Changes focus to the window above the current focused window." })
hl.bind(mainMod .. " + A", hl.dsp.focus({ direction = "left" }), { description = "Changes focus to the window to the left of the current focused window." })
hl.bind(mainMod .. " + S", hl.dsp.focus({ direction = "down" }), { description = "Changes focus to the window below the current focused window" })
hl.bind(mainMod .. " + D", hl.dsp.focus({ direction = "right" }), { description = "Changes focus to the window to the right of the current focused window." })

-- Media/Volume --
hl.bind("CTRL + UP", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { description = "Increases volume by five percent.", locked = true, repeating = true })
hl.bind("CTRL + DOWN", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { description = "Decreases volume by five percent.", locked = true, repeating = true })
hl.bind("CTRL + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { description = "Mutes the volume.", locked = true })
hl.bind("CTRL + LEFT", hl.dsp.exec_cmd("playerctl previous"), { description = "Plays the previous media.", locked = true })
hl.bind("CTRL + RIGHT", hl.dsp.exec_cmd("playerctl next"), { description = "Plays the next media.", locked = true })
hl.bind("CTRL + space", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Plays or pauses the current media.", locked = true })

-- Keybinds :D --
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Opens the predefined terminal." })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemgr), { description = "Opens the predefined file manager." })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Opens the predefined browser." })
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(ide), { description = "Opens the predefined IDE." })
--hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(luancher), { description = "Opens the predefined luancher." })
hl.bind(mainMod .. " + C", hl.dsp.window.close(), { description = "Closes the focused window." })

-- Float controls --
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggles window float." })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { description = "Drag a window.", mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize a window.", mouse = true })

-- Hyprland shurdown --
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"), { description = "Shuts Hyprland down.", })