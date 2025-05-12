# Example to Explain a Compiler (C program + Shell)
# Demonstrates difference between compiled & interpreted execution

#!/bin/bash

# Create a simple C program
cat <<EOF > hello.c   
#include <stdio.h>
int main() {
    printf("Hello from compiled C code!\\n");
    return 0;
}
EOF
# cat <<EOF creates a C file

# Compile it
gcc hello.c -o hello_program
# gcc is the compiler (turns C code into binary)

# Run the compiled file
./hello_program

