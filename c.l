%{

#include <stdio.h>
#include "y.tab.h"

void showError();

%}

%option noyywrap yylineno

%x comments

NUMBERS ([0-9])+
FLOATS [-+]?[0-9]*\.?[0-9]+
NAME ([a-zA-Z0-9_])+
COMMENT "%".*
OP [-+/*]

%%

"/*" BEGIN(comments);

<comments>{
     [^*\n]*
     "*"+[^*/\n]*
     \n
     "*/" BEGIN(INITIAL);
}

"VARS" {return VARS;}
"PROGRAM" {return PROGRAM;}
"FUNCTION" { return (FUNCTION); }
"END_FUNCTION" {return (END_FUNCTION);}
"STARTMAIN" {return (STARTMAIN);}
"ENDMAIN" {return (ENDMAIN)}
"class" { return (CLASS); }
"RETURN" { return (RETURN);}
"()" { return (ARGS); }
":" { return (DELI); }
"." { return (DOT); }
"IF"|"ELSEIF"|"ELSE"| "ENDIF" { return (TEST); }
"THEN" { return (THEN);}
"SWITCH"|"CASE"|"DEFAULT"|"ENDSWITCH" { return (TEST2);}
"<"|">"|"=="|"!=" { return (TESTOP); }
"FOR"| "ENDFOR" { return (FOR); }
"WHILE"|"ENDWHILE" {return (WHILE);}
"||" {return (OR);}
"&&" { return (AND);}
"(" { return (LEFT_PAR);}
")" { return (RIGHT_PAR);}
"{" { return (LEFT_C_BRA);}
"}" { return (RIGHT_C_BRA);}
"[" { return (LEFT_BRA);}
"]" { return (RIGHT_BRA);}
{NUMBERS} { yylval.i = atoi(yytext); return (INT); }
{FLOATS} { yylval.f = atof(yytext);return (FLOAT); }
{COMMENT} { return (TYPE_COMMENT); }
{NAME} { yylval.a = yytext; return (NAME); }
{OP} { return (OP); }
"\n"|"\r\n" { return (NEWLINE); }
"\t"|"  "|"    " { return (INDENT); }
"=" { return (ASSIGNOP); }
. { showError(); }
";" { return (SEM);}
"," { return (COMMA);}
"+" { return (ADD);}
"-" { return (SUB);}
"*" {return (MUL);}
"/" { return (DIV);}
"%" {return (MOD);}
"char" { return (CHAR);}
"BREAK" { return (BREAK);}

%%

void showError() {
    // printf("Unrecognized token\n");
}