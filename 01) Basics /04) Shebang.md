# What is a Shebang (`#!`)?
Shebang is the first line in a script file that tells the OS which interpreter to use to run the script.
```bash
#!/path/to/interpreter
```
`#` → comment symbol in shell  
`!` → special OS directive  
Together `#!` (called shebang) is not a comment — it’s an OS instruction.  
> It must be the first line of the script, with no space between #! and the path.

Common Shebang Examples:
| Shebang Line          | Description                           |
| --------------------- | ------------------------------------- |
| `#!/bin/bash`         | Uses **Bash shell**                   |
| `#!/bin/sh`           | Uses default **Bourne shell**         |
| `#!/usr/bin/env bash` | Portable way to find Bash interpreter |
| `#!/usr/bin/python3`  | Runs script using **Python 3**        |
| `#!/usr/bin/perl`     | Runs script using **Perl**            |

### Example: Basic Bash Script with Shebang
File: `hello.sh`
```bash
#!/bin/bash
echo "Hello, $USER!"
```
Run:
```bash
chmod +x hello.sh
./hello.sh
```
Output:
```bash
Hello, yourusername!
```

# With vs Without Shebang
### With Shebang:
```bash
#!/bin/bash
echo "Running with bash"
```
Run directly:
```bash
./myscript.sh
```

###  Without Shebang:
You must run it with **interpreter**:
```bash
bash myscript.sh
```
#### If you run `./myscript.sh` without a shebang, the OS might:
- Fail (no interpreter)
- Run using default shell (e.g., `/bin/sh`)
- Behave differently (if default shell is not bash)

#### Best Practice: Use #!/usr/bin/env bash
This makes your script portable:
```bash
#!/usr/bin/env bash
```
It dynamically finds `bash` in your system’s `$PATH` — useful across distributions.

# Test: Use Wrong Shebang
```bash
#!/fake/path/bash
echo "This will fail"
```
Run:
```bash
./script.sh
```
Error:
```bash
bad interpreter: No such file or directory
```

# Multi-language Example
### Python script with shebang:
```bash
#!/usr/bin/python3
print("Hello from Python")
```
Make it executable:
```bash
chmod +x script.py
./script.py
```


# Common Questions:

### Q1: Is the shebang mandatory?
No, but:
- Without it, the script won’t run directly (`./script.sh`)
- You’d have to run with interpreter manually (`bash script.sh`)

### Q2: What happens if the shebang path is invalid?
Script won’t run  
You’ll get bad interpreter error  

### Q3: What’s the difference between `#!/bin/bash` vs `#!/usr/bin/env bash`?
| Shebang             | Advantage                              |
| ------------------- | -------------------------------------- |
| `/bin/bash`         | Fast and direct, but not portable      |
| `/usr/bin/env bash` | More portable across different systems |

-------------------------------------------------------------------------------------

| Task                     | Shebang Line Example          |
| ------------------------ | ----------------------------- |
| Bash script              | `#!/bin/bash`                 |
| Portable Bash script     | `#!/usr/bin/env bash`         |
| Python 3 script          | `#!/usr/bin/python3`          |
| Perl script              | `#!/usr/bin/perl`             |
| Generic sh (POSIX shell) | `#!/bin/sh`                   |
| Avoid hard-coded path    | Use `env` to find interpreter |














