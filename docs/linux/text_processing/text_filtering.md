# Filter

## Grep

```
grep -orIinm1 --color=always --exclude-dir=".git" "replace_me" ./ | cut -c1-1000 && tput sgr0
```
```
less -I +5 +/replace_me file.txt
less -I +5 file.txt
nvim +5 file.txt
```

## Find

```
find . -path "./.git" -prune -o -name "*.txt" -print
```

## Extra Commands

### Filter

```
grep -i firewall example.txt         #looking for "firewall" pattern in example.txt wheter the letters are capital or not.
grep -i firewall < example.txt       #
grep -i firewall *                   #lookin for firewall word in all files.
grep -iR firewall *                  #
grep -R SELINUX /etc/*               #search for "SELINUX" in all file and directories in etc
grep -vi firewall example.txt        #everything that do not contain firewall pattern
less example.txt                     #
more example.txt                     #
head -10 example.txt                 #first 10 lines
tail -10 example.txt                 #last 10 lines
tail -f var/log/messages             #monitor system log messages in real time
cut -d: -f1 /etc/passwd              #cut separator
awk -F':' '{print $1}' /etc/passwd   #awk separator
sed -i 's/word/new_word/g' *.txt     #replace all words containing coronavirus to covid19 to all txt files             #
find /etc -name 'host*'              #

FIRST-COMMAND$ updatedb              #updates path
SECOND-COMMAND$ locate host          #search for files that are named "host" 
```

### PIPES

```
ls | wc -l                                         #count number of files
ls | grep host                                     #lists all that starts with host
tail -20 /var/log/messages | grep -i vagrant       #
free -m | grep Mem                                 #
ls -l | head                                       #
```
