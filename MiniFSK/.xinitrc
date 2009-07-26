#xbindkeys &
conky &
feh --bg-scale ~/.dwm/029.jpg &

while true
do
xsetroot -name "`acpi -b | awk '{print $4}'` `date '+%A, %B %d |%l:%M %p'`"
sleep 10
done &
exec dwm
