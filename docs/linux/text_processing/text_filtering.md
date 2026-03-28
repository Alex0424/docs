# Filter

## Grep

```sh
grep -orIinm1 --color=always --exclude-dir=".git" "replace_me" ./ | cut -c1-1000 && tput sgr0  # Search recursively for "replace_me" and show first 1000 chars
```

```sh
less -I +5 +/replace_me file.txt     # Open file.txt in less, ignore case, jump to line 5, highlight "replace_me"
less -I +5 file.txt                  # Open file.txt in less, ignore case, start at line 5
nvim +5 file.txt                     # Open file.txt in nvim starting at line 5
```

## Pipes

```sh
ls | wc -l                                      # Count number of files in current directory
ls | grep host                                  # List files containing "host"
tail -20 /var/log/messages | grep -i vagrant    # Show last 20 log lines containing "vagrant"
free -m | grep Mem                              # Show memory info
ls -l | head                                    # Show first lines of detailed file listing
```

## File Operations

### Viewing Files

```sh
less example.txt                     # View example.txt with pagination
more example.txt                     # Alternative pager to view example.txt
head -10 example.txt                 # Show first 10 lines of example.txt
tail -10 example.txt                 # Show last 10 lines of example.txt
tail -f /var/log/messages            # Monitor system log messages in real time
```

### Compare files

```sh
diff [file1] [file2]
```

### Count (lines, words, and characters)

```sh
wc <file>      # Count lines, words, bytes
wc -l <file>   # Prints the number of lines in file
wc -w <file>   # Prints the number of words in file
wc -m <file>   # Prints the number of characters in file
```

### Find

Search files with `find`

```sh
find <path> -type <type> -name <pattern>  # Search files starting from [path] matching [pattern]
```

Example:

```sh
find . -name "*.log"  # Starting from current directory, search all subdirectories for files ending with '.log'
```

Excluding a directory:

```sh
find . -path "./.git" -prune -o -name "*.txt" -print  # Find all .txt files excluding .git directory
```

### Locate vs Find

```sh
find /etc -name 'host*'              # Find files in /etc starting with "host"
updatedb                             # Update file location database
locate host                          # Locate files named "host"
```

## Extra Commands

### Grep Filtering

```sh
grep -i firewall example.txt         # Search for "firewall" (case-insensitive) in example.txt
grep -i firewall < example.txt       # Alternative input method for the same search
grep -i firewall *                   # Search for "firewall" in all files in current directory
grep -iR firewall *                  # Search recursively for "firewall" in all files
grep -R SELINUX /etc/*               # Search recursively for "SELINUX" in /etc
grep -vi firewall example.txt        # Show lines that do NOT contain "firewall"
```

### Text Processing

```sh
cut -d: -f1 /etc/passwd              # Extract first field (username) from /etc/passwd using ':' as separator
awk -F':' '{print $1}' /etc/passwd   # Same as above using awk
sed -i 's/word/new_word/g' *.txt     # Replace 'word' with 'new_word' in all .txt files
```
