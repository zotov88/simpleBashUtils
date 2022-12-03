#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <getopt.h>
#include <regex.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int counterOfFiles;
  int counterOfStringsFromFile;
  int conformity;
  int NONconformity;
  bool c;
  bool e;
  bool f;
  bool h;
  bool i;
  bool l;
  bool n;
  bool o;
  bool s;
  bool v;
} Flags;

void parcerArguments(Flags *flags, int argc, char **argv, char **template);
int emptyEandF(Flags *config);
void checkPriorityFlags(Flags *flags);
void printData(Flags flags, char *fileName, char *template);
void handlerSelection(Flags *flags, char *str, char *template, char *fileName);
void handlerH(Flags *flags, char *fileName);
void handlerN(Flags *flags);
void handlerC(Flags flags, char *fileName);
void handlerF(Flags *flags, char **template, char *fileName);
void handlerO(Flags *flags, regex_t compile, char *str, char *fileName);
void decreaseLeft(regex_t compile, char *str, char *tmp);
void decreaseRight(regex_t compile, const char *str, char *tmp,
                   int *startIndex);
void tmpRemoveFromStr(char *str, char *tmp, const int *startIndex);
bool isHandlerLcompleted(Flags flags, char *fileName);
void getString(FILE *file, char **str, char *ch);
void *getMoreMemoryForString(void *line, int length);
void getOrAddTemplate(Flags *flags, char **template, char *argument,
                      bool *memberOfStruct);
int getTemplate(char **template, char *str);
void *getPtrOnCopyTmp(char **template, int length, char *toTemplate);
void addTemplate(char **template, char *str);

#endif  // SRC_GREP_S21_GREP_H_
