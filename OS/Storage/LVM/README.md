# Create Volume group from Physical storage

For this tutorial, you will need AWS ec2 instance (t2.micro should work) and three EBS volumes (8gib) attached to ec2 instance.

##### *Note: All of the command in this tutorial must be done as "root" user - be very careful on live system, it is important that you understand what each step is doing.* 




## 1 -  Physical Volume

In this section we take RAW Linux storage devices and carve out physical volume from single or multiple RAW device(s).

First we need to verify how many storage devices are visible for ec2 instance by running command below:

```
lsbk
```

Above command will show output similar to this:

```
[ec2-user@ip-172-31-13-254 ~]$ lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvdc    202:32   0   8G  0 disk
xvda    202:0    0   8G  0 disk
└─xvda1 202:1    0   8G  0 part /
xvdd    202:48   0   8G  0 disk
xvdb    202:16   0   8G  0 disk
```

Notice - we have four devices attached, but one of the device "xvda" already have been provisioned and has filesystem on it.

Now, let's check what physical volumes currently exist by issuing command "pvs"

```
pvs
```

if there is physical volume - you will see output of it.

### 1.1 Create physical group

Create physical volume using non-partitioned disk:

```
sudo pvcreate /dev/xvdc /dev/xvdd /dev/xvdb

```

Verify pv creation was sucessful:

```
pvs
```

Command above will show output of devices attached and size.

```
pvdisplay
```

Command above displays similar output to pvs, but bit with more details.

## 2 -  Create Logical Volume 

### 2.1  Create Volume Group

Before we create new logical volume - let's verify if there is a existing logical volume group. 

```
lvdisplay
```

In some cases, you will have to alter existing logical volume group and extend the size for consistent growth. For Part 1 of this tutorial we will just create new LVM and add disks from physical volume we created in step 1.1.


Create new logical volume for disk /dev/sdb /dev/sdc - Notice, we are using the devices that were created when "pvcreate" generated.  If you don't know your pv disk information, use "pvs" or "pvdisplay" to find correct name.

```
Volume Group Name = VolGroup00 ---> Name can be per your liking 
Disk Devices = /dev/sdb,/dev/sdc
```

Create logical volume using command below:

```
vgcreate VolGroup00 /dev/sdc /dev/sdb 
```


Execute command "vgdisplay" - output will show all of the logical volume group created:

```
vgdisplay
```

Key things to note here:

```
* Format
* VG Access
* VG Status
* VG Size
* VG UUID 
```

now execute "pvscan" and notice that pvscan show LVM name, if you try to drop disk from physical volume, system will not let you do that unless you remove the disk from LVM.

```
[root@ip-172-31-13-254 ~]# pvscan
  PV /dev/sdc   VG VolGroup00      lvm2 [8.00 GiB / 8.00 GiB free]
  PV /dev/sdb   VG VolGroup00      lvm2 [8.00 GiB / 8.00 GiB free]
  PV /dev/sdd   VG VolGroup00      lvm2 [8.00 GiB / 8.00 GiB free]
```

### 2.2  Create & provision LVM

In section 2.1 we created VolumeGroup, now let's make VG usable so we can create filesystem on top of VG - Volume Group can be slice and dice i.e. you can only use portion of it and reserve remaining for future use.

Use command below to create LVM and use only 5GB out of total storage from VG:

```
lvcreate -L 5G -n myfirst_volume VolGroup00
```

After succesfully creating LVM, verify the size of LVM and get LV Path - you will need this info to create filesystem on-top of it and mount it location.

```
lvdisplay -m
```

With option "-m" will display what devices headers are witten with blocks.

## 3 -  Create File system

After you have created Physical Volume, Volume Group and LVM - we can format the logical volume and create filesystem.

Execute command below to format LVM with ext4 filesystem and use the LVM "location PV" path  from lvdisplay command

```
mkfs.ext4 /dev/VolGroup00/myfirst_volume
```

## 4 -  Mount the LVM to system

First create directory where you want to mount the filesystem:

```
mkdir /myFirstVG
```

Mount LVM:

```
mount /dev/VolGroup00/myfirst_volume /myFirstVG
```

In order to auto mount the filesystem on instance boot, add following to "/etc/fstab" by running command below:

```
echo "/dev/VolGroup00/myfirst_volume /myFirstVG ext4 defaults 1 2" >> /etc/fstab
```

## 5 - Extend existing LV and FS

First extend LV. Add 1 G


```
lvextend -L +1G /dev/VolGroup00/myfirst_volume
```

lvdisplay will show LV is now 1G bigger but df -h will show FS is still the same size. Now resize FS

Now, let's resize the filesystem by running command below:

```
resize2fs /dev/mapper/myfirst_volume
```

Check FS size using df -h

Now add third disk to Volume group and increase size of LV and FS - by running commands below:

```
pvcreate /dev/xvdh 
vgextend myTestVg /dev/xvdh 
lvextend -L +10G /dev/myTestVg/myLv
resize2fs /dev/myTestVg/myLv
```





## Conclusion

In this tutorial, you learn how to create Physical Volumes, Volume Group and Logical Volume. This tutorial focused on hands-on, hence practicing will make you comfortable with storage management within Linux.  

In next topic we will discuss extending LMV, Disk management with RAID. 







