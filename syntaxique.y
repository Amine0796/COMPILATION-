%{
    int nb_ligne=1, col=1;
    char *nomfichier;
     #include <stdio.h>
   #include <stdlib.h>
%}

%union {
         int     entier;
         char*   str;
         float real;
}


%token IDF cst real mc_pgm mc_entier mc_real mc_char mc_logical mc_END mc_ENDR mc_routine mc_if mc_then mc_endif mc_else mc_dowhile mc_enddo mc_call mc_equi mc_read mc_write mc_Dim mc_or mc_and mc_sup mc_inf mc_supoueg mc_infoueg mc_noteg mc_eg moins division addition aff apost mult parou parfer pvg vergule quotte chaine LOGIC 

%start S
%%
S :ROUTINE PROGRAM  {printf("--------SYNTAXE CORRECTTTTTTTTTTTTTTTT----------"); 
YYACCEPT;} ; 
PROGRAM:mc_pgm IDF DEC INSTR mc_END;
ROUTINE:TYPER mc_routine IDF parou LISTE_PAR parfer DEC INSTR mc_ENDR ROUTINE 
|
;
TYPER:mc_entier | mc_real | mc_logical |mc_char ;
TYPE:mc_entier | mc_real | mc_logical ;
LISTE_VAR: VAR vergule LISTE_VAR | VAR ;
VAR: IDF| IDF parou cst parfer | IDF parou cst vergule cst parfer ;
LISTE_PAR: IDF vergule LISTE_PAR | IDF ;
DEC: TYPE LISTE_PAR pvg DEC 
|TYPE IDF mc_Dim parou cst parfer pvg DEC 
|TYPE IDF mc_Dim parou cst vergule cst parfer pvg DEC
|mc_char IDF mult cst pvg DEC
|
;
INSTR:CALL INSTR |EQUIVALENCE INSTR |E pvg INSTR|READ INSTR | WRITE pvg INSTR |AF pvg INSTR |IF INSTR|WHILE pvg INSTR   
| 
;
E:E OP A | A ;
A:A OPP B |B ;
B:parou E parfer|IDF |cst | real ;
OP: addition |moins ;
OPP : mult |division ; 
CALL: IDF aff mc_call IDF parou LISTE_PAR parfer pvg ;
EQUIVALENCE: mc_equi parou LISTE_VAR parfer vergule parou LISTE_VAR parfer pvg ;
READ: mc_read parou IDF parfer pvg;
WRITE: mc_write parou  chaine  parfer | mc_write parou chaine vergule IDF vergule chaine parfer  | mc_write parou chaine vergule IDF parfer  ;
AF: IDF aff apost IDF apost| IDF aff E | IDF aff LOGIC  ;
IF:mc_if parou CONDITION parfer mc_then INSTR mc_else INSTR mc_endif;
CONDITION:  SIMPLE  |  parou CONDITION parfer mc_and parou SIMPLE parfer |parou CONDITION parfer mc_or parou SIMPLE parfer  ;
SIMPLE: IDF COMPARAISON VAL  ;
VAL: IDF | cst | real | LOGIC | apost IDF apost |parou E parfer;
COMPARAISON: mc_sup | mc_supoueg | mc_eg | mc_noteg | mc_infoueg | mc_inf ;
WHILE: mc_dowhile parou CONDITION parfer INSTR mc_enddo ;





%%
main (int argc, char *argv[])
{
  nomfichier = argv[1];

    FILE *file = fopen(nomfichier, "r");
    if (file == NULL)
    {
        perror("Error opening file");
        return 1;
    }

   yyrestart(file);
   //************
   
   FinTabIDF();
   yyparse();
   afficher();
   fclose(file);
 }
 yywrap ()
 {}
 int yyerror ( char*  msg )  
 {
    printf ("file : %s Erreur Syntaxique a ligne %d a colonne %d \n",nomfichier,nb_ligne,col);
    exit(EXIT_FAILURE);
  }