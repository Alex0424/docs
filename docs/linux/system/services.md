# Services

## Systemctl

Subcommands of Systemctl you can run to check status of the httpd service:

```sh
systemctl status httpd
systemctl start httpd
systemctl stop httpd
systemctl restart httpd
systemctl reload httpd
systemctl enable httpd
systectl disable httpd
systemctl is-active httpd
systemctl is-enabled httpd
```

Where the config file is created for httpd when it is installed on CentOS/RHEL:

```sh
cat /etc/systemd/system/multi-user.target.wants/httpd.service
```
