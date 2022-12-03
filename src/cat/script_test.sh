FILE="./tests/5.txt"

echo Тестируется файл: $FILE

if [ ! -f $FILE ]; then
    echo "File not found!"
else
    rm -r out
    mkdir out

    mkdir out/b
    ./s21_cat -b $FILE > out/b/out_21_cat.txt
    cat -b $FILE > out/b/out_cat.txt
    diff -s out/b/out_21_cat.txt out/b/out_cat.txt

    mkdir out/number-nonblank
    ./s21_cat --number-nonblank $FILE > out/number-nonblank/out_21_cat.txt
    cat --number-nonblank $FILE > out/number-nonblank/out_cat.txt
    diff -s out/number-nonblank/out_21_cat.txt out/number-nonblank/out_cat.txt

    mkdir out/e
    ./s21_cat -e $FILE > out/e/out_21_cat.txt
    cat -e $FILE > out/e/out_cat.txt
    diff -s out/e/out_21_cat.txt out/e/out_cat.txt

    mkdir out/E
    ./s21_cat -E $FILE > out/E/out_21_cat.txt
    cat -E $FILE > out/E/out_cat.txt
    diff -s out/E/out_21_cat.txt out/E/out_cat.txt

    mkdir out/number
    ./s21_cat --number $FILE > out/number/out_21_cat.txt
    cat --number $FILE > out/number/out_cat.txt
    diff -s out/number/out_21_cat.txt out/number/out_cat.txt

    mkdir out/n
    ./s21_cat -n $FILE > out/n/out_21_cat.txt
    cat -n $FILE > out/n/out_cat.txt
    diff -s out/n/out_21_cat.txt out/n/out_cat.txt

    mkdir out/s
    ./s21_cat -s $FILE > out/s/out_21_cat.txt
    cat -s $FILE > out/s/out_cat.txt
    diff -s out/s/out_21_cat.txt out/s/out_cat.txt

    mkdir out/squeeze-blank
    ./s21_cat --squeeze-blank $FILE > out/squeeze-blank/out_21_cat.txt
    cat --squeeze-blank $FILE > out/squeeze-blank/out_cat.txt
    diff -s out/squeeze-blank/out_21_cat.txt out/squeeze-blank/out_cat.txt

    mkdir out/t
    ./s21_cat -t $FILE > out/t/out_21_cat.txt
    cat -t $FILE > out/t/out_cat.txt
    diff -s out/t/out_21_cat.txt out/t/out_cat.txt

    mkdir out/T
    ./s21_cat -T $FILE > out/T/out_21_cat.txt
    cat -T $FILE > out/T/out_cat.txt
    diff -s out/T/out_21_cat.txt out/T/out_cat.txt

	mkdir out/be
    ./s21_cat -b -e $FILE > out/be/out_21_cat.txt
    cat -b -e $FILE > out/be/out_cat.txt
    diff -s out/be/out_21_cat.txt out/be/out_cat.txt

	mkdir out/bn
    ./s21_cat -b -n $FILE > out/bn/out_21_cat.txt
    cat -b -n $FILE > out/bn/out_cat.txt
    diff -s out/bn/out_21_cat.txt out/bn/out_cat.txt

	mkdir out/bs
    ./s21_cat -b -s $FILE > out/bs/out_21_cat.txt
    cat -b -s $FILE > out/bs/out_cat.txt
    diff -s out/bs/out_21_cat.txt out/bs/out_cat.txt

	mkdir out/bt
    ./s21_cat -b -t $FILE > out/bt/out_21_cat.txt
    cat -b -t $FILE > out/bt/out_cat.txt
    diff -s out/bt/out_21_cat.txt out/bt/out_cat.txt

	mkdir out/en
    ./s21_cat -e -n $FILE > out/en/out_21_cat.txt
    cat -e -n $FILE > out/en/out_cat.txt
    diff -s out/en/out_21_cat.txt out/en/out_cat.txt

	mkdir out/es
    ./s21_cat -e -s $FILE > out/es/out_21_cat.txt
    cat -e -s $FILE > out/es/out_cat.txt
    diff -s out/es/out_21_cat.txt out/es/out_cat.txt

	mkdir out/et
    ./s21_cat -e -t $FILE > out/et/out_21_cat.txt
    cat -e -t $FILE > out/et/out_cat.txt
    diff -s out/et/out_21_cat.txt out/et/out_cat.txt

	mkdir out/ns
    ./s21_cat -n -s $FILE > out/ns/out_21_cat.txt
    cat -n -s $FILE > out/ns/out_cat.txt
    diff -s out/ns/out_21_cat.txt out/ns/out_cat.txt

	mkdir out/nt
    ./s21_cat -n -t $FILE > out/nt/out_21_cat.txt
    cat -n -t $FILE > out/nt/out_cat.txt
    diff -s out/nt/out_21_cat.txt out/nt/out_cat.txt

	mkdir out/st
    ./s21_cat -s -t $FILE > out/st/out_21_cat.txt
    cat -s -t $FILE > out/st/out_cat.txt
    diff -s out/st/out_21_cat.txt out/st/out_cat.txt

    mkdir out/tsenb
    ./s21_cat -t -s -e -n -b $FILE > out/tsenb/out_21_cat.txt
    cat -t -s -e -n -b $FILE > out/tsenb/out_cat.txt
    diff -s out/tsenb/out_21_cat.txt out/tsenb/out_cat.txt

fi






