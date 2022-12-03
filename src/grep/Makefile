FLAGS = -Wall -Wextra -Werror

all: s21_grep

s21_grep:  s21_grep.h s21_grep.c
	gcc $(FLAGS) s21_grep.c -o s21_grep

rebuild:
	make clean
	make all

check_style:
	clang-format -style=Google -n *.c
	clang-format -style=Google -n *.h

correct_style:
	clang-format -style=Google -i *.c
	clang-format -style=Google -i *.h

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c
	cppcheck --enable=all --suppress=missingIncludeSystem *.h

cpplint:
	python3 cpplint.py --extensions=c *.c
	python3 cpplint.py --extensions=c *.h

all_check:
	make check_style
	make cppcheck
	make cpplint

clean:
	rm -f s21_cat s21_grep
