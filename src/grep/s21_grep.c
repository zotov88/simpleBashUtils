#include "s21_grep.h"

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("Usage: s21_grep [OPTION]... PATTERNS [FILE]...\n");
  } else {
    Flags flags = {0};
    char *template = NULL;
    parcerArguments(&flags, argc, argv, &template);
    int index = optind;
    while (index < argc) {
      printData(flags, argv[index++], template);
    }
    if (template != NULL) {
      free(template);
    }
  }
  return 0;
}

void parcerArguments(Flags *flags, int argc, char **argv, char **template) {
  int n;
  while ((n = getopt(argc, argv, "ce:f:hilnosv")) != -1) {
    switch (n) {
      case 'c':
        flags->c = true;
        break;
      case 'e':
        getOrAddTemplate(flags, template, optarg, &flags->e);
        break;
      case 'f':
        handlerF(flags, template, optarg);
        break;
      case 'h':
        flags->h = true;
        break;
      case 'i':
        flags->i = true;
        break;
      case 'l':
        flags->l = true;
        break;
      case 'n':
        flags->n = true;
        break;
      case 'o':
        flags->o = true;
        break;
      case 's':
        flags->s = true;
        break;
      case 'v':
        flags->v = true;
        break;
    }
  }
  checkPriorityFlags(flags);
  if (emptyEandF(flags)) {
    getTemplate(template, argv[optind++]);
  }
  flags->counterOfFiles = argc - optind;
}

int emptyEandF(Flags *config) { return !config->e && !config->f; }

void checkPriorityFlags(Flags *flags) {
  flags->o = (flags->c || flags->l) ? false : flags->o;
  flags->c = flags->l ? false : flags->c;
}

void printData(Flags flags, char *fileName, char *template) {
  FILE *file = fopen(fileName, "r");
  if (file != NULL) {
    char ch;
    while ((ch = getc(file)) != EOF) {
      char *str = calloc(128, sizeof(char));
      flags.counterOfStringsFromFile++;
      getString(file, &str, &ch);
      handlerSelection(&flags, str, template, fileName);
      free(str);
      if (isHandlerLcompleted(flags, fileName)) {
        break;
      }
    }
    if (flags.c) {
      handlerC(flags, fileName);
    }
    fclose(file);
  } else if (!flags.s) {
    fprintf(stderr, "s21_grep: %s: No such file or directory\n", fileName);
  }
}

void handlerSelection(Flags *flags, char *str, char *template, char *fileName) {
  regex_t compile;
  if (!regcomp(&compile, template, !flags->i ? REG_EXTENDED : REG_ICASE)) {
    int status = regexec(&compile, str, 0, NULL, 0);
    if (!status) {
      flags->conformity++;
    } else {
      flags->NONconformity++;
    }
    status += flags->v;
    if (status % 2 == 0 && !flags->c && !flags->l) {
      if (!flags->o) {
        handlerH(flags, fileName);
        handlerN(flags);
        printf("%s\n", str);
      } else {
        handlerO(flags, compile, str, fileName);
      }
    }
    regfree(&compile);
  }
}

void handlerH(Flags *flags, char *fileName) {
  if (flags->counterOfFiles > 1 && !flags->h) {
    printf("%s:", fileName);
  }
}

void handlerN(Flags *flags) {
  if (flags->n) {
    printf("%d:", flags->counterOfStringsFromFile);
  }
}

void handlerO(Flags *flags, regex_t compile, char *str, char *fileName) {
  while (!regexec(&compile, str, 0, NULL, 0)) {
    char *tmp = getPtrOnCopyTmp(&tmp, strlen(str) + 1, str);
    int startIndex = 0;
    decreaseLeft(compile, str, tmp);
    decreaseRight(compile, str, tmp, &startIndex);
    handlerH(flags, fileName);
    handlerN(flags);
    printf("%s\n", tmp);
    tmpRemoveFromStr(str, tmp, &startIndex);
    free(tmp);
  }
}

void decreaseLeft(regex_t compile, char *str, char *tmp) {
  int endIndex = strlen(str);
  while (!regexec(&compile, tmp, 0, NULL, 0)) {
    tmp[endIndex--] = '\0';
  }
  endIndex++;
  tmp[endIndex] = str[endIndex];
}

void decreaseRight(regex_t compile, const char *str, char *tmp,
                   int *startIndex) {
  int i;
  while (!regexec(&compile, tmp, 0, NULL, 0)) {
    (*startIndex)++;
    i = 0;
    while (tmp[i] != '\0') {
      tmp[i] = tmp[i + 1];
      i++;
    }
  }
  i = strlen(tmp);
  while (i != 0) {
    tmp[i] = tmp[i - 1];
    i--;
  }
  tmp[i] = str[--(*startIndex)];
}

void tmpRemoveFromStr(char *str, char *tmp, const int *startIndex) {
  int i = *startIndex + strlen(tmp);
  int j = i - *startIndex - strlen(tmp);
  while (str[i] != '\0') {
    str[j++] = str[i++];
  }
  str[j] = '\0';
}

void handlerC(Flags flags, char *fileName) {
  int result = flags.v ? flags.NONconformity : flags.conformity;
  printf("%s%s%d\n", (flags.counterOfFiles > 1) ? fileName : "",
         (flags.counterOfFiles > 1) ? ":" : "", result);
}

void handlerF(Flags *flags, char **template, char *fileName) {
  FILE *file = fopen(fileName, "r");
  if (file != NULL) {
    char ch;
    while ((ch = getc(file)) != EOF) {
      char *str = calloc(128, sizeof(char));
      getString(file, &str, &ch);
      getOrAddTemplate(flags, template, str, &flags->f);
      free(str);
    }
    fclose(file);
  } else if (!flags->s) {
    fprintf(stderr, "s21_grep: %s: No such file or directory\n", fileName);
  }
}

bool isHandlerLcompleted(Flags flags, char *fileName) {
  bool res = false;
  if (!flags.v) {
    if (flags.l && flags.conformity) {
      printf("%s\n", fileName);
      res = true;
    }
  } else if (flags.l && flags.NONconformity) {
    printf("%s\n", fileName);
    res = true;
  }
  return res;
}

void getString(FILE *file, char **str, char *ch) {
  int index = 0;
  while (*ch != '\n' && *ch != EOF) {
    *(*str + index++) = *ch;
    *ch = getc(file);
    *str =
        (index % 128 == 0) ? getMoreMemoryForString(*str, index + 128) : *str;
  }
  *(*str + index) = '\0';
}

void *getMoreMemoryForString(void *line, int length) {
  char *ptr = realloc(line, length);
  return ptr;
}

void getOrAddTemplate(Flags *flags, char **template, char *argument,
                      bool *memberOfStruct) {
  if (emptyEandF(flags)) {
    *memberOfStruct = getTemplate(template, argument) ? true : false;
  } else {
    addTemplate(template, argument);
  }
}

int getTemplate(char **template, char *str) {
  int length = strlen(str) + 1;
  template = getPtrOnCopyTmp(template, length, str);
  return template == NULL ? 0 : 1;
}

void *getPtrOnCopyTmp(char **template, int length, char *toTemplate) {
  *template = calloc(length, sizeof(char));
  if (*template != NULL) {
    strcpy(*template, toTemplate);
  }
  return *template;
}

void addTemplate(char **template, char *str) {
  int length = strlen(*template) + strlen(str) + 2;
  *template = getMoreMemoryForString(*template, length);
  if (*template) {
    strcat(strcat(*template, "|"), str);
  }
}
