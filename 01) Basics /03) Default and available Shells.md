# 1. Check Your Current (Default) Shell

## Method 1: Using `echo $SHELL`
```bash
echo $SHELL
```
This prints the default shell configured for your user.  
Example output:  
```bash
/bin/bash
```

## Method 2: Using `echo $0`
```bash
echo $0
```
This shows the **shell running in the current terminal**.  
Can sometimes show `-bash` or just `bash`, depending on how the shell was launched.  

## Method 3: Using `ps -p $$`
```bash
ps -p $$ -o comm=
```
This shows the name of the currently running shell process.  
Example output:  
```bash
bash
```

# 2. Check All Available Shells on the System
## Method: Read `/etc/shells` file
```bash
cat /etc/shells
```

This file contains a list of all valid login shells available on your system  
Example output:  
```bash
/bin/sh
/bin/bash
/usr/bin/zsh
/usr/bin/fish
/bin/dash
```

# 3. How to Change Your Default Shell
Use `chsh` to Change Shell
```bash
chsh -s /path/to/shell
```
Example: Change to Zsh:
```bash
chsh -s /usr/bin/zsh
```
> `-s` means: specify new shell  
> Make sure the shell you choose is listed in `/etc/shells`  
> You might be asked for your user password  
> You may need to log out and log back in for changes to take effect  
> Confirm with: `echo $SHELL`  

# 4. To Change Shell for Another User (as root)
```bash
sudo chsh -s /bin/bash username
```

