# Mini_C_compiler with Three Address Code

A simple compiler implementation demonstrating lexical analysis, syntax parsing, semantic analysis, and intermediate code generation for a C-like language.

## Overview

ReadyCompiler demonstrates all major phases of compilation:

1. **Lexical Analysis** - Using Flex to tokenize source code
2. **Syntax Analysis** - Using Bison (YACC) for parsing
3. **Semantic Analysis** - Type checking, symbol table, and error reporting
4. **Intermediate Code Generation** - Three-address code
5. **Code Output Phase** - Compiling and executing the generated code

## Project Structure

- `lexer.l` - Flex lexical analyzer specification
- `parser.y` - Bison grammar specification (main logic, error handling, codegen)
- `parser_commented.y` - Commented version of the parser for learning/reference
- `input.c` - Example input source file
- `output.txt` - Generated output from compiler execution

## Features

- Support for basic data types: int, float, char
- Variable declaration and initialization
- Arithmetic operations (+, -, \*, /) with parentheses and precedence
- Relational operations (<, >, <=, >=, ==, !=)
- Control structures: if-else, for loops
- Type checking and type conversion
- Error reporting for both syntax and semantic errors (with line numbers)
- Intermediate (three-address) code generation
- Symbol table management
- Parse tree generation (AST)
- Multiple input/output handling: supports different input files and outputs results to `output.txt`
- Clear error output: prints only syntax error with line number if present, otherwise normal output

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
./a.out < input.c
```

### Sample Execution

The compiler processes input source code and produces:

1. Intermediate code (three-address code)
2. Compilation output (GCC errors if any)
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
    int k=9;
    x=y+(z+k)/2;
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
k = 9
t0 = z + k
t1 = t0 / 2
t2 = y + t1
x = t2
y = 10
z = 5

if (x > 5) GOTO L0 else GOTO L1

LABEL L0:
k = 0

LABEL L2:

if NOT (k < 10) GOTO L3
t4 = x + 3
y = t4
t3 = k + 1
k = t3
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
t6 = j + 1
j = t6
JUMP to L8

LABEL L9:
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

### Syntax Error Example

If a syntax error is present in the input, the output will be:

```
syntax error at line X
```

## Implementation Details

- **Lexical Analyzer**: Identifies keywords, identifiers, constants, operators, and special symbols.
- **Parser**: Handles expression parsing, statement parsing, control structures, type checking, symbol table management, and intermediate code generation.
- **Symbol Table**: Tracks variable names, data types, variable types, and line numbers for declarations.
- **Intermediate Code Generation**: Produces three-address code for assignments, arithmetic, conditionals, and loops.
- **Error Handling**: Reports undeclared variables, multiple declarations, type mismatches, and reserved keyword misuse. Syntax errors are reported with line numbers.

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
