# ReadyCompiler

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
flex lexer.l

# Generate the parser
bison -dy parser.y

# Compile the generated code
gcc y.tab.c -o readycompiler

# Run the compiler on an input file
./readycompiler < input.c
```

### Sample Execution

The compiler processes input source code and produces:

1. Intermediate code
2. Compilation output
3. Program execution results

All output is displayed in the terminal and saved to `output.txt`.

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
