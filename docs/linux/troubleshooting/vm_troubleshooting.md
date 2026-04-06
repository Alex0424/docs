# How to troubleshoot a VM

## Scenario

- VM is crashing multiple times per day
- APP not functioning

## Troubleshooting steps

### Logs

#### JournalCTL

##### Flags/Options

- `-p`: priority filtering, example: `"emerg" (0)`, `"alert" (1)`, `"crit" (2)`, `"err" (3)`, `"warning" (4)`...
- `-n`: show recent lines
- `-no-pager`: disable interactive editor
- `-k`: only kernel messages
- `-b`: Time machine `-b -1`: previous session, `-b -2`: two reboots ago

##### Commands

Get the latest and important logs:

```sh
journalctl -p 0..3 -n 30 --no-pager
```

See the log from previous boot:

```sh
journalctl -kb -1
```

Look for `Out of Memory (OOM) killer` events or `Kernel Panic`

#### Main System File Logs - /var/log/

| Log/File | Purpose | Typical Distribution / Notes |
| -------- | ------- | -----------------------------|
| `journal/` | Systemd journal (binary logs, best for `journalctl`) | All modern distros (RHEL, Fedora, Ubuntu 16.04+), use `journalctl` |
| `boot.log` / `boot.log-YYYYMMDD` | Boot messages | RHEL/Fedora: `/var/log/boot.log*` <br> Ubuntu: `/var/log/boot.log` |
|`dnf.log` / `dnf5.log*`| Package manager activity (install/update) | RHEL/Fedora only (DNF/YUM) |
|`apt/history.log` / `apt/term.log` | Package manager activity (install/update) | Ubuntu/Debian only (APT)|
| `firewalld` / `firewalld-*` | Firewall logs | RHEL/Fedora (firewalld) <br> Ubuntu: typically `ufw.log` in `/var/log/` |
| `lastlog` | Last login info | All distros, `/var/log/lastlog` |
| `btmp` | Failed login attempts | All distros, `/var/log/btmp` |
| `wtmp` | Successful login records | All distros, `/var/log/wtmp` |
| `audit/` | Security auditing | All distros with `auditd` enabled, `/var/log/audit/` |
| `httpd/` / `apache2/` | Web server logs | RHEL/Fedora: `httpd/` <br> Ubuntu/Debian: `apache2/` |
| `cups/` | Printing logs | All distros, `/var/log/cups/` |
| `libvirt/` | VM/libvirt logs | All distros with libvirt installed |
| `vbox-setup.log*` | VirtualBox setup/install logs | All distros with VirtualBox installed |
| `syslog` | Generic system messages | Ubuntu/Debian only, `/var/log/syslog` <br> RHEL/Fedora: usually empty or not present |

### Monitor Resource Exhaustion

#### Memory

##### Memory Hardware Stats

```sh
free -h
```

- `total`: Max memory capacity
- `used`: Memory in use by apps and/or users
- `free`: If an application requests memory, it will first use free memory
- `buff/cache`: If free memory runs out, Linux reclaims memory from the cache and gives it to applications
- `Swap`: Third line of memory. Only used when RAM is fully consumed (`free`+`buff/cache`) but it is very slow.

Check so there is enough `free` memory

##### Swap Details

```sh
swapon -s
```

##### Memory Logs

```sh
dmesg | grep -i memory
```

##### Check for Defective Stick of RAM

If you see kernel panic, unexpected reboots, or data corruption then it might be a good idea to run memtest86.

1. Download memtest86: https://memtest86.net/
2. Create a bootable USB
3. Boot from USB
4. Run the memory test

#### Processes - ps

```sh
ps aux
```

##### Output Columns

| Column  | Meaning                                               |
| ------- | ----------------------------------------------------- |
| USER    | Process owner                                         |
| PID     | Process ID                                            |
| %CPU    | CPU usage percentage                                  |
| %MEM    | Memory usage percentage                               |
| VSZ     | Virtual memory size                                   |
| RSS     | Resident memory size (actual RAM used)                |
| STAT    | Process state (R=running, S=sleeping, Z=zombie, etc.) |
| COMMAND | Command used to start the process                     |

##### Flags/Options

- `aux`: every running process
- `--sort`: specify a sorting order like `%mem`, `%cpu`...
- `-e`: select all processes
- `-o`: specify individual output columns

##### Commands

###### Issue 1: High CPU Usage

```sh
ps -eo user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm --sort=-%cpu | head -n 10
```

###### Issue 2: High Memory Usage

```sh
ps -eo user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm --sort=-%mem | head -n 10
```

###### Issue 3: Zombie Processes

```sh
ps aux | grep 'Z'
```

###### Issue 4: Orphaned or Runaway Processes (process that enters an infinite loop and spawns new processes)

```sh
ps -ef --forest
```

- Shows process hierarchy
- Useful to identify which process spawned a runaway process

###### Issue 5: Missing or Unresponsive Process

Check whether the process exists:

```sh
ps aux | grep <service-name>
```

###### Kill and Start Process if Needed

Kill by PID:

```sh
sudo kill -9 <PID> # SIGKILL (9) = force terminate
```

Kill all processes matched by name:

```sh
sudo pkill -f <process_name> # SIGTERM (15) = lets the process clean up
```

Kill all processes by username:

```sh
sudo pkill -u <user>
```

Start:

```sh
sudo systemctl start <service_name>
```

Restart:

```sh
sudo systemctl restart <service_name>
```

Finally check status:

```sh
sudo systemctls status <service_name>
```

##### Realtime Monitoring Tools

```sh
top
```

```sh
htop
```

```sh
btop
```

#### Environment Vars

- Some app require env vars to work

Check if env vars are set:

```sh
echo $<env_var>
```

#### Check if app was started with args

Syntax:

```sh
ps aux | grep <app_name>
```

Example:

```sh
ps aux | grep nginx
```

Output:

```sh
root  1042  0.0  0.1  nginx: master process /usr/sbin/nginx -g daemon off;
```
