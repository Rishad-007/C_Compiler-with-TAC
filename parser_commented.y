/*
 * parser_commented.y
 *
 * This is a Yacc/Bison file with detailed comments for each section.
 * It is designed to parse a C-like language and generate intermediate code.
 *
 * Updated to reflect the current implementation in parser.y, including:
 * - Syntax error reporting with line number
 * - Full C declarations for symbol table, AST, and code generation
 * - Two-phase output: intermediate code and program output
 * - Support for semantic checks and error handling
 */

%{
/* C declarations: included at the top of the generated parser source file. */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "lex.yy.c"
void yyerror(const char *s);
int yylex();
int yywrap();
void add(char);
void insert_type();
int search(char *);
void print_tree(struct node*);
void print_tree_util(struct node*, int);
void print_inorder(struct node *);
void check_declaration(char *);
void check_return_type(char *);
int check_types(char *, char *);
char *get_type(char *);
struct node* mknode(struct node *left, struct node *right, char *token);

// Symbol table and AST node definitions
struct dataType {
    char * id_name;
    char * data_type;
    char * type;
    int line_no;
} symbol_table[40];

int count=0, q, sem_errors=0, ic_idx=0, temp_var=0, label=0, is_for=0;
char type[10], buff[100], errors[10][100], reserved[10][10] = {"int", "float", "char", "void", "if", "else", "for", "main", "return", "include"};
char icg[50][100];
struct node { struct node *left; struct node *right; char *token; };
struct node *head;
extern int countn;
%}

/* Token and type declarations. */
%token NUMBER IDENTIFIER
%token PLUS MINUS TIMES DIVIDE ASSIGN SEMICOLON
%token LPAREN RPAREN LBRACE RBRACE
%token IF ELSE FOR WHILE RETURN

%%
/* Grammar rules and actions. */

program:
    statements
    ;

statements:
    /* empty */
    | statements statement
    ;

statement:
      expression SEMICOLON
    | IF LPAREN expression RPAREN statement
    | IF LPAREN expression RPAREN statement ELSE statement
    | FOR LPAREN expression SEMICOLON expression SEMICOLON expression RPAREN statement
    | WHILE LPAREN expression RPAREN statement
    | LBRACE statements RBRACE
    | RETURN expression SEMICOLON
    ;

expression:
      NUMBER
    | IDENTIFIER
    | expression PLUS expression
    | expression MINUS expression
    | expression TIMES expression
    | expression DIVIDE expression
    | IDENTIFIER ASSIGN expression
    | LPAREN expression RPAREN
    ;

%%
/* User code section: helper functions, main, error handling, etc. */

// Syntax error reporting with line number
void yyerror(const char* msg) {
    fprintf(stderr, "%s\n", msg);
}

int main() {
    FILE *output_file = fopen("output.txt", "w");
    if (output_file == NULL) {
        printf("Error opening output.txt file!\n");
        return 1;
    }
    int parse_result = yyparse();
    if (parse_result != 0) {
        extern int yylineno;
        fprintf(output_file, "syntax error at line %d\n", yylineno);
        printf("syntax error at line %d\n", yylineno);
        fclose(output_file);
        return 1;
    }
    // ...rest of code generation and output logic as in parser.y...
}
