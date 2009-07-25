#xbindkeys &
conky &
feh --bg-scale ~/.dwm/220.jpg &

while true
do
xsetroot -name "`acpi -b | awk '{print $4}'` `date '+%A, %B %d |%l:%M %p'`"
sleep 10
done &
exec dwm
