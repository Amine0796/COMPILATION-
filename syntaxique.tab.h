
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDF = 258,
     cst = 259,
     real = 260,
     mc_pgm = 261,
     mc_entier = 262,
     mc_real = 263,
     mc_char = 264,
     mc_logical = 265,
     mc_END = 266,
     mc_ENDR = 267,
     mc_routine = 268,
     mc_if = 269,
     mc_then = 270,
     mc_endif = 271,
     mc_else = 272,
     mc_dowhile = 273,
     mc_enddo = 274,
     mc_call = 275,
     mc_equi = 276,
     mc_read = 277,
     mc_write = 278,
     mc_Dim = 279,
     mc_or = 280,
     mc_and = 281,
     mc_sup = 282,
     mc_inf = 283,
     mc_supoueg = 284,
     mc_infoueg = 285,
     mc_noteg = 286,
     mc_eg = 287,
     moins = 288,
     division = 289,
     addition = 290,
     aff = 291,
     apost = 292,
     mult = 293,
     parou = 294,
     parfer = 295,
     pvg = 296,
     vergule = 297,
     quotte = 298,
     chaine = 299,
     LOGIC = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 8 "syntaxique.y"

         int     entier;
         char*   str;
         float real;



/* Line 1676 of yacc.c  */
#line 105 "syntaxique.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


