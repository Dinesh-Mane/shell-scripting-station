#  1. `whoami`
**it means:** "Who am I right now?" – It shows the current effective user who is executing the command.  
**Use case:** Very useful when you switch users using `sudo` or `su`.  
**Example:**  
```bash
$ whoami
tcsuser
```
If you run:
```bash
$ sudo whoami
root
```
> That means you are temporarily acting as root.

# 2. `who am i`
**it means:** Show user ID (UID), group ID (GID), and all groups the user belongs to.   
**Use case:** Check permissions and group memberships.  
**Example:**  
```bash
$ id
uid=1000(tcsuser) gid=1000(tcsuser) groups=1000(tcsuser),27(sudo)
```
Even if you run:
```bash
$ sudo su
# whoami
root
# who am i
tcsuser  pts/0 ...
```
- `whoami` = root (current active user)
- `who am i` = tcsuser (original login user)

# 3. `id`
**it means:** "Who originally logged into this terminal?" – It shows the real login user, even if you've switched user with `sudo` or `su`.  
**Use case:** Useful to know who started the terminal session, especially in remote logins or after switching users.  
**Example:**  
```bash
$ who am i
tcsuser  pts/0  2025-05-12 10:12 (192.168.1.5)
```
This says:
- You are `tcsuser`
- Your UID is 1000
- You are in group `tcsuser` and `sudo`

# 4. `echo $USER`
**it means:** Shows the value stored in the `USER` environment variable.  
**Use case:** Quick way to know your username, but not reliable after `sudo`.  
**Example:**  
```bash
$ echo $USER
tcsuser

$ sudo echo $USER
tcsuser  ←  Still shows original user, not root!
```
> Why not reliable?  
> Because $USER is not updated when you switch users with sudo or su. It just prints whatever was set at login.

## Summary: 

| Command      | What it Tells You                       | Reliable After `sudo`? | Real Use Case                       |
| ------------ | --------------------------------------- | ---------------------- | ----------------------------------- |
| `whoami`     | Who you are **right now** (active user) | ✅ Yes                  | Check if you are root or not        |
| `who am i`   | Who **originally logged in**            | ✅ Yes                  | Track original user session         |
| `id`         | User ID + Group info                    | ✅ Yes                  | See if user belongs to `sudo` group |
| `echo $USER` | Username from environment variable      | ❌ No                   | Only works if user hasn’t changed   |



