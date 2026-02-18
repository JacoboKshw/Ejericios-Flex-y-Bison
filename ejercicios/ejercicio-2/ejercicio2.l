%{
# include "ejercicio2.tab.h"
#include <stdlib.h>
%}
%%
"+"                  { return ADD; }
"-"                  { return SUB; }
"*"                  { return MUL; }
"/"                  { return DIV; }
"|"                  { return ABS; }
0[xX][0-9a-fA-F]+    { yylval = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+               { yylval = atoi(yytext); return NUMBER; }
\n                   { return EOL; }
[ \t]                { /* ignore whitespace */ }
"//".*               { /* ignore comments */ }
.                    { printf("Mystery character %c\n", *yytext); }
%%
