# 1. What is an Operating System (OS)?
An Operating System is the main software that acts as a bridge between user and hardware.  
It manages everything – like files, memory, programs, and devices (keyboard, mouse, printer, etc.)  
Without an OS, your computer is just hardware – a useless box. The OS gives life to your computer.  

**Examples:** Linux (Ubuntu, CentOS, Red Hat), Windows, macOS  

### Main Responsibilities:
- Managing hardware (CPU, RAM, Disk)
- Running applications
- Handling user interactions

# 2. What is a Kernel?
The Kernel is the core part of the OS. It directly interacts with hardware and handles critical tasks.
### Example:
**You run a script that copies a file:**  
```bash
cp file1.txt /backup/
```
- The shell sends this request to the kernel
- The kernel communicates with the disk drivers
- File is physically copied

### Responsibilities of Kernel:
- Allocating memory
- Managing CPU time
- Controlling devices like keyboard, mouse, disk
- Managing processes

# 3. What is a Shell?
A Shell is a program that takes commands from you (the user) and gives them to the kernel to execute.
> You don’t talk to the kernel directly. You give commands like:
```bash
ls -l
```
> And the shell sends those instructions to the kernel and returns the result.

### Popular Shells:
| Shell Name | Full Form / Notes                         |
| ---------- | ----------------------------------------- |
| `sh`       | Bourne Shell                              |
| `bash`     | **Bourne Again Shell** – Most widely used |
| `zsh`      | Z Shell – interactive features            |
| `ksh`      | Korn Shell                                |
| `csh`      | C Shell                                   |

**Note:** Most Linux systems today use bash by default.  

# 4. What is a Terminal?
A terminal is a text-based interface that allows you to interact with the shell.
> A terminal is a black screen (command box) where you type your commands.
> On Linux, it’s called “Terminal”  
> On Windows, you might use “Command Prompt” or “Git Bash”  


# 5. What is a Shell Script?
A Shell Script is just a text file where you write commands (just like you type in the terminal), and then run them all at once.
> Instead of typing 5 commands every time, just put them in a file.  
> it is not mandatory to give a `.sh` extension for shell scripts. The `.sh` extension is just a convention that helps you and others know that it's a shell script. It doesn't affect how the script works.  
> You can name your script: `script1.sh` or `myscript` or `testscript.bash`  

### Example (file name: `hello.sh`)
```bash
#!/bin/bash
echo "Hello!"
date
```
To run it:
```bash
chmod +x hello.sh   # Make it executable
./hello.sh          # Run the script
```
This will print:
```yaml
Hello!
Mon May 12 12:45:00 IST 2025
```
# 6. What is an Interpreter?
An interpreter is a program that reads your script/code line by line and executes it directly, without converting the whole program into machine code in advance.  
It doesn’t wait to compile the whole thing — it runs your code one step at a time.  

In shell scripting, the interpreter is usually `bash` (Bourne Again Shell) or sometimes `sh`.  
**Let’s take a script:**  
```bash
#!/bin/bash
echo "Start"
sleep 2
echo "End"
```
**When you run this script, here’s what happens:**

1) The shebang line #!/bin/bash tells the OS: "Use the bash interpreter to read this script"
2) The bash interpreter reads:
   - Line 1 → ignores the shebang
   - Line 2: runs echo "Start"
   - Line 3: runs sleep 2 (waits 2 seconds)
   - Line 4: runs echo "End"
> Each line is executed immediately — no need to compile the full script.

# 7. What is a Compiler?
A compiler is a program that converts your entire code into machine language (binary) before running it.
> This means it translates the whole program first, and then you can run the translated file.

| Feature      | Interpreter                      | Compiler                          |
| ------------ | -------------------------------- | --------------------------------- |
| How it works | Line-by-line                     | Entire program at once            |
| Speed        | Slower, since it interprets live | Faster after compilation          |
| Output       | No file created, directly runs   | Creates `.exe` or binary          |
| Example      | Bash, Python, Ruby, JavaScript   | C, C++, Go, Rust, Java (with JVM) |












