# Write an ISO image to a USB drive

## 1. Identify the USB drive

```sh
lsblk --nodeps -o NAME,SIZE,TRAN,VENDOR,MODEL
```

Example:

```text
NAME      SIZE TRAN   VENDOR   MODEL
sda      57.8G usb    Kingston DataTraveler 3.0
nvme0n1 953.9G nvme            KBG50ZNV1T02 KIOXIA
```

## 2. Unmount all mounted partitions on the USB drive

Replace `X` with the correct device letter (for example `a` for `/dev/sda`).

```sh
sudo umount /dev/sdX*
```

Example:

```sh
sudo umount /dev/sda*
```

## 3. Write the ISO image to the USB drive

> **WARNING**
> Writing to the wrong device will permanently erase that disk.

Replace `X` with the correct device letter (for example `a` for `/dev/sda`).

```sh
sudo dd if=path/to/debian.iso of=/dev/sdX bs=4M status=progress conv=fdatasync
```

Example:

```sh
sudo dd if=~/Downloads/debian-13.3.0-amd64-netinst.iso of=/dev/sda bs=4M status=progress conv=fdatasync
```

## 4. Flush pending filesystem writes

```sh
sync
```
