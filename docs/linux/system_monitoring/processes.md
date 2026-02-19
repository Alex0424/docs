# Processes - PS command

## CPU - most process usage

Fast:

```sh
ps aux --sort=+%cpu
```

Clean:

```sh
ps -eo pid,user,comm,%cpu --sort=-%cpu | head
```

## RAM

Fast:

```sh
ps aux --sort=+%mem
```

Clean:

```sh
ps -eo pid,user,comm,%mem --sort=-%mem | head
```

## Child processes

Show Process tree:

```sh
ps -ejH
```

## Kill

```sh
kill <PID_or_process_name>
kill -9 <PID_or_PNAME>      # -9 = force
```

