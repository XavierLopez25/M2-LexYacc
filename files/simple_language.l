%{
#include <cstdlib>
#include <string>
#include "y.tab.h"
%}

%%
"("                     { return '('; }
")"                     { return ')'; }
[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return '='; }
":"                     { return ':'; }
";"                     { return SEMI; }
[ \t]+                  ;    // ignora espacios
(\r\n|\n|\r)+                 ;    // ignora saltos de línea
. {
    fprintf(stderr, "Error: Token inválido '%s'\n", yytext);
}


%%

int yywrap() {
    return 1;
}