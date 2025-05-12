# How to check file permissions
## 1. `ls -l` Command
The most common way:
```bash
ls -l script.sh
```
Example Output:
```bash
-rwxr-xr-- 1 user user 123 May 12 13:30 script.sh
```
Let’s break it down:
| Section        | Meaning                           |
| -------------- | --------------------------------- |
| `-`            | Type: `-` = file, `d` = directory |
| `rwx`          | Owner has read, write, execute    |
| `r-x`          | Group has read, execute           |
| `r--`          | Others have read only             |
| `1`            | Number of hard links              |
| `user user`    | Owner and group name              |
| `123`          | File size in bytes                |
| `May 12 13:30` | Last modified date                |
| `script.sh`    | File name                         |

## OR simply use `ls -ltr` command
This is a combination of three flags for the ls (list) command:

| Flag | Meaning                                                                |
| ---- | ---------------------------------------------------------------------- |
| `-l` | **Long listing format** – shows permissions, owner, size, date, etc.   |
| `-t` | **Sort by modification time** – latest modified files shown first      |
| `-r` | **Reverse the order** – makes the latest file appear **at the bottom** |

It lists all files and directories in the current location with full details, and shows the oldest files first, latest modified last.
```bash
ls -ltr
```
Example Output:
```bash
-rw-r--r-- 1 user user  456 May 10 11:00 notes.txt
-rwxr-xr-- 1 user user  300 May 11 09:00 backup.sh
-rwxr-xr-x 1 user user 1024 May 12 14:32 deploy.sh
```
> Here, deploy.sh was modified most recently — so it appears last.


## 2. `stat` Command (more detailed)
```bash
stat script.sh
```
Sample Output:
```bash
  File: script.sh
  Size: 123             Blocks: 8          IO Block: 4096   regular file
Device: 802h/2050d      Inode: 281221      Links: 1
Access: 2025-05-12 13:30:00.000000000 +0530
Modify: 2025-05-12 13:29:00.000000000 +0530
Change: 2025-05-12 13:30:00.000000000 +0530
 Birth: -
Permissions: -rwxr-xr-- (0754/-rwxr-xr--)  Uid: ( 1000/   user)   Gid: ( 1000/   user)
```


## 3. `namei -l` (shows each level of path permissions)
```bash
namei -l ./script.sh
```
Good for debugging permission denied errors along a path.  
Permission Breakdown (chmod style)
| Symbol | Binary | Octal | Meaning |
| ------ | ------ | ----- | ------- |
| `r`    | 100    | 4     | Read    |
| `w`    | 010    | 2     | Write   |
| `x`    | 001    | 1     | Execute |

So:  
`rwx` = `4+2+1` = `7`  
`r-x` = `4+0+1` = `5`  
`r--` = `4+0+0` = `4`  

Summary: 
| Task                     | Command                     |
| ------------------------ | --------------------------- |
| Check file permissions   | `ls -l script.sh`           |
| Detailed info            | `stat script.sh`            |
| Check each path segment  | `namei -l ./script.sh`      |
| View numeric permissions | `stat -c "%a %n" script.sh` |















