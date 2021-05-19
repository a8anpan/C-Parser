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
%token INTEGER IF ELSE ENDIF ENDWHILE CHARACTER STRING_LITERAL SUMOP MULOP TO ENDFOR STEP

%type <a> NAME
%type <i> INT

%union {
    char *a;
    int i;
}

%%

program:        PROGRAM NAME NEWLINE declList;
declList:       declList decl | decl;
decl:           varDecl | funDecl;
funDecl:        FUNCTION NAME LEFT_PAR parms RIGHT_PAR NEWLINE stmtList NEWLINE END_FUNCTION;
stmtList:       stmtList stmt | /* empty */;
stmt:           expStmt | iterStmt;
iterStmt:       WHILE LEFT_PAR NAME condition complExp RIGHT_PAR NEWLINE stmt NEWLINE ENDWHILE
                | FOR NAME ASSIGNOP INT TO INT STEP INT NEWLINE stmt NEWLINE ENDFOR;
condition:      TESTOP | AND | OR;
expStmt:        exp;
exp:            resExp | mutable ASSIGNOP exp;
resExp:         call | complExp;
complExp:       INT | NAME | SUMOP | MULOP | LEFT_PAR | RIGHT_PAR | complExp SEM;
mutable:        NAME | NAME LEFT_PAR INT RIGHT_PAR;
call:           NAME LEFT_PAR args RIGHT_PAR SEM;
args:           argList;
argList:        argList COMMA NAME | NAME;
parms:          parmList;
parmList:       parmList COMMA parmTypeList | parmTypeList;
parmTypeList:   typeSpec NAME;
varDecl:        VARS typeSpec varDeclList SEM;
typeSpec:       INTEGER | CHAR;
varDeclList:    varDeclList COMMA varDeclInit | varDeclInit;
varDeclInit:    varDeclId;
varDeclId:      NAME | NAME LEFT_BRA INT RIGHT_BRA;




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