%{

#include <stdio.h>
#include <string.h>
#include "y.tab.h"

int lineno = 1; 

void showError();


%}

%option noyywrap yylineno

%x comments
%x MULTILINE_COMMENT

NUMBERS ([0-9])+
NAME ([a-zA-Z0-9_])+
COMMENT "%".*
SUMOP [-+]
MULOP [/^*]
MARKS ["]

%%


"="                                     { return (ASSIGNOP); }
"INTEGER"                               { return (INTEGER); }
"VARS"                                  { return (VARS); }
"PROGRAM"                               { return (PROGRAM); }
"FUNCTION"                              { return (FUNCTION); }
"END_FUNCTION"                          { return (END_FUNCTION); }
"STARTMAIN"                             { return (STARTMAIN); }
"ENDMAIN"                               { return (ENDMAIN); }
"PRINT"                                 { return (PRINT); }
"RETURN"                                { return (RETURN); }
"STRUCT"                                { return (STRUCT); }
"ENDSTRUCT"                             { return (ENDSTRUCT); }
"TYPEDEF"                               { return (TYPEDEF); }
"()"                                    { return (ARGS); }
":"                                     { return (DELI); }
"."                                     { return (DOT); }
"IF"                                    { return (IF); }
"ELSEIF"                                { return (ELSEIF); }
"ELSE"                                  { return (ELSE); }
"ENDIF"                                 { return (ENDIF); }
"THEN"                                  { return (THEN);}
"SWITCH"                                { return (SWITCH);}
"CASE"                                  { return (CASE);}
"DEFAULT"                               { return (DEFAULT);}
"ENDSWITCH"                             { return (ENDSWITCH);}
"<"|">"|"=="|"!="                       { return (TESTOP); }
"FOR"                                   { return (FOR); }
"ENDFOR"                                { return (ENDFOR); }
"STEP"                                  { return (STEP); }
"TO"                                    { return (TO); }
"WHILE"                                 { return (WHILE); }
"ENDWHILE"                              { return (ENDWHILE); }
"||"                                    { return (OR); }
"&&"                                    { return (AND); }
"("                                     { return (LEFT_PAR); }
")"                                     { return (RIGHT_PAR); }
"{"                                     { return (LEFT_C_BRA); }
"}"                                     { return (RIGHT_C_BRA); }
"["                                     { return (LEFT_BRA); }
"]"                                     { return (RIGHT_BRA); }
";"                                     { return (SEM); }
","                                     { return (COMMA); }
"CHAR"                                  { return (CHAR); }
"BREAK"                                 { return (BREAK); }
{NUMBERS}                               { yylval.i = atoi(yytext); return INT; }
{COMMENT}                               { return (TYPE_COMMENT); }
{NAME}                                  { yylval.a = yytext; return NAME; }
{SUMOP}                                 { return (SUMOP); }
{MULOP}                                 { return (MULOP); }
{MARKS}                                 { return (MARKS); }
"\n"|"\r\n"                             { return (NEWLINE); }
"\t"|"  "|"    "                        { return (INDENT); }
.                                       { showError(); }
"/*"                                    {BEGIN(MULTILINE_COMMENT);}
<MULTILINE_COMMENT>\n|\r\n|\r            {lineno++;}
<MULTILINE_COMMENT>.                     {}
<MULTILINE_COMMENT>"*/"                  {BEGIN(INITIAL);}

%%

void showError() {
    // printf("Unrecognized token\n");
}