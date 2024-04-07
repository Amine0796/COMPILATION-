/****************CREATION DE LA TABLE DES SYMBOLES ******************/
/***Step 1: Definition des structures de données ***/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
  int state;
  char name[20];
  char code[20];
  char type[20];
  float val;
} element;

typedef struct tabIDF
{
  element elm;
  struct tabIDF *suiv;
} tabIDF;

typedef struct
{
  int state;
  char name[20];
  char type[20];
} elt;

typedef struct tabSepMc
{
  elt elm;
  struct tabSepMc *suiv;
} tabSepMc;

tabIDF *tab = NULL;
tabSepMc *tabSeparateur = NULL;
tabSepMc *tabMotCle = NULL;
extern char sav[20];

/***Step 2: initialisation de l'état des cases des tables des symbloles***/

tabIDF *FinTabIDF()
{
  tabIDF *courant = tab;
  while (courant != NULL && courant->suiv != NULL)
  {
    courant = courant->suiv;
  }
  return courant;
}
tabSepMc *FinTabSepMc(int selectTAB)
{
  tabSepMc *courant = NULL;
  if (selectTAB == 0)
  {
    courant = tabSeparateur;
  }
  else if (selectTAB == 1)
  {
    courant = tabMotCle;
  }
  while (courant != NULL && courant->suiv != NULL)
  {
    courant = courant->suiv;
  }
  return courant;
}

/***Step 3: insertion des entititees lexicales dans les tables des symboles ***/

void inserer(char entite[], char code[], char type[], float val, int i, int y)
{
  switch (y)
  {
  case 0:
  {
    // Insertion dans la table des IDF et CONST
    tabIDF *newIDF = (tabIDF *)malloc(sizeof(tabIDF));
    newIDF->elm.state = 1;
    strcpy(newIDF->elm.name, entite);
    strcpy(newIDF->elm.code, code);
    strcpy(newIDF->elm.type, type);
    newIDF->elm.val = val;
    newIDF->suiv = NULL;
    tabIDF *lastElement = FinTabIDF();
    if (lastElement != NULL)
    {
      lastElement->suiv = newIDF;
    }
    else
    {
      tab = newIDF;
    }

    break;
  }
  case 1:
  {
    // Insertion dans la table des mots clés
    tabSepMc *newSM = (tabSepMc *)malloc(sizeof(tabSepMc));
    newSM->elm.state = 1;
    strcpy(newSM->elm.name, entite);
    strcpy(newSM->elm.type, code);
    newSM->suiv = NULL;
    tabSepMc *lastElement = FinTabSepMc(1);
    if (lastElement != NULL)
    {
      lastElement->suiv = newSM;
    }
    else
    {
      tabMotCle = newSM;
    }

    break;
  }
  case 2:
  {
    // Insertion dans la table des séparateurs
    tabSepMc *newSM = (tabSepMc *)malloc(sizeof(tabSepMc));
    newSM->elm.state = 1;
    strcpy(newSM->elm.name, entite);
    strcpy(newSM->elm.type, code);
    newSM->suiv = NULL;
    tabSepMc *lastElement = FinTabSepMc(0);
    if (lastElement != NULL)
    {
      lastElement->suiv = newSM;
    }
    else
    {
      tabSeparateur = newSM;
    }
    break;
  }
  }
}

/***Step 4: La fonction Rechercher permet de verifier  si l'entité existe dèja dans la table des symboles */
void rechercher(char entite[], char code[], char type[], float val, int y)
{

  int j, i;
  tabIDF *courant = tab;
  tabSepMc *courantM = tabMotCle;
  tabSepMc *courantS = tabSeparateur;
  switch (y)
  {
  case 0: /*verifier si la case dans la tables des IDF et CONST est libre*/

    if(strcmp("IDF", code) == 0){
        while (courant != NULL)
          {
            if((strcmp(entite, courant->elm.name) == 0)){
              break;
            }
            courant = courant->suiv;
          }

          if (courant == NULL)
          {
            inserer(entite, code, type, val, 0, y);
          }  
    }else{
      while (courant != NULL)
          {
            courant = courant->suiv;
          }
          
          if (courant == NULL)
          {
            inserer(entite, code, type, val , 0, y);
          }  
    }

    // else
    // printf("entité existe déjà\n");
    break;

  case 1: /*verifier si la case dans la tables des mots clés est libre*/



    while (courantM != NULL && (courantM->elm.state == 1) && (strcmp(entite, courantM->elm.name) != 0))
    {
      courantM = courantM->suiv;
    }
    if (courantM == NULL)
    {
      inserer(entite, code, type, val, 0, y);
    }
    // else
    // printf("entité existe déjà\n");
    break;

  case 2: /*verifier si la case dans la tables des séparateurs est libre*/
   
    while (courantS != NULL && (courantS->elm.state == 1) && (strcmp(entite, courantS->elm.name) != 0))
    {
      courantS = courantS->suiv;
    }

    if (courantS == NULL)
    {
      inserer(entite, code, type, val, 0, y);
    }
    // else
    // printf("entité existe déjà\n");
    break;

  }
}


void afficher()
{
  printf("/***************Table des symboles IDF*************/\n");
  printf("_________________________________________________________________________\n");
  printf("\t| Nom_Entite  |  Code_Entite   | Type_Entite  | Val_Entite      |\n");
  printf("_________________________________________________________________________\n");

  tabIDF *currentIDF = tab;
  while (currentIDF != NULL)
  {
    printf("\t|%12s |%15s | %12s | %12f |\n", currentIDF->elm.name, currentIDF->elm.code, currentIDF->elm.type, currentIDF->elm.val);
    currentIDF = currentIDF->suiv;
  }

  printf("\n***************Table des symboles mots cles*************\n");
  printf("_____________________________________\n");
  printf("\t| NomEntite  |  CodeEntite | \n");
  printf("_____________________________________\n");

  tabSepMc *courantM = tabMotCle;
  while (courantM != NULL)
  {
    printf("\t|%11s |%12s | \n", courantM->elm.name, courantM->elm.type);
    courantM = courantM->suiv;
  }

  printf("\n***************Table des symboles separateurs*************\n");
  printf("_____________________________________\n");
  printf("\t| NomEntite  |  CodeEntite | \n");
  printf("_____________________________________\n");

  tabSepMc *courantS = tabSeparateur;
  while (courantS != NULL)
  {
    printf("\t|%11s |%12s | \n", courantS->elm.name, courantS->elm.type);
    courantS = courantS->suiv;
  }
}

