# Create RAID Group with RAID 0 Level

##### *Note: All of the command in this tutorial must be done as "root" user - be very careful on live system, it is important that you understand what each step is doing.*

## 1 - Create RAID level 0

Use command below to create RAID 0 - RAID 0 is used for best performance

```
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sdb /dev/sdc
```


## 2 - Check RAID group

Verify RAID group and scan for changes

```
mdadm --verbose --detail -scan
```


## 3 - Update RAID config file

Write RAID detail to config file

```
mdadm --verbose --detail -scan >> /etc/mdadm.conf
```


## 4 - Now create EXT 4 FS on this RAID Volume

```
mkfs.ext4 /dev/md0
```

## 5 - Mount This FS on a dir

```
mkdir /data01

mount /dev/md0 /data01
```

Update fstab file so this FS will mount automatically during server startup

```
echo "/dev/md0 /data01 ext4 defaults 0 0" >> /etc/fstab
```
