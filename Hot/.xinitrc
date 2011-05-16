# ~/.xinitrc

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 8 200
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

sudo ~/.scripts/bluetooth
xbindkeys&
conky&
conky -c ~/.conkyrc_music&
feh --bg-scale .chapod/chapod*.jpg&

while true
do
	if acpi -a | grep off-line > /dev/null; then
		if [ [$(mpc | grep playing | awk ' {print $1} ' | tr -d '[]')] == [playing] ]; then
			xsetroot -name "S: $(mpc current) | B: `acpi -b | awk '{print $4}' | tr -d ','` | V: $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | `date '+%A, %B %d | %R'`"
		else
			xsetroot -name "B: `acpi -b | awk '{print $4}' | tr -d ','` | V: $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[    ]') | `date '+%A, %B %d | %R'`"
		fi
	else
		if [ [$(mpc | grep playing | awk ' {print $1} ' | tr -d '[]')] == [playing] ]; then
			xsetroot -name "S: $(mpc current) | B: [`acpi -b | awk '{print $4}' | tr -d ','`] | V: $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | `date '+%A, %B %d | %R'`"
		else
			xsetroot -name "B: [`acpi -b | awk '{print $4}' | tr -d ','`] | V: $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d     '[]') | `date '+%A, %B %d | %R'`"
		fi
	fi
sleep 10
done &

exec dwm
