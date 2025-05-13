# Mini_C_compiler with Three adress code

A simple compiler implementation demonstrating lexical analysis, syntax parsing, and intermediate code generation for a C-like language.

## Overview

ReadyCompiler is a compiler project that demonstrates various phases of compilation including:

1. **Lexical Analysis** - Using Flex to tokenize source code
2. **Syntax Analysis** - Using Bison (YACC) for parsing
3. **Intermediate Code Generation** - Generating three-address code
4. **Code Output Phase** - Compiling and executing the generated code

This project serves as an educational tool for understanding compiler construction fundamentals and demonstrates practical implementation of compiler theory concepts.

## Project Structure

- `lexer.l` - Flex lexical analyzer specification
- `parser.y` - Bison grammar specification
- `input.c` - Example input source file
- `output.txt` - Generated output from compiler execution

## Features

- Support for basic data types: int, float, char
- Variables declaration and initialization
- Arithmetic operations (+, -, \*, /)
- Relational operations (<, >, <=, >=, ==, !=)
- Control structures (if-else, for loops)
- Type checking and type conversion
- Error reporting for semantic errors
- Intermediate code generation
- Symbol table management
- Parse tree generation

## Building and Running

### Prerequisites

- GCC
- Flex (Fast Lexical Analyzer)
- Bison (GNU Parser Generator)

### Compilation Steps

```bash
# Generate the lexical analyzer
lex lexer.l

# Generate the parser
yacc -d -v parser.y

# Compile the generated code
gcc -ll -w y.tab.c

# Run the compiler on an input file
./a.out<input.c
```

### Sample Execution

The compiler processes input source code and produces:

1. Intermediate code
2. Compilation output
3. Program execution results

All output is displayed in the terminal and saved to `output.txt`.

## Example Input and Output

### Sample Input Code (input.c)

```c
#include<stdio.h>
#include<string.h>

int main() {
    int a;
    int x=1;
    int y=2;
    int z=3;
    x=3;
    y=10;
    z=5;
    if(x>5) {
        for(int k=0; k<10; k++) {
            y = x+3;
            printf("Hello!");
        }
    } else {
        int idx = 1;
    }
    for(int i=0; i<10; i++) {
        printf("Hello World!\n");
        scanf("%d", &x);
        if (x>5) {
            printf("Hi");
        }
        for(int j=0; j<z; j++) {
            a=1;
        }
    }
    return 1;
}
```

### Generated Intermediate Code (output.txt)

```
PHASE 1: INTERMEDIATE CODE GENERATION

a = NULL
x = 1
y = 2
z = 3
x = 3
y = 10
z = 5

if (x > 5) GOTO L0 else GOTO L1

LABEL L0:
k = 0

LABEL L2:

if NOT (k < 10) GOTO L3
t1 = x + 3
y = t1
t0 = k + 1
k = t0
JUMP to L2

LABEL L3:

LABEL L1:
idx = 1
GOTO next
i = 0

LABEL L4:

if NOT (i < 10) GOTO L5

if (x > 5) GOTO L6 else GOTO L7

LABEL L6:
LABEL L7:
GOTO next
j = 0

LABEL L8:

if NOT (j < z) GOTO L9
a = 1
t3 = j + 1
j = t3
JUMP to L8

LABEL L9:
t3 = j + 1
j = t3
JUMP to L4

LABEL L5:
```

### Program Output

```
--- Program Output ---
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
```

## Implementation Details

### Lexical Analyzer

The lexical analyzer (`lexer.l`) identifies tokens such as:

- Keywords (if, else, for, int, float, char, etc.)
- Identifiers
- Constants (integer, float, character)
- Operators
- Special symbols

### Parser

The parser (`parser.y`) implements a grammar for a C-like language and includes:

- Expression parsing
- Statement parsing
- Control structure parsing
- Type checking
- Symbol table management
- Intermediate code generation

### Symbol Table

The compiler maintains a symbol table to track:

- Variable names
- Data types
- Variable types (variable, constant, function, etc.)
- Line numbers for declarations

### Intermediate Code Generation

The compiler generates three-address code as an intermediate representation, which includes:

- Assignment statements
- Arithmetic operations
- Conditional jumps
- Labels

## Error Handling

The compiler detects and reports various errors, such as:

- Undeclared variables
- Multiple declarations
- Type mismatch in assignments
- Type mismatch in return statements
- Use of reserved keywords as identifiers

## Author

**Rishad Nur**  
CSE, Begum Rokeya University, Rangpur  
Email: rishad.nur007@gmail.com  
Facebook: [www.facebook.com/rishad.nur](https://www.facebook.com/rishad.nur)

## License

This project is open-source and available for educational purposes.

## Acknowledgments

- Thanks to the Flex and Bison development teams
- Inspired by compiler design principles and techniques from various textbooks
