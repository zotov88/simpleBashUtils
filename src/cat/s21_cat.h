#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  char *files[50];
  int length;
} ArrayOfFiles;

typedef struct {
  int printN;
  int countB;
  int countNewLineSym;
  int lockPrint;
  int numberFiles;
  int symbol;
  int firstNotNewLineSymInFile;
  int lock;
  char previousSym;
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} Flags;

int getFlagsAndFiles(int countOfArgs, char **str, Flags *flags,
                     ArrayOfFiles *arrayOfFiles);
int checkFlags(Flags *flags, char **str, int *status, const int *index);
void activationFlags(Flags *flags, int index);
FILE *printData(Flags *flags, FILE *file);
void handlerS(Flags *flags, char ch);
void handlerN(Flags *flags, char ch);
void handlerB(Flags *flags, char ch);
void handlerV(char *ch);
void handlerT(char *ch);
void checkAfterCycle(Flags *flags);

#endif  // SRC_CAT_S21_CAT_H_
