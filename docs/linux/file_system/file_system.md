# File System

## Root Tree

```
/
├── bin
├── boot
│   ├── vmlinuz-<version>
│   └── grub/
├── dev
├── etc
│   ├── passwd
│   ├── group
│   ├── hosts
│   ├── resolv.conf
│   ├── ssh/
│   │   └── sshd_config
│   └── systemd/
│       └── system/
├── home
│   └── user/
│       ├── .bashrc
│       ├── .profile
│       └── projects/
├── lib
├── lib64
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
│   ├── bin
│   ├── lib
│   ├── libexec
│   ├── sbin
│   ├── share
│   └── local/
│       ├── bin
│       └── lib
└── var
    ├── cache
    ├── lib
    ├── log/
    │   └── syslog
    ├── mail
    ├── run
    └── www
```

## Explanation

Binaries: `/bin` `/usr/bin` `/usr/local/bin`

- executable examples: `ls` `mkdir` `rm` `cd`.

System/SuperUser Binaries: `/sbin` `/usr/sbin` `/usr/local/sbin`

- executable example: `deluser`.

User: `/usr`

- INFO: long list of things that needs to be shared between apps and services.
- many binaries files lives here.

Optional: `/opt`

- additional software & add-on packages (not part of default installation).
- software that you build and compile sometimes land.
- applications -> `/opt/bin`.
- libraries -> `/opt/lib`.

Configuration: `/etc`

- `*.conf`

Boot: `/boot`

- files to boot a linux combuter e.g.: kernel & bootloader.

Shared Libraries: `/lib` `/usr/lib` `usr/local/lib`

- libraries for system programs.
- binaries required to boot the system.

Temporary Files: `/tmp`

- temporary files placed there by apps that are running.

Var: `/var`

- logs: `var/logs`
- tasks: 
- temp files between reboots: 
- snap dir on ubuntu: 

Server Data: `/srv`

Device: `/dev`

- USB devices

Mount: `/mnt`

- mount other file systems or storage devices for short period of time.
- not used very often nowadays.

Media: `/media`

- external storage devices will be automatically mounted here.

System Information: `/proc` `/sys`

Home Directory: `/home/user`

Superuser Home Directory: `/root`