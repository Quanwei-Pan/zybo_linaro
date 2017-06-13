# zybo_linaro
Liunx Linaro for zybo boards.

In this project, it includes the BOOT files and linaro OS files.

Please format a sd card with 2 partions, the first with a beginning offset of 4 MiB (remain blank), and the first partition should be FAT32 and be 1 GB, the second partition should be ext4 and should have plenty space to take the linaro system (about 700MB).
Git clone the whole repo, and you should use `sudo rsync -a` to sync the files to your sd card in order to keep the permission of files.

Do like tihs,
```shell
 sudo rsync -a ~/zybo_firmware/sd_fs/ /media/user/ROOT/
 #"/media/user/ROOT/" is the mounting path of your sd card.
```

Good luck!

ss.pan

2017.06.13
