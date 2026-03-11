# Path

## What is PATH in Linux?
The PATH is an environment variable that tells Linux where to look for executable programs. When you type a command, Linux searches through the directories listed in PATH to find the program to execute.

## Check PATH
```bash
echo $PATH
```
or
```bash
printenv PATH
```

output example:
```shell
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

## Adding a new PATH temporarily
To add a new directory to PATH for your current terminal session:
```bash
export PATH=$PATH:/your/new/path
```

## Adding a PATH permanently
1. Edit your shell's configuration file:
   - For Bash:
   ```bash
   nano ~/.bashrc
   ```

2. Add this line at the end of the file:
```bash
export PATH=$PATH:/your/new/path
```

3. Save and apply changes:
```bash
source ~/.bashrc
```

4. Validate newly appended PATH:
```bash
which program_name
```

## Common PATH locations
- `/bin`: Essential user commands
- `/usr/bin`: Most user commands
- `/usr/local/bin`: User-installed programs
- `/sbin`: System administration commands
- `/usr/sbin`: Additional system admin commands

## Tips for Beginners
1. Never remove default PATH directories
2. Keep custom scripts in `~/bin` or `/usr/local/bin`
3. Use absolute paths when adding new directories
4. Separate multiple paths with colons (:)