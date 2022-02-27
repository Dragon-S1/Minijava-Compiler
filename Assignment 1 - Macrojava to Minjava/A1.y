%{
	#include <stdio.h>
	#include <string.h>

	char* ids[100];
	char* vals[100];
	int pointer = 0;

	void store(char*,char*);
	char* getval(char*);
%}

%union{
	char *text;
}

%token<text> CLASS PUBLIC STATIC VOID MAIN EXTENDS RETURN
%token<text> STRING SOP
%token<text> INT BOOL IF ELSE WHILE TRUE FALSE NEW THIS DLENGTH
%token<text> LCRBRAC RCRBRAC LBRAC RBRAC LSQBRAC RSQBRAC
%token<text> ADD SUB MUL DIV EQ SCOLON COMMA NOT DOT AND OR NEQ LEQ
%token<text> DSTMT DSTMT0 DSTMT1 DSTMT2 DEXPR DEXPR0 DEXPR1 DEXPR2
%token<text> NUM ID
%type<text> Goal MainClass TypeDeclaration MethodDeclaration Type Statement Expression PrimaryExpression MacroDefinition MacroDefStatement MacroDefExpression Identifier Integer recMacroDefinition recTypeDeclaration TypeIdentifier1 TypeIdentifier2 recMethodDeclaration recStatement recExpression recIdentifier


%%

Goal:  recMacroDefinition MainClass recTypeDeclaration { sprintf($$,"%s\n%s",$2,$3); printf("%s",$$);};

