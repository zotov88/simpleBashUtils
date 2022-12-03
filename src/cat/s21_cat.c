#include "s21_cat.h"

int main(int argc, char **argv) {
  if (argc > 1) {
    Flags flags = {0};
    ArrayOfFiles arrayOfFiles = {0};
    if (getFlagsAndFiles(argc, argv, &flags, &arrayOfFiles)) {
      int i = 0;
      while (i < arrayOfFiles.length) {
        FILE *file = fopen(arrayOfFiles.files[i], "r");
        if (file != NULL) {
          fclose(printData(&flags, file));
        } else {
          fprintf(stderr, "s21_cat: %s: No such file or directory\n",
                  arrayOfFiles.files[i]);
        }
        i++;
      }
    }
  } else {
    printf("Usage: ./s21_grep [OPTION] [FILE]...\n");
  }
  return 0;
}

int getFlagsAndFiles(int countOfArgs, char **str, Flags *flags,
                     ArrayOfFiles *arrayOfFiles) {
  int status = 1, index = 1;
  while (index < countOfArgs) {
    if (str[index][0] == '-') {
      checkFlags(flags, str, &status, &index);
    } else {
      arrayOfFiles->files[arrayOfFiles->length] = str[index];
      arrayOfFiles->length++;
    }
    if (!status) {
      fprintf(stderr, "s21_cat: invalid option -- '%s'\n", str[index]);
      break;
    }
    index++;
  }
  return status;
}

int checkFlags(Flags *flags, char **str, int *status, const int *index) {
  *status = 0;
  char *options[11] = {"-b", "--number-nonblank",
                       "-s", "--squeeze-blank",
                       "-n", "--number",
                       "-T", "-v",
                       "-t", "-e",
                       "-E"};
  for (int i = 0; i < 11; i++) {
    if (!strcmp(str[*index], options[i])) {
      *status = 1;
      activationFlags(flags, i);
      break;
    }
  }
  return *status;
}

void activationFlags(Flags *flags, int index) {
  switch (index) {
    case 0 ... 1:
      flags->b = 1;
      flags->n = 0;
      break;
    case 2 ... 3:
      flags->s = 1;
      break;
    case 4 ... 5:
      flags->n = flags->b ? 0 : 1;
      if (flags->n) {
        flags->printN = 1;
      }
      break;
    case 6:
      flags->t = 1;
      break;
    case 7:
      flags->v = 1;
      break;
    case 8:
      flags->t = 1;
      flags->v = 1;
      break;
    case 9:
      flags->e = 1;
      flags->v = 1;
      break;
    case 10:
      flags->e = 1;
      break;
  }
}

FILE *printData(Flags *flags, FILE *file) {
  char ch;
  while ((ch = getc(file)) != EOF) {
    flags->lockPrint = 0;
    flags->symbol = (ch == '\n') ? 0 : 1;
    if (flags->s) {
      handlerS(flags, ch);
    }
    if (flags->n > 0) {
      handlerN(flags, ch);
    }
    if (flags->b > 0) {
      handlerB(flags, ch);
    }
    if (flags->v) {
      handlerV(&ch);
    }
    if (flags->t && ch == '\t') {
      handlerT(&ch);
    }
    if (flags->e && ch == '\n' && !flags->lockPrint) {
      printf("$");
    }
    if (ch != '\n') {
      flags->firstNotNewLineSymInFile = 1;
    }
    flags->lockPrint == 0 ? printf("%c", ch) : printf("%s", "");
    flags->previousSym = ch;
  }
  checkAfterCycle(flags);
  return file;
}

void handlerS(Flags *flags, char ch) {
  if (flags->countNewLineSym == 0 && ch == '\n') {
    flags->countNewLineSym++;
  } else if (flags->countNewLineSym > 0 && ch == '\n') {
    flags->countNewLineSym++;
    flags->lockPrint = 1;
  } else if (flags->countNewLineSym > 1 && ch != '\n' &&
             flags->firstNotNewLineSymInFile) {
    flags->countNewLineSym = 0;
    flags->e ? printf("$\n") : printf("\n");
    if (flags->n) {
      printf("%6d\t", flags->n++);
    }
  } else {
    flags->countNewLineSym = 0;
  }
}

void handlerN(Flags *flags, char ch) {
  if (flags->printN) {
    flags->printN = 0;
    printf("%6d\t", flags->n++);
  }
  if (ch == '\n' && !flags->lockPrint) {
    flags->printN = 1;
  }
}

void handlerB(Flags *flags, char ch) {
  if (flags->b == 1 && !flags->lock && flags->symbol) {
    flags->lock = 1;
    flags->countB++;
  }
  if (ch == '\n') {
    flags->countB++;
  }
  if (ch != '\n' && flags->countB != 0 && !flags->countNewLineSym) {
    flags->countB = 0;
    printf("%6d\t", flags->b++);
  }
}

void handlerV(char *ch) {
  if (*ch == 127 || (*ch < 32 && *ch != 9 && *ch != 10)) {
    printf("^");
    *ch = (*ch == 127) ? '?' : *ch + 64;
  }
}

void handlerT(char *ch) {
  *ch = 'I';
  printf("^");
}

void checkAfterCycle(Flags *flags) {
  if (flags->firstNotNewLineSymInFile) {
    if (flags->lockPrint) {
      if (flags->e && flags->previousSym == '\n') {
        printf("$");
      }
      printf("%c", '\n');
    }
  }
}
