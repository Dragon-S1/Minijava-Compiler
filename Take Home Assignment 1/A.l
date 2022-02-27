%{
#include <string.h>
#include "A.tab.h"
%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }

[0-9]+ {
	// yylval = atoi(yytext);
	int len = strlen(yytext);
	yylval.text = (char*) malloc((len + 1) * sizeof(char));
	yylval.text[0]= '\0';
	strcat(yylval.text,yytext);
	return NUM;
}

\n { return EOL; }
[ \t] { }
. { printf("Unknown character: %s\n", yytext); }

%%