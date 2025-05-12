# All ways to check Linux distro & version
There are multiple ways to check which Linux distribution you're using. Some are universal, while others depend on specific Linux flavors.

## 1. Use `cat /etc/os-release` (Most common & standard way)
```bash
cat /etc/os-release
```
Output:
```bash
NAME="Ubuntu"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
ID=ubuntu
PRETTY_NAME="Ubuntu 22.04.3 LTS"
```
> This file is present on almost all modern Linux distros and follows a standard format.

## 2. Use the `hostnamectl` command (Modern systems only)
```bash
hostnamectl
```
Output:
```bash
   Static hostname: dev-machine
         Icon name: computer-laptop
           Chassis: laptop
  Operating System: Ubuntu 22.04.3 LTS
            Kernel: Linux 5.15.0-92-generic
```
> Good for systemd-based distros like Ubuntu, Fedora, RHEL, etc.

## 3. Use `lsb_release -a` (Available if LSB is installed)
```bash
lsb_release -a
```
Output:
```bash
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.3 LTS
Release:        22.04
Codename:       jammy
```
 If `lsb_release` is not found, install it:
```bash
sudo apt install lsb-release    # Debian/Ubuntu
sudo yum install redhat-lsb     # RHEL/CentOS
```

## 4. Check `/etc/issue` (Login banner info)
```bash
cat /etc/issue
```
Output:
```bash
Ubuntu 22.04.3 LTS \n \l
```
> It's a simple text file used for login messages, but gives you a quick distro name.

## 5. Check `/proc/version` (Kernel & distro info)
```bash
cat /proc/version
```
Output:
```bash
Linux version 5.15.0-92-generic (buildd@lcy02-amd64) ... Ubuntu SMP ...
```
> Not always reliable for distro name, but good for kernel version.

## 6. Use `uname` command (Kernel only, not distro)
```bash
uname -a
```
Output:
```bash
Linux dev-machine 5.15.0-92-generic #102-Ubuntu SMP ... x86_64 GNU/Linux
```
> `uname` tells you kernel info, not distro directly — but can be combined with others.
