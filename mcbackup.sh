#!/bin/bash
set -e

# Make sure we send a server message about backing up.
/usr/bin/screen -p 0 -S mc -X eval 'stuff "say SERVER BACKUP. Temporarily disabling autosave..."\\015'
/usr/bin/screen -p 0 -S mc -X eval 'stuff "save-off"\\015'
/usr/bin/screen -p 0 -S mc -X eval 'stuff "save-all"\\015'

# Make sure the backups directory exists.
if [ ! -d "/home/minecraft/mcbackups" ]; then
    mkdir -p /home/minecraft/mcbackups
fi

sleep 5

#Save 24 hours worth of backups. If there are already 24 hours worth of files, remove the oldest.
declare -r -i max_backups=48

if (( $(find /home/minecraft/mcbackups -type f | wc -l) >= max_backups )); then
     rm "$(find /home/minecraft/mcbackups -type f -print0 | xargs -0 ls -ltr | head -n 1 | cut -d ' ' -f 14)"
fi

# Back it on up
tar -cpvzf /home/minecraft/mcbackups/minecraft-"$(date +'%Y-%m-%d-%H-%M')".tgz /home/minecraft/server

 # Turn autosave back on.
 /usr/bin/screen -p 0 -S mc -X eval 'stuff "say Backup complete. Re-enabling autosave..."\\015'
 /usr/bin/screen -p 0 -S mc -X eval 'stuff "save-on"\\015'
