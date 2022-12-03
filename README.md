# simpleBashUtils

<div align="center">PREVIEW_WILL_BE_ADDED_LATER.png</div>

---

Implementation of the SimpleBashUtils project as part of the School 21 educational project.

Utilities have been developed for the C programming languages Bash cat and grep.

The program can work with original flags and their combinations.

NOTE:

This program was tested on Linux Mint 21 operating system.

<details>
<summary>[ SPOILER ] Overview of implemented code</summary>

### s21_cat

TEMPLATE: `cat [OPTION] [FILE]`

| № | Option                                                      | Description                                  |
| --- | ----------------------------------------------------------- | -------------------------------------------- |
| 1   | -b (GNU: --number-nonblank)                                 | numbers only non-empty lines                 |
| 2   | -e подразумевает -v (только GNU: -E то же самое, но без -v) | but also display end-of-line characters as $ |
| 3   | -n (GNU: --number)                                          | number all output lines                      |
| 4   | -s (GNU: --squeeze-blank)                                   | squeeze multiple adjacent blank lines        |
| 5   | -t подразумевает -v (GNU: -T то же самое, но без -v)        | but also display tabs as ^I                  |

### s21_grep

TEMPLATE: `grep [OPTION] [TEMPLATE] [FILE]`

| № | Option  | Description                                                   |
| --- | ------- | ------------------------------------------------------------- |
| 1   | -e      | pattern                                                       |
| 2   | -i      | ignore uppercase vs. lowercase                                |
| 3   | -v      | invert match                                                  |
| 4   | -c      | output count of matching lines only.                          |
| 5   | -l      | output matching files only                                    |
| 6   | -n      | precede each matching line with a line number                 |
| 7   | -h      | output matching lines without preceding them by file names    |
| 8   | -s      | suppress error messages about nonexistent or unreadable files |
| 9   | -f file | take regexes from a file                                      |
| 10  | -o      | output the matched parts of a matching line                   |

</details>
