/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VARS = 258,
    PROGRAM = 259,
    FUNCTION = 260,
    END_FUNCTION = 261,
    STARTMAIN = 262,
    ENDMAIN = 263,
    RETURN = 264,
    ARGS = 265,
    DELI = 266,
    DOT = 267,
    TEST = 268,
    TESTOP = 269,
    FOR = 270,
    WHILE = 271,
    OR = 272,
    AND = 273,
    LEFT_PAR = 274,
    RIGHT_PAR = 275,
    LEFT_C_BRA = 276,
    RIGHT_C_BRA = 277,
    LEFT_BRA = 278,
    RIGHT_BRA = 279,
    THEN = 280,
    TEST2 = 281,
    INT = 282,
    NAME = 283,
    TYPE_COMMENT = 284,
    ASSIGNOP = 285,
    SEM = 286,
    COMMA = 287,
    CHAR = 288,
    BREAK = 289,
    OP = 290,
    NEWLINE = 291,
    INDENT = 292,
    INTEGER = 293,
    IF = 294,
    ELSE = 295,
    ENDIF = 296,
    ENDWHILE = 297,
    CHARACTER = 298,
    STRING_LITERAL = 299,
    SUMOP = 300,
    MULOP = 301,
    TO = 302,
    ENDFOR = 303,
    STEP = 304,
    ELSEIF = 305,
    SWITCH = 306,
    CASE = 307,
    DEFAULT = 308,
    ENDSWITCH = 309,
    PRINT = 310,
    MARKS = 311,
    STRUCT = 312,
    ENDSTRUCT = 313,
    TYPEDEF = 314
  };
#endif
/* Tokens.  */
#define VARS 258
#define PROGRAM 259
#define FUNCTION 260
#define END_FUNCTION 261
#define STARTMAIN 262
#define ENDMAIN 263
#define RETURN 264
#define ARGS 265
#define DELI 266
#define DOT 267
#define TEST 268
#define TESTOP 269
#define FOR 270
#define WHILE 271
#define OR 272
#define AND 273
#define LEFT_PAR 274
#define RIGHT_PAR 275
#define LEFT_C_BRA 276
#define RIGHT_C_BRA 277
#define LEFT_BRA 278
#define RIGHT_BRA 279
#define THEN 280
#define TEST2 281
#define INT 282
#define NAME 283
#define TYPE_COMMENT 284
#define ASSIGNOP 285
#define SEM 286
#define COMMA 287
#define CHAR 288
#define BREAK 289
#define OP 290
#define NEWLINE 291
#define INDENT 292
#define INTEGER 293
#define IF 294
#define ELSE 295
#define ENDIF 296
#define ENDWHILE 297
#define CHARACTER 298
#define STRING_LITERAL 299
#define SUMOP 300
#define MULOP 301
#define TO 302
#define ENDFOR 303
#define STEP 304
#define ELSEIF 305
#define SWITCH 306
#define CASE 307
#define DEFAULT 308
#define ENDSWITCH 309
#define PRINT 310
#define MARKS 311
#define STRUCT 312
#define ENDSTRUCT 313
#define TYPEDEF 314

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 25 "c.y" /* yacc.c:1909  */

    char *a;
    int i;

#line 177 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
