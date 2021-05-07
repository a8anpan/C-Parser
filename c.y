%{

#include <stdio.h>

int yylex();
int yyerror(char *s);

extern FILE *yyin;
extern FILE **yyout;
extern char* yytext;
extern int yylineno;

%}

%token VARS PROGRAM FUNCTION END_FUNCTION STARTMAIN ENDMAIN CLASS RETURN ARGS DELI DOT TEST
%token TESTOP FOR WHILE OR AND LEFT_PAR RIGHT_PAR LEFT_C_BRA RIGHT_C_BRA LEFT_BRA RIGHT_BRA 
%token THEN TEST2 INT NAME TYPE_COMMENT ASSIGNOP SEM COMMA CHAR BREAK OP NEWLINE INDENT
%token INTEGER IF ELSE ENDIF ENDWHILE MINMAXOP SYMOP MULOP

%type <a> NAME
%type <i> INT

%union {
    char *a;
    int i;
}

%%

program: PROGRAM NAME NEWLINE declList;
declList: declList decl | decl;
decl: varDecl | funDecl;
funDecl: FUNCTION NAME LEFT_PAR parms RIGHT_PAR NEWLINE varDecl NEWLINE END_FUNCTION;
parms: parmList;
parmList: parmList COMMA parmTypeList | parmTypeList;
parmTypeList: typeSpec NAME;
varDecl: VARS typeSpec varDeclList SEM;
typeSpec: INTEGER | CHAR;
varDeclList: varDeclList COMMA varDeclInit | varDeclInit;
varDeclInit: varDeclId;
varDeclId: NAME | NAME LEFT_BRA INT RIGHT_BRA;

%% 

int yyerror(char *s) {
    fprintf(stderr, "%s in line %d\n", s, yylineno);
    return 0;
}

int main(int argc, char **argv) {
    printf("C Set Parser\n\n");
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yyparse();
    return 0;
}
