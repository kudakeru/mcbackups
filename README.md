Minecraft Backups
-----------------

This is a script that keeps a rotation of 24 hours worth of backups, assuming an interval of 30 minutes.
I reccomend running it via cron with the following:

```
0,30 * * * * /path/to/mcbackup.sh
```

You can change the frequency of backups as needed, but keep in mind that you'll also need to change max_backups
to suit how far back you want to be able to restore from.
