# Permission

## File Permission Bits

### Bit list

### Bit and Type Reference Table

### Bit and Type Reference Table

| Symbol | Meaning                                            | Applies To          | Numeric (Octal)             | Structure Example | Notes                                                                                                                                                                                                                              |
| ------ | -------------------------------------------------- | ------------------- | --------------------------- | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-`    | **Regular file**                                   | Files               | *(n/a)*                     | `-rw-r--r--`      | Standard file (text, binary, script, etc.)                                                                                                                                                                                         |
| `d`    | **Directory**                                      | Directories         | *(n/a)*                     | `drwxr-xr-x`      | Contains files/subdirectories                                                                                                                                                                                                      |
| `l`    | **Symbolic link**                                  | Files               | *(n/a)*                     | `lrwxrwxrwx`      | Points to another file or directory                                                                                                                                                                                                |
| `b`    | **Block device**                                   | Devices             | *(n/a)*                     | `brw-rw----`      | Device file providing buffered I/O (e.g. disks)                                                                                                                                                                                    |
| `c`    | **Character device**                               | Devices             | *(n/a)*                     | `crw-rw----`      | Device file providing unbuffered I/O (e.g. serial ports)                                                                                                                                                                           |
| `p`    | **Named pipe (FIFO)**                              | Special files       | *(n/a)*                     | `prw-r--r--`      | Enables interprocess communication through a pipe                                                                                                                                                                                  |
| `s`    | **Socket**                                         | Special files       | *(n/a)*                     | `srwxr-xr-x`      | Used for network or interprocess communication                                                                                                                                                                                     |
| `r`    | **Read**                                           | Files & Directories | `4`                         | `-r--r--r--`      | Read file contents / list directory                                                                                                                                                                                                |
| `w`    | **Write**                                          | Files & Directories | `2`                         | `--w--w--w-`      | Modify file / create or delete files in directory                                                                                                                                                                                  |
| `x`    | **Execute**                                        | Files & Directories | `1`                         | `---x--x--x`      | Run file / enter directory (`cd`)                                                                                                                                                                                                  |
| `T`    | **Sticky bit set, but execute bit missing**        | Directories only    | `1` (special bit)           | `drwxrwxrwT`      | Files inside can only be deleted or renamed by their **owner**, the **directory’s owner**, or **root**                                                                                                                             |
| `t`    | **Sticky bit + execute bit set**                   | Directories only    | `1` (special bit)           | `drwxrwxrwt`      | Files inside can only be deleted or renamed by their **owner**, the **directory’s owner**, or **root**                                                                                                                             |
| `S`    | **Setuid/Setgid bit set, but execute bit missing** | Files & Directories | `4` (setuid) / `2` (setgid) | `-rwSr--r--`      | Means `s` bit is active but no execute (`x`) permission                                                                                                                                                                            |
| `s`    | **Setuid/Setgid + execute bit set**                | Files & Directories | `4` (setuid) / `2` (setgid) | `-rwsr-sr-x`      | <ul><li>File (user): run as file owner (**setuid**)</li><li>File (group): run as file group (**setgid**)</li><li>File (others): no effect (acts like `x`)</li><li>Directory (group): new files inherit directory’s group</li></ul> |
| `.`    | **SELinux context or extended attributes**         | Files & Directories | *(n/a)*                     | `drwxr-xr-x.`     | Indicates extra metadata; check with `ls -Z`                                                                                                                                                                                       |
| `+`    | **Access Control List (ACL)**                      | Files & Directories | *(n/a)*                     | `drwxr-xr-x+`     | Shows extra ACL entries; check with `getfacl`                                                                                                                                                                                      |

### File Structure
 
Structure of `ls -l` Output:
```
drwxrwsrwt.  2 <owner> <group>  40  Jul  5 14:09  <name>
^            ^    ^       ^      ^  ^^^^^^^^^^^^^   ^
|            |    |       |      |        |         └───── filename
|            |    |       |      |        └──────────────── modification time
|            |    |       |      └────────────────────────── size (bytes; for dirs: entry size)
|            |    |       └────────────────────────────────── group owner
|            |    └─────────────────────────────────────────── user owner
|            └───────────────────────────────────────────────── link count (dirs: 2 + #subdirs)
└─────────────────────────────────────────────────────────────── type+perms (d/-, r/w/x, s, t)
```

Example:
```
drwxrwsrwt.  2 alex devteam  40 Jul  5 14:09 shared_dir
```

Breakdown:

| Section           | Example       | Meaning                                                      |
| ----------------- | ------------- | ------------------------------------------------------------ |
| **1st character** | `d`           | File type → `-` = file, `d` = directory, `l` = symlink, etc. |
| **2nd–4th**       | `rwx`         | Owner (user) permissions: read, write, execute               |
| **5th–7th**       | `rws`         | Group permissions: read, write, execute/setgid               |
| **8th–10th**      | `rwt`         | Others permissions: read, write, execute/sticky              |
| **`.` or `+`**    | `.`           | SELinux (`.`) or ACL (`+`) indicator                         |
| **Link count**    | `2`           | Number of hard links (for dirs: itself + subdirs)            |
| **Owner**         | `alex`        | User who owns the file                                       |
| **Group**         | `devteam`     | Group owner                                                  |
| **File size**     | `40`          | Size in bytes (for directories: metadata size)               |
| **Date**          | `Jul 5 14:09` | Last modification date/time                                  |
| **Filename**      | `shared_dir`  | The name of the file or directory                            |


### Change Permission

#### Octal (numeric) mode

**Pattern**

```bash
chmod [SPECIAL][OWNER][GROUP][OTHERS] TARGET
```

- OWNER/GROUP/OTHERS are each a **digit** 0–7 combining `r=4`, `w=2`, `x=1`.
- SPECIAL (optional, leading digit) combines: setuid=4, setgid=2, sticky=1.

**Examples**

```bash
chmod 700  file     # rwx------            (owner only)
chmod 644  file     # rw-r--r--            (common for text files)
chmod 755  file     # rwxr-xr-x            (common for executables)
chmod 775  dir      # rwxrwxr-x            (team directories)
chmod 770  devopsdir/  # rwxrwx---         (owner+group full, others none)

# Special bits
chmod 4755 file     # setuid + 755  → -rwsr-xr-x
chmod 2755 file     # setgid + 755  → -rwxr-sr-x
chmod 6755 file     # suid+sgid+755 → -rwsr-sr-x
chmod 1777 dir      # sticky + 777  → drwxrwxrwt (like /tmp)
```

#### Symbolic mode

**Syntax**

```bash
chmod [ugoa][+-=][rwxXst] TARGET...
```

- Who: `u` (owner), `g` (group), `o` (others), `a` (all)
- Operation: `+` add, `-` remove, `=` set exactly
- Bits: `r` read, `w` write, `x` execute, `X` conditional execute (dirs or if any execute bit already set), `s` setuid/setgid, `t` sticky

**Examples**

```bash
# Remove read for others
chmod o-r /opt/devopsdir

# Add write for group
chmod g+w /opt/devopsdir

# Remove execute for owner (on a directory this prevents cd for owner)
chmod u-x /opt/devopsdir

# Add setgid on a directory so new files inherit the directory's group
chmod g+s /opt/devopsdir

# Add sticky bit so only owners can delete their own files in a shared dir
chmod +t /opt/share

# For the group, set only read (r) and execute (x) permissions — and remove everything else, including write (w).
chmod g=rx
```

## Ownership: chown

Syntax:
```
chown
```
chown [FLAGS] USER[:GROUP] TARGET
```

Common flags
- `-R` - recursive (apply to all files and subdirectories)

Examples
```
# Set both user and group recursively
chown -R ansible:devops /opt/devopsdir

# Set only user
chown ansible /opt/devopsdir

# Set only group
chown :devops /opt/devopsdir
```

```
chown -R ansible:devops directory
chmod o-r /opt/devopsdir
chmod g+w /opt/devopsdir
chmod u-x /opt/devopsdir
chmod 770 devopsdir/
```

```shell
sudo usermod -a -G mygroup jenkins
sudo groupadd mygroup
sudo chown -R alex:mygroup /home/alex/test
```

```
sudo chown jenkins:jenkins /home/alex/test
sudo chown -R jenkins:jenkins /home/alex # add group to all
```

Users

```shell
sudo useradd alex2
sudo passwd alex2
su alex2
```

## Groups

```
cat /etc/passwd
cat /etc/groups
id vagrant
useradd dev
passwd dev
usrdel dev
usrdel -r dev                   #delete user along with his home directory
su - dev                        #login
groupadd devops
groupdel devops
usermod -aG devops dev
id ansible
vim /etc/group

last
who
lsof -u vagrant                 #will list files opened by user 
```

## Add Sudo User/Group

### Option A (not safe):
```
visudo     #edit /etc/sudoers file
```
`add user:`
```
100    root    ALL=(ALL)       ALL
101    ansible ALL=(ALL)       NOPASSWD: ALL
```
`add group:`
```
100    root     ALL=(ALL)       ALL
101    %ansible ALL=(ALL)       NOPASSWD: ALL
```
### Option B (safe):
```
cd /etc/sudoers.d
cp vagrant devops
vim devops
```
`add user:`
```
devops ALL=(ALL) NOPASSWD: ALL
```
`add group:`
```
%devops ALL=(ALL) NOPASSWD: ALL
```

## Verification commands
```
# Show long listing of a directory itself (not its contents)
ls -ld /opt/devopsdir


# Confirm inheritance behavior
touch /opt/devopsdir/test
ls -l /opt/devopsdir/test


# Show ACLs / SELinux
getfacl /opt/devopsdir
ls -Z /opt/devopsdir
```