# Firewall

Is a system that filters incoming and outgoing network trafic based on rules

## Ports

### Scan with SS (Inspection Tool)

input:

```sh
ss <flags>
```

output:

```sh
Netid State   Recv-Q  Send-Q  Local Address:Port    Peer Address:Port
...
```

Netid:
  - shows network protocol type
  - Example:
    - tcp
    - tcp6

State:
  - socket state
  - Example:
    - LISTEN
    - CLOSED
    - ESTAB
      - established connection

Recv-Q
  - amount of revieved bytes in queue

Send-Q
  - amount of bytes sent but not but acknowledgment (ACK) not recieved from remote peer (ps output: Peer Address:Port).

Local Address:Port
  - Local endpoint / IP on host machine

Peer Address:Port
  - Remote endpoint / IP on client machine

#### Example

Scan for port 22 (SSH):

```sh
ss -tuln | grep ':22'
```

```sh
Netid State   Recv-Q  Send-Q  Local Address:Port    Peer Address:Port
tcp   LISTEN  0       128     0.0.0.0:22            0.0.0.0:*
tcp   LISTEN  0       128     [::]:22               [::]:*
```

#### TCP (`-t` = TCP)

```sh
ss -t
```

### Scan with nmap

```sh
nmap localhost
```

### Add/Remove with `ufw` (Uncomplicated Firewall)

#### Add port

```sh
ufw allow 22
```

#### Remove port

```sh
ufw deny 22
```

#### Enable & Check Status

```sh
ufw enable
ufw status
```

### Enable/Disable with Firewall-cmd (BETA)

Work in progress here. More coming soon...

#### Remove port
#
#```sh
#sudo firewall-cmd --remove-service=ssh
#```
#
#### Add port
#
#```sh
#sudo firewall-cmd --add-service=ssh
#```
