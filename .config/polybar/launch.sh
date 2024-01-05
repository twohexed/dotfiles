killall -q polybar
polybar 2>&1 | tee -a /var/log/polybar.log & disown
