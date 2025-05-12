# What is a Variable in Shell?
A variable is a name that stores data (value) which can be reused throughout the script.  
>  Think of it like a container with a label.

Syntax: 
```bash
variable_name=value   # No spaces around '='
```
Use the variable with `$`:
```bash
echo $variable_name
```

Example:
```bash
#!/bin/bash

name="TCS"
echo "Welcome to $name"
```
Output:
```bash
Welcome to TCS
```
## Rules for Variable Names
| Rule                              | Example             |
| --------------------------------- | ------------------- |
| No spaces around `=`              | ✅ `a=10` ❌ `a = 10` |
| Can include letters, numbers, `_` | `user_1`, `dbName`  |
| Can't start with a number         | ❌ `1user=abc`       |
| Case-sensitive                    | `Name` ≠ `name`     |


# Types of Variables

# 1. User-defined Variables (Local/Custom)
These are variables you create in your script to store temporary values.  
Syntax:
```bash
name="Amit"
```
Example:
```bash
#!/bin/bash
username="tcsuser"
echo "Welcome, $username!"
```
**Scenario:** You’re writing a script to generate backups:
```bash
backup_dir="/home/$USER/backups"
echo "Backing up data to $backup_dir"
```


# 2. Environment Variables (Global)
These are built-in variables provided by the operating system. They're available across processes and shells.  

Example:
| **Variable** | **Meaning**                                            | **Example Value**                                              |
| ------------ | ------------------------------------------------------ | -------------------------------------------------------------- |
| `$USER`      | Username of the currently logged-in user               | `john`                                                         |
| `$HOME`      | Home directory of the current user                     | `/home/john`                                                   |
| `$PATH`      | List of directories where the shell looks for commands | `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin` |
| `$PWD`       | Present working directory                              | `/home/john/projects`                                          |
| `$SHELL`     | Path to the current shell used                         | `/bin/bash` or `/bin/zsh`                                      |

```bash
echo "You are logged in as $USER"
echo "Your home directory is $HOME"
```
**Scenario:** Want to add a custom directory to the system’s executable path:
```bash
export PATH=$PATH:/opt/mytools
```

# 3. Positional Parameters (Special Variables)
These hold values passed to the script via the command line.  
Syntax:  
| Variable        | Description                       |
| --------------- | --------------------------------- |
| `$0`            | Name of the script                |
| `$1`, `$2`, ... | First, second, etc. arguments     |
| `$#`            | Number of arguments passed        |
| `$@`            | All arguments (as separate words) |
| `$*`            | All arguments (as single string)  |

Example:
```bash
#!/bin/bash
echo "Script Name: $0"
echo "First Argument: $1"
echo "Second Argument: $2"
echo "Total Args: $#"
```
```bash
$ ./myscript.sh dev server1
```
Output:
```bash
Script Name: ./myscript.sh
First Argument: dev
Second Argument: server1
Total Args: 2
```
**Scenario:** Deploying to different environments:
```bash
#!/bin/bash
env=$1
echo "Deploying to $env environment..."
```

# 4. Read-only Variables
Once set, you cannot change their value.   
Syntax:  
```bash
readonly PI=3.14
```

Example:
```bash
readonly project="DevOps"
project="AI"   # This will throw an error
```
**Scenario:** Protect important constants from being modified by accident in your script

# 5. Unset Variables (delete)
You can remove (delete) a variable using `unset`  
Syntax:  
```bash
unset varname
```
Example:
```bash
name="TCS"
echo $name
unset name
echo $name  # Outputs nothing
```
**Scenario:** You want to reset temporary values in a loop or after use


# 6. Exported Variables
These are user-defined variables that are made available to child processes.  
Syntax:  
```bash
export varname=value
```
Example:
```bash
export LANG=en_US.UTF-8
```
**Scenario:** You want to pass a variable to another script:
```bash
export ENVIRONMENT="prod"
./deploy.sh
```
In `deploy.sh`:
```bash
echo "Deploying to $ENVIRONMENT environment"
```

# 7. Array Variables (Advanced)
Store multiple values in a single variable (only in `Bash`, not plain `sh`).  
Syntax:  
```bash
fruits=("apple" "banana" "cherry")
echo ${fruits[1]}   # banana
```

**Scenario:** Process list of services or file names
```bash
services=("nginx" "mysql" "sshd")

for svc in "${services[@]}"; do
  echo "Checking $svc"
done
```
In `deploy.sh`:
```bash
echo "Deploying to $ENVIRONMENT environment"
```

