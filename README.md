Minecraft Backups
-----------------

This is a script that keeps a rotation of 24 hours worth of backups, assuming an interval of 30 minutes.
I reccomend running it via cron with the following:

```
0,30 * * * * /path/to/mcbackup.sh
```

You can change the frequency of backups as needed, but keep in mind that you'll also need to change max_backups
to suit how far back you want to be able to restore from.

![Creative Commons License][licimg][1]
This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike License][1].

[1]: http://creativecommons.org/licenses/by-nc-sa/4.0/

[licimg]: https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png
