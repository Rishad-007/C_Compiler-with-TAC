/*
 * parser_commented.y
 *
 * This is a sample Yacc/Bison file with detailed comments for each section.
 * It is designed to parse a C-like language.
 */

%{
/* C code section: included at the top of the generated parser source file. */
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

/* Declarations section: token and type declarations. */
%token NUMBER IDENTIFIER
%token PLUS MINUS TIMES DIVIDE ASSIGN SEMICOLON
%token LPAREN RPAREN LBRACE RBRACE
%token IF ELSE FOR WHILE RETURN

%%
/* Grammar rules section: define the language grammar here. */

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
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter code to parse:\n");
    yyparse();
    return 0;
}
