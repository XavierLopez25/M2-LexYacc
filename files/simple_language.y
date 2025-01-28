%{
#include <iostream>
#include <string>
#include <map>
static std::map<std::string, int> vars;
inline void yyerror(const char *s) {
    if (std::string(s) == "syntax error") {
        return;
    }
    std::cout << "Parser error: " << s << std::endl;
}
int yylex();
%}

%union { int num; std::string *str; }

%token SEMI
%token<num> NUMBER
%token<str> ID
%type<num> expression
%type<num> assignment

%right '='
%left '+' '-'
%left '*' '/'

%%

program: statement_list
        ;

statement_list: statement
    | statement_list statement
    ;

statement:
      assignment SEMI
    | expression ':' { /* ... */ }

    | error SEMI
      {
        yyerror("Error sintáctico en statement.");
        yyerrok;      
      }
    ;


assignment: ID '=' expression
    {   
        $$ = vars[*$1] = $3;
        printf("Assign %s = %d\n", $1->c_str(), $3);  
        delete $1;
    }
    ;

expression: NUMBER                  { $$ = $1; }
    | ID                            {
        if (vars.find(*$1) == vars.end()) {
            std::cerr << "Warning: variable '" << *$1 << "' no inicializada. Valor = 0" << std::endl;
            $$ = 0;
        } else {
            $$ = vars[*$1];
        }
        delete $1;
      }
    | expression '+' expression     { $$ = $1 + $3; }
    | expression '-' expression     { $$ = $1 - $3; }
    | expression '*' expression     { $$ = $1 * $3; }
    | expression '/' expression     {
        if ($3 == 0) {
            std::cerr << "Error: División entre 0." << std::endl;
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
      }
    | '(' expression ')'            { $$ = $2; } 
    ;

%%

int main() {
    yyparse();
    return 0;
}