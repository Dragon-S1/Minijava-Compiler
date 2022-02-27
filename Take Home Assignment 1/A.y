%{
	#include <stdio.h>
%}

%union{
	char *text;
}

%token NUM
%token ADD SUB MUL DIV
%token EOL
%type<text> goal expr term factor NUM

%%

goal : expr EOL
{};

expr : expr ADD term
{
	printf(" + ");
}
	|	expr SUB term
{
	printf(" - ");
}
	|	term
{};

term : term MUL factor
{
	printf(" * ");
}
	|	term DIV factor
{
	printf(" / ");
}
	|	factor
{};

factor : NUM
{
	printf("%s ", $1);
};

%%

int yyerror(char *s){
	printf("ERROR: %s\n", s);
	printf("Invalid Infix Expression\n");
	return 0;
}

int main(int argc, char **argv){
	yyparse();
	return 0; 
}