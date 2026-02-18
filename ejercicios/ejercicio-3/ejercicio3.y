/* Ejercicio 3: Calculadora con AND y OR */
%{
#include <stdio.h>
%}
%token NUMBER
%token ADD SUB MUL DIV ABS
%token AND OR
%token EOL

%left OR
%left AND
%left ADD SUB
%left MUL DIV

%%
calclist: /* nothing */
    | calclist exp EOL { printf("= %d\n", $2); }
    | calclist EOL
    ;

exp: exp OR exp     { $$ = $1 | $2; }
   | exp AND exp    { $$ = $1 & $2; }
   | exp ADD exp    { $$ = $1 + $3; }
   | exp SUB exp    { $$ = $1 - $3; }
   | exp MUL exp    { $$ = $1 * $3; }
   | exp DIV exp    { $$ = $1 / $3; }
   | ABS exp        { $$ = $2 >= 0? $2 : -$2; }
   | NUMBER         { $$ = $1; }
   ;

%%
main(int argc, char **argv)
{
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
