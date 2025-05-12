# How to Write Comments
```bash
# This is a single-line comment
```
Anything after # on a line is ignored by the shell  
Examples:  
```bash
#!/bin/bash

# This script checks if sshd is running

service="sshd"  # Assigning the service name

# Checking service status
if systemctl is-active --quiet $service; then
  echo "✅ $service is running."
else
  echo "❌ $service is NOT running."
fi
```
**Important Rules:**  
| Rule                                | Explanation                                    |
| ----------------------------------- | ---------------------------------------------- |
| Starts with `#`                     | Everything after `#` is ignored by shell       |
| No multi-line comment block in Bash | You must use `#` at the beginning of each line |
| `#!` (Shebang) is **not** a comment | It’s a special directive for the OS            |

# Commenting Multiple Lines (Manual Way):
```bash
# This is line 1 of the comment
# This is line 2 of the comment
# This is line 3 of the comment
```
### Or use a here-doc trick (not actual comment, but a workaround):
```bash
: <<'COMMENT'
This is a block of
non-executed lines
used like a comment.
COMMENT
```

# Q&A
### Q: How do you comment out multiple lines in Bash?
A: Use # on each line or `: <<'BLOCK'` (here-doc trick, though not technically a comment).

### Q: Will a comment before `#!/bin/bash` cause an issue?
A: It might — avoid putting anything before the shebang. OS reads the first line to decide the interpreter.









