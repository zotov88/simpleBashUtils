FLAGS = -Wall -Wextra -Werror

all: s21_cat

s21_cat: Makefile s21_cat.h s21_cat.c
	gcc $(FLAGS) s21_cat.c -o s21_cat

check_style:
	clang-format -style=Google -n *.c
	clang-format -style=Google -n *.h

python:
	python3 cpplint.py --extensions=c *.c
	python3 cpplint.py --extensions=c *.h

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c
	cppcheck --enable=all --suppress=missingIncludeSystem *.h

correct_style:
	clang-format -style=Google -i *.c
	clang-format -style=Google -i *.h

cpplint:
	python3 cpplint.py --extensions=c *.c
	python3 cpplint.py --extensions=c *.h

all_check:
	make check_style
	make cppcheck
	make cpplint

clean:
	rm -f s21_cat s21_grep
