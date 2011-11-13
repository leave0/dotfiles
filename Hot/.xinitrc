# ~/.xinitrc


# Mouse Vertical/Horizontal Scroll
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

# Statusline/notifier
statnot ~/.statnot &

# Power Fixes
sudo ~/.scripts/autopower

# Super Keys
xbindkeys&

# Conky FTW
conky&
conky -c ~/.conkyrc_music&

# Background (chapod)
feh --bg-scale .chapod/chapod*.jpg&

# Start the WM
exec dwm
