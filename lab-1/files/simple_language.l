%{
#include <cstdlib>
#include <string>
#include "y.tab.h"

void TokenError(const char* text);
%}

%%

[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return '='; }
":"                     { return ':'; }
[ \t]                   ;  // skip whitespace
.                       { TokenError(yytext); }
\n                      ; /* ignore all the rest */

%%

int yywrap() {
    return 1;
}

void TokenError(const char* text){
    fprintf(stderr, "Error: token no encontrado '%s'\n", text);
}