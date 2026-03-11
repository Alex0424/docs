# Linux default "command-line shell" commands

```
command list:
$ whoami                       #display your username
$ pwd                          #print working directory
$ ls                           #list files
$ cd /example/dir              #change to /example/dir directory
$ cd ..                        #change to one step back directory
$ cd                           #change to home directory
$ mkdir ./dir                  #create directory
$ mkdir -p /home/$USER/{a,b}/{x,y,z}     #create multiple directories
$ ln -s /dir/fileA.txt fileB   #create a link
$ unlink fileC                 #remove a link
$ cat                          #displaying file conten & concatenation
$ sudo -i                      #switch to root user
$ touch file{1..10}.txt        #create 10 files
$ cp file.txt dir/             #move txt file to another directory
$ cp /dir1/file.txt /dir1/dir2 # cp txt file to another directory using absolute path
$ cp -r dirX dirY/             # copy a directory to another directory
$ mv file.txt dir/             #move file to directory
$ mv dir1 dir2/                #move directory to another directory
$ mv fileA.txt fileB.txt       #rename file
$ mv *.txt dir/                #move all txt files to a directory
$ rm file.txt                  #remove a file
$ rm -r dir                    #remove a directory
$ rm -rf dir                   #remove a directory with force
$ rm -rf *                     #remove everything with force
$ file file_example            #check file info bin or txt...
$ vim /etc/host                #idk
$ vim /etc/hostname            #change host name in vim
$ hostname name_example        #change hostname in command
$ free -m                      #memmory utilization
$ df -h                        #disk partition
$ uptime                       #
$ date                         #
$ wc -l /etc/passwd            #count number of lines in file
$ cat /proc/cpuinfo            #cpuinfo
$ tail -f err.log              #follow log file



FILE:
uptime > /tmp/sysinfo.txt            #write command to file
uptime >> /tmp/sysinfo.txt           #append command to file
echo "your_text" > tmp/sysinfo.txt   #write text to file
echo "your_text" >> tmp/sysinfo.txt  #append text to file
cat /dev/null > /tmp/sysinfo.txt     #clear file
freeee -m 1>> /tmp/error.log         #will not do error to file
freeee -m 2>> /tmp/error.log         #get error text to file
freeee -m &>> /tmp/error.log         #get error text or command if works to file
```

# Get help with any command:

`command --help` e.g. `ls --help`

# Advanced commands:
```
$ ls -lhatr                   # -l (long format), -h (human-readable sizes), -a (all files include hidden files), -t (sort by modification time, recently modified files first), -r (reverse)
$ cat /etc/os-release         #OS name & Version from CLI
$ touch testfile{1..10}.txt   #create 10 files
```