# Summary Table: 
| Type              | Example              | Scope       | Editable? | Common Use                  |
| ----------------- | -------------------- | ----------- | --------- | --------------------------- |
| User-defined      | `name="Amit"`        | Local       | ✅         | Temporary data in scripts   |
| Environment       | `$USER`, `$HOME`     | Global      | ⚠️ OS Set | System/user info            |
| Positional Params | `$1`, `$2`, `$@`     | Script args | ✅         | Command-line driven scripts |
| Read-only         | `readonly var=value` | Local       | ❌         | Protect fixed values        |
| Unset             | `unset var`          | Local       | ✅         | Clear/reset variable        |
| Exported          | `export var=value`   | Global      | ✅         | Share with sub-scripts      |
| Array             | `arr=("a" "b")`      | Bash only   | ✅         | Handle multiple values      |

# Q&A
### Q1: What is the difference between a user-defined variable and an environment variable in shell scripting?
User-defined variables are created by the user within the script and are local to that script.
```bash
name="Amit"
```
Environment variables are predefined variables in the shell and are global in scope.
```bash
echo $HOME
echo $USER
```
**Scenario:** If you define `name="Amit"` in a script, it won’t be available to other scripts unless you export it with `export`.



### Q2: How do you make a variable available to a child process or another script?
Use the `export` command:
```bash
export VAR="value"
```
**Scenario:** 
```bash
export ENV="prod"
./deploy.sh
```
In `deploy.sh`, you can access `$ENV`.


### Q3: What will happen if you try to change a read-only variable?
The shell will throw an error saying the variable is read-only and cannot be modified.
```bash
readonly role="DevOps"
role="Tester"  # Error
```



### Q4: What's the purpose of unset in shell scripting?
The `unset` command removes a variable from the shell environment.
```bash
x="hello"
unset x
echo $x  # (nothing will print)
```
**Scenario:** Useful when you want to reset a value during iterations or after cleanup.


### Q5: Explain the difference between $@ and $* in shell scripting.
| Variable | Behavior                                  |
| -------- | ----------------------------------------- |
| `$@`     | Treats each argument as a separate string |
| `$*`     | Treats all arguments as one string        |

```bash
./script.sh one two
```
In script:
```bash
for arg in "$@"; do echo $arg; done
```
Output:
```bash
one
two
```

```bash
for arg in "$*"; do echo $arg; done
```
Output:
```bash
one two
```


### Q6: How do you define an array in shell script and access its elements?
```bash
arr=("one" "two" "three")
echo ${arr[1]}  # Output: two
```
**Scenario:** Useful when looping over services:
```bash
services=("nginx" "mysql" "sshd")
for svc in "${services[@]}"; do
  echo "Checking $svc"
done
```

### Q7: How do you check how many arguments are passed to a script?
Use `$#`, which returns the number of arguments.
```bash
echo "Number of args: $#"
```


### Q8: How can you make a variable immutable in shell scripting?
Use the `readonly` command:
```bash
readonly DB_PORT=5432
```


### Q9: What does $0 represent in a shell script?
`$0` gives the name of the script itself.
```bash
echo "You are running $0"
```

### Q10: Can environment variables be overwritten by user-defined variables?
Yes, but only in the current session unless exported:
```bash
PATH="/my/custom/path"  # Overrides PATH temporarily
```
To permanently modify, you usually edit `.bashrc` or `.bash_profile`


### Q11: Can you declare a multi-line variable in shell?
Yes, using quotes:
```bash
msg="Hello,
This is a multi-line
message"
```


### Q12: How do you handle variable substitution safely to avoid errors when the variable is undefined?
Use `${var:-default}` to assign default if undefined:
```bash
echo "User: ${USER_NAME:-guest}"
```


### Q13: How do you make a variable dynamic using command substitution?
Use backticks or `$(...)`:
```bash
today=$(date)
echo "Today is $today"
```

### Q14: How would you loop through an array of services and check their status?
```bash
services=("nginx" "mysql" "sshd")
for s in "${services[@]}"; do
  systemctl is-active --quiet $s && echo "$s is running"
done
```

### Q15: What is the best way to pass secret values like passwords to a script?
Use `read -s` to read passwords silently:
```bash
read -sp "Enter password: " passwd
```
Or export sensitive variables securely and unset them after use.
