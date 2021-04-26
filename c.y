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
%token INTEGER IF ELSE ENDIF ENDWHILE CHARACTER STRING_LITERAL

%type <a> NAME
%type <i> INT

%union {
    char *a;
    int i;
}

%%

program: PROGRAM NAME NEWLINE input;
input: primary_expression;
type: CHAR
 	| INTEGER
    ;
primary_expression: NAME
	              | STRING_LITERAL
	              | LEFT_PAR expression RIGHT_PAR
	              ;

assignment_expression: conditional_expression
	                 | unary_expression assignment_operator assignment_expression
	                 ;
conditional_expression: logical_or_expression
	                  | logical_or_expression '?' expression DELI conditional_expression
                	  ;
expression: assignment_expression
	      | expression COMMA assignment_expression
	      ;
logical_or_expression: logical_and_expression
                     | logical_or_expression OR logical_and_expression
	                 ;

unary_expression
	: postfix_expression
	| INC_OP unary_expression
	| DEC_OP unary_expression
	| unary_operator cast_expression
	;


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