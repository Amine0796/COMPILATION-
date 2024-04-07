%{
   extern nb_ligne;
   extern col;
   extern char *nomfichier;
   #include "syntaxique.tab.h"
   #include "ts.h"
   #include <stdio.h>
   #include <stdlib.h>
   extern YYSTYPE yylval;
%}

lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
real {chiffre}+"."{chiffre}+
LOGIC "TRUE"|"FALSE"
cst {chiffre}+
chaine \"[^\"]*\"

%%

PROGRAM   { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_pgm\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_pgm; }
INTEGER   { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_entier\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_entier;}
REAL      {col=col+strlen(yytext);  printf (" L entite lexicale reconnue est : mc_real\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_real;}
CHARACTER { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_char\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_char;}
LOGICAL   { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_logical\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_logical;}
END       { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_END\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_END;}
ENDR      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_ENDR\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_ENDR;}
ROUTINE   { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_routine\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_routine;}
IF        {  col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_if\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_if;}
THEN      { col=col+strlen(yytext);  printf (" L entite lexicale reconnue est : mc_then\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_then;}
ENDIF     { col=col+strlen(yytext);  printf (" L entite lexicale reconnue est : mc_endif\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_endif;}
ELSE      {  col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_else\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_else;}
DOWHILE   { col=col+strlen(yytext);  printf (" L entite lexicale reconnue est : mc_dowhile\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_dowhile;}
ENDDO     { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_enddo\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_enddo;}
CALL      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_call\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_call;}
EQUIVALENCE { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_equi\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_equi;}
READ      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_read\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_read;}
WRITE     { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_write\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_write;}
DIMENSION { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_Dim\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_Dim;}
".OR."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_or\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_or;}
".AND."     { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_and\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_and;}
".GT."      { col=col+strlen(yytext); printf ("L entite lexicale reconnue est : mc_sup\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_sup;}
".LT."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_inf\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_inf;}
".GE."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_supoueg\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_supoueg;}
".LE."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_infoueg\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_infoueg;}
".NE."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_noteg\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_noteg;}
".EQ."      { col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mc_eg\n"); rechercher(yytext,"Mot cle",0,0,1); return mc_eg;}

"'"       { col = col + yyleng; printf("L'entite lexicale reconnue est apost : %s \n", yytext);  rechercher(yytext,"Separateur",0,0,2);return apost; }
"-"       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : moins\n"); rechercher(yytext,"Separateur",0,0,2); return moins;}
"/"       {col=col+strlen(yytext); printf ("L entite lexicale reconnue est : division\n"); rechercher(yytext,"Separateur",0,0,2); return division;}
"+"       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : addition\n"); rechercher(yytext,"Separateur",0,0,2); return addition;}
"="       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : aff\n"); rechercher(yytext,"Separateur",0,0,2); return aff;}
"*"       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : mult\n"); rechercher(yytext,"Separateur",0,0,2); return mult;}
"("       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : parou\n"); rechercher(yytext,"Separateur",0,0,2); return parou;}
")"       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : parfer\n"); rechercher(yytext,"Separateur",0,0,2); return parfer;}
";"       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : pvg\n"); rechercher(yytext,"Separateur",0,0,2); return pvg;}
","       {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : vergule\n"); rechercher(yytext,"Separateur",0,0,2); return vergule;}
"\""      {col=col+strlen(yytext); printf (" L entite lexicale reconnue est : quotte\n"); rechercher(yytext,"Separateur",0,0,2); return quotte;}
"%"[^\n]* /* Ignore les lignes commençant par % */


{LOGIC} {  printf (" L entite lexicale reconnue est : %s\n", yytext); return LOGIC; rechercher(yytext,"LOGICAL"," ",0,0);}
{IDF}     {
    col=col+strlen(yytext);
    rechercher(yytext,"IDF"," ",0,0); 
    if(yyleng>10)
        printf(" erreur lexical.l, in line %d caractere %d IDF>10\n",nb_ligne,col);
else
     printf (" L entite lexicale reconnue est : %s\n", yytext); return IDF; }

{cst}     {
    int x = atoi(yytext);  
    col=col+strlen(yytext);
      rechercher(yytext,"Cst entiere","integer",atof(yytext),0);
    if (x>32767 || x<-32768)
        printf("erreur lexical.l, a la ligne %d caractere %d, constant tres grand.\n",nb_ligne,col);
    else
        printf ("L entite lexicale reconnue est : %s\n", yytext); return cst;}

{real}    { 
    float y = atof(yytext);
        col=col+strlen(yytext);
         rechercher(yytext,"real","real",atof(yytext),0);
        if ((y>32767.32767 || y<-32768.32767) || ((y - floor(y))> 0.32767) )
            printf("erreur lexical.l, a la ligne %d caractere %d ,real tres grand.\n",nb_ligne,col);
        else
            printf ("L entite lexicale reconnue est : %s\n", yytext); return real; }

{chaine} {
    // Traitement pour les chaînes entre guillemets
    printf("Chaine entre guillemets : %s\n", yytext); return chaine; // Exemple d'action à effectuer
}

[ \t]    

\n        { nb_ligne++; col=1;}

. {col=col+strlen(yytext);
    printf (" fichier : %s erreur lexicale non reconnue a la ligne %d et colonne %d ", nomfichier,nb_ligne,col);}



