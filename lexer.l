%{
#include "parser.tab.h" // Include the parser's token definitions
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]    { return yytext[0]; }
[ \t]       ; // Ignore whitespace

.           { fprintf(stderr, "Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1; // Indicate end of input
}