MainClass:	CLASS Identifier LCRBRAC PUBLIC STATIC VOID MAIN LBRAC STRING LSQBRAC RSQBRAC Identifier RBRAC LCRBRAC SOP LBRAC Expression RBRAC SCOLON RCRBRAC RCRBRAC { sprintf($$,"%s %s%s\n%s %s %s %s%s%s%s%s %s%s%s\n%s%s%s%s%s\n%s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21);};

TypeDeclaration:	CLASS Identifier LCRBRAC TypeIdentifier1 recMethodDeclaration RCRBRAC { sprintf($$,"%s %s%s\n%s%s%s\n",$1,$2,$3,$4,$5,$6);}
	|	CLASS Identifier EXTENDS Identifier LCRBRAC TypeIdentifier1 recMethodDeclaration RCRBRAC { sprintf($$,"%s %s %s %s%s\n%s %s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8); };

MethodDeclaration:	PUBLIC Type Identifier LBRAC Type Identifier TypeIdentifier2 RBRAC LCRBRAC TypeIdentifier1 recStatement RETURN Expression SCOLON RCRBRAC { sprintf($$,"%s %s %s%s%s %s%s%s%s\n%s%s\n%s %s%s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15);}
	|	PUBLIC Type Identifier LBRAC RBRAC LCRBRAC TypeIdentifier1 recStatement RETURN Expression SCOLON RCRBRAC {	sprintf($$,"%s %s %s%s%s%s\n%s%s\n%s %s%s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);	};

Type:	INT LSQBRAC RSQBRAC { sprintf($$,"%s%s%s",$1,$2,$3); }
	|	BOOL { sprintf($$,"%s",$1); }
	|	INT { sprintf($$,"%s",$1); }
	|	Identifier { sprintf($$,"%s",$1); };

Statement: LCRBRAC recStatement RCRBRAC { sprintf($$,"%s%s%s\n",$1,$2,$3); }
	|	SOP LBRAC Expression RBRAC SCOLON { sprintf($$,"%s%s%s%s%s\n",$1,$2,$3,$4,$5); }
	|	Identifier EQ Expression SCOLON { sprintf($$,"%s %s %s%s\n",$1,$2,$3,$4); }
	|	Identifier LSQBRAC Expression RSQBRAC EQ Expression SCOLON { sprintf($$,"%s%s%s%s %s %s%s\n",$1,$2,$3,$4,$5,$6,$7); }
	|	IF LBRAC Expression RBRAC Statement { sprintf($$,"%s %s%s%s\n%s",$1,$2,$3,$4,$5); }
	|	IF LBRAC Expression RBRAC Statement ELSE Statement { sprintf($$,"%s %s%s%s\n%s%s %s",$1,$2,$3,$4,$5,$6,$7); }
	|	WHILE LBRAC Expression RBRAC Statement { sprintf($$,"%s%s%s%s\n%s",$1,$2,$3,$4,$5); }
	|	Identifier LBRAC Expression recExpression RBRAC SCOLON {
				sprintf($$,"%s%s%s%s%s%s\n",$1,$2,$3,$4,$5,$6);
	}
	|	Identifier LBRAC RBRAC SCOLON { 
				 sprintf($$,"%s%s%s%s\n",$1,$2,$3,$4); 
		};

Expression:	PrimaryExpression AND PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression OR PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression NEQ PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression LEQ PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression ADD PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression SUB PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression MUL PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression DIV PrimaryExpression { sprintf($$,"%s %s %s",$1,$2,$3); }
	| PrimaryExpression LSQBRAC PrimaryExpression RSQBRAC { sprintf($$,"%s%s%s%s",$1,$2,$3,$4); }
	| PrimaryExpression DLENGTH { sprintf($$,"%s%s",$1,$2); }
	| PrimaryExpression { sprintf($$,"%s",$1); }
	| PrimaryExpression DOT Identifier LBRAC Expression recExpression RBRAC { sprintf($$,"%s%s%s%s%s%s%s",$1,$2,$3,$4,$5,$6,$7); }
	| PrimaryExpression DOT Identifier LBRAC RBRAC { sprintf($$,"%s%s%s%s%s",$1,$2,$3,$4,$5); }
	| Identifier LBRAC Expression recExpression RBRAC { 
				char* id = strdup($1);
				sprintf($$,"%s",getval(id));
		 }
	| Identifier LBRAC RBRAC {
				char* id = strdup($1);
				sprintf($$,"%s",getval(id));
			};

PrimaryExpression:	Integer { sprintf($$,"%s",$1); }
	|	TRUE { sprintf($$,"%s",$1); }
	|	FALSE { sprintf($$,"%s",$1); }
	|	Identifier { sprintf($$,"%s",$1); }
	|	THIS { sprintf($$,"%s",$1); }
	|	NEW INT LSQBRAC Expression RSQBRAC { sprintf($$,"%s %s%s%s%s",$1,$2,$3,$4,$5); }
	|	NEW Identifier LBRAC RBRAC { sprintf($$,"%s %s%s%s",$1,$2,$3,$4); }
	|	NOT Expression { sprintf($$,"%s%s",$1,$2); }
	|	LBRAC Expression RBRAC { sprintf($$,"%s%s%s",$1,$2,$3); };

MacroDefinition:	MacroDefExpression { sprintf($$,"%s",$1); }
	|	MacroDefStatement { sprintf($$,"%s",$1); };

MacroDefStatement:	DSTMT Identifier LBRAC Identifier COMMA Identifier COMMA Identifier recIdentifier RBRAC LCRBRAC recStatement RCRBRAC { sprintf($$,"%s %s%s%s%s %s%s %s%s%s%s\n%s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13); store($2,$12);}
 	|	DSTMT0 Identifier LBRAC RBRAC LCRBRAC recStatement RCRBRAC { sprintf($$,"%s %s%s%s%s\n%s\n%s\n",$1,$2,$3,$4,$5,$6,$7); store($2,$6);}
	|	DSTMT1 Identifier LBRAC Identifier RBRAC LCRBRAC recStatement RCRBRAC { sprintf($$,"%s %s%s%s%s%s\n%s\n%s\n",$1,$2,$3,$4,$5,$6,$7,$8); store($2,$7); }
	|	DSTMT2 Identifier LBRAC Identifier COMMA Identifier RBRAC LCRBRAC recStatement RCRBRAC {	sprintf($$,"%s %s%s%s%s %s%s%s\n%s\n%s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10); store($2,$9);};

MacroDefExpression:	DEXPR Identifier LBRAC Identifier COMMA Identifier COMMA Identifier recIdentifier RBRAC LBRAC Expression RBRAC { sprintf($$,"%s %s%s%s%s %s%s %s%s%s %s%s%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13); store($2,$12);}
	|	DEXPR0 Identifier LBRAC RBRAC LBRAC Expression RBRAC { sprintf($$,"%s %s%s%s %s%s%s\n",$1,$2,$3,$4,$5,$6,$7); store($2,$6);}
	|	DEXPR1 Identifier LBRAC Identifier RBRAC LBRAC Expression RBRAC { sprintf($$,"%s %s%s%s%s %s%s%s\n",$1,$2,$3,$4,$5,$6,$7,$8); store($2,$7); }
	|	DEXPR2 Identifier LBRAC Identifier COMMA Identifier RBRAC LBRAC Expression RBRAC {	sprintf($$,"%s %s%s%s%s %s%s %s%s%s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10); store($2,$9);};

Identifier:	ID { sprintf($$,"%s",$1); };

Integer: NUM { sprintf($$,"%s",$1); };

recMacroDefinition: MacroDefinition recMacroDefinition { sprintf($$,"%s%s",$1,$2);}
	| /* empty */ { $$=strdup("");};

recTypeDeclaration: TypeDeclaration recTypeDeclaration { sprintf($$,"%s%s",$1,$2); }
	| /* empty */ { $$=strdup("");};

TypeIdentifier1: TypeIdentifier1 Type Identifier SCOLON { sprintf($$,"%s%s %s%s\n",$1,$2,$3,$4);}
	| /* empty */ { $$=strdup("");};

TypeIdentifier2: TypeIdentifier2 COMMA Type Identifier  { sprintf($$,"%s%s %s %s",$1,$2,$3,$4);}
	| /* empty */ { $$=strdup("");};

recMethodDeclaration: MethodDeclaration recMethodDeclaration { sprintf($$,"%s%s",$1,$2);}
	| /* empty */ { $$=strdup("");};

recStatement: Statement recStatement {sprintf($$,"%s%s",$1,$2);}
	| /* empty */ { $$=strdup("");};

recExpression: recExpression COMMA Expression { sprintf($$,"%s%s %s",$1,$2,$3); }
	|	/* empty */ { $$=strdup("");};

recIdentifier: recIdentifier COMMA Identifier { sprintf($$,"%s%s %s",$1,$2,$3); }
	| /* empty */ { $$=strdup("");};

%%

void store(char* id,char* val){
	ids[pointer] = strdup(id);
	vals[pointer] = strdup(val);
	pointer++;
}

char* getval(char* id){
	for(int i=0; i<pointer; i++){
		if(strcmp(ids[i],id)==0)
			return vals[i];
	}
	return 0;
}


int yyerror(char *s){
	printf("ERROR: %s\n", s);
	printf("// Failed to parse macrojava code.\n");
	return 0;
}

int main(int argc, char **argv){
	yyparse();
	return 0; 
}