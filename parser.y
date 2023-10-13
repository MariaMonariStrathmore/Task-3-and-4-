%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%%

input: /* empty */
    | input expr '\n' { printf("Result: %d\n", $2); }
    ;

expr:
    NUMBER { $$ = $1; }
    | expr '+' NUMBER { $$ = $1 + $3; }
    | expr '-' NUMBER { $$ = $1 - $3; }
    | expr '*' NUMBER { $$ = $1 * $3; }
    | expr '/' NUMBER { 
        if ($3 == 0) {
            fprintf(stderr, "Division by zero\n");
            exit(1);
        }
        $$ = $1 / $3;
    }
    ;

%%

int main() {
    yyparse(); // Start the parsing process
    return 0;
}