%{
	#include <string.h>
	#include "A1.tab.h"
%}

integer (0|([1-9][0-9]*))
alphanum [a-zA-Z_][0-9a-zA-Z_]*

%%
"//".* {}

"class" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return CLASS;
}
"public" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return PUBLIC;
}
"static" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return STATIC;
}
"void" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return VOID;
}
"main" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return MAIN;
}
"extends" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return EXTENDS;
}
"return" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return RETURN;
}

"String" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return STRING;
}
"System.out.println" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return SOP;
}

"int" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return INT;
}
"boolean" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return BOOL;
}
"if" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return IF;
}
"else" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return ELSE;
}
"while" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return WHILE;
}
"true" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return TRUE;
}
"false" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return FALSE;
}
"this" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return THIS;
}
"new" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return NEW;
}
".length" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DLENGTH;
}

"{" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return LCRBRAC;
}
"}" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return RCRBRAC;
}
"(" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return LBRAC;
}
")" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return RBRAC;
}
"[" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return LSQBRAC;
}
"]" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return RSQBRAC;
}

"+" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return ADD;
}
"-" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return SUB;
}
"*" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return MUL;
}
"/" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DIV;
}
"=" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return EQ;
}
";" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return SCOLON;
}
"," {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return COMMA;
}
"!" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return NOT;
}
"." {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DOT;
}
"&&" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return AND;
}
"||" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return OR;
}
"!=" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return NEQ;
}
"<=" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return LEQ;
}

"#defineStmt" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DSTMT;
}
"#defineStmt0" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DSTMT0;
}
"#defineStmt1" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DSTMT1;
}
"#defineStmt2" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DSTMT2;
}
"#defineExpr" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DEXPR;
}
"#defineExpr0" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DEXPR0;
}
"#defineExpr1" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DEXPR1;
}
"#defineExpr2" {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return DEXPR2;
}

{integer} {
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return NUM;
}
{alphanum}	{
	yylval.text = (char*)malloc((strlen(yytext)) * sizeof(char));
	strcpy(yylval.text, yytext);
	return ID;
}

[ \t]+	{}
\n {}
<<EOF>> {return 0;}

%%