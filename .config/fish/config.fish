if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -U fish_greeting "><'>"
set -U fish_greeting ""
set --global fish_handle_reflow 1

if test -f ~/.cache/wal/sequences
	cat ~/.cache/wal/sequences
end

cat /etc/motd
