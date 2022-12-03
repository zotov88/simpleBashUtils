TEMPLATE="[/a-s/2-6]"
TEMPLATE_FILE="./tests/template_file.txt"
TEST_FILE="./tests/7"
GREP="grep.txt"
S21_SREP="s21_grep.txt"

echo Testing file: ${TEST_FILE}

rm -r out
mkdir out

mkdir out/c
grep  -c ${TEMPLATE} ${TEST_FILE} > out/c/${GREP}
./s21_grep -c ${TEMPLATE} ${TEST_FILE} > out/c/s21_grep.txt
diff -s out/c/${GREP} out/c/${S21_SREP}

mkdir out/ce
grep  -ce ${TEMPLATE} ${TEST_FILE} > out/ce/${GREP}
./s21_grep -ce ${TEMPLATE} ${TEST_FILE} > out/ce/${S21_SREP}
diff -s out/ce/${GREP} out/ce/s21_grep.txt

mkdir out/cf
grep  -cf ${TEMPLATE_FILE} ${TEST_FILE} > out/cf/${GREP}
./s21_grep -cf ${TEMPLATE_FILE} ${TEST_FILE} > out/cf/${S21_SREP}
diff -s out/cf/${GREP} out/cf/${S21_SREP}

mkdir out/ch
grep  -ch ${TEMPLATE} ${TEST_FILE} > out/ch/${GREP}
./s21_grep -ch ${TEMPLATE} ${TEST_FILE} > out/ch/${S21_SREP}
diff -s out/ch/${GREP} out/ch/${S21_SREP}

mkdir out/cl
grep  -cl ${TEMPLATE} ${TEST_FILE} > out/cl/${GREP}
./s21_grep -cl ${TEMPLATE} ${TEST_FILE} > out/cl/${S21_SREP}
diff -s out/cl/${GREP} out/cl/${S21_SREP}

mkdir out/cn
grep  -cn ${TEMPLATE} ${TEST_FILE} > out/cn/${GREP}
./s21_grep -cn ${TEMPLATE} ${TEST_FILE} > out/cn/${S21_SREP}
diff -s out/cn/${GREP} out/cn/${S21_SREP}

mkdir out/co
grep  -co ${TEMPLATE} ${TEST_FILE} > out/co/${GREP}
./s21_grep -co ${TEMPLATE} ${TEST_FILE} > out/co/${S21_SREP}
diff -s out/co/${GREP} out/co/${S21_SREP}

mkdir out/cs
grep  -cs ${TEMPLATE} ${TEST_FILE} > out/cs/${GREP}
./s21_grep -cs ${TEMPLATE} ${TEST_FILE} > out/cs/${S21_SREP}
diff -s out/cs/${GREP} out/cs/${S21_SREP}

mkdir out/e
grep  -e ${TEMPLATE} -e ${TEMPLATE_FILE} ${TEST_FILE} > out/e/${GREP}
./s21_grep -e ${TEMPLATE} -e ${TEMPLATE_FILE} ${TEST_FILE} > out/e/${S21_SREP}
diff -s out/e/${GREP} out/e/${S21_SREP}

mkdir out/f
grep  -f ${TEMPLATE_FILE} s21_grep.c s21_grep.h > out/f/${GREP}
./s21_grep -f ${TEMPLATE_FILE} s21_grep.c s21_grep.h > out/f/${S21_SREP}
diff -s out/f/${GREP} out/f/${S21_SREP}

mkdir out/fe
grep  -f ${TEMPLATE_FILE} -e ${TEMPLATE} ${TEST_FILE} > out/fe/${GREP}
./s21_grep -f ${TEMPLATE_FILE} -e ${TEMPLATE} ${TEST_FILE} > out/fe/${S21_SREP}
diff -s out/fe/${GREP} out/fe/${S21_SREP}

mkdir out/h
grep  -h if ${TEST_FILE} s21_grep.h > out/h/${GREP}
./s21_grep -h if ${TEST_FILE} s21_grep.h > out/h/${S21_SREP}
diff -s out/h/${GREP} out/h/${S21_SREP}	

mkdir out/he
grep  -he ${TEMPLATE} ${TEST_FILE} > out/he/${GREP}
./s21_grep -he ${TEMPLATE} ${TEST_FILE} > out/he/${S21_SREP}
diff -s out/he/${GREP} out/he/${S21_SREP}

mkdir out/hf
grep  -hf ${TEMPLATE_FILE} ${TEST_FILE} > out/hf/${GREP}
./s21_grep -hf ${TEMPLATE_FILE} ${TEST_FILE} > out/hf/${S21_SREP}
diff -s out/hf/${GREP} out/hf/${S21_SREP}

mkdir out/ho
grep  -ho ${TEMPLATE} ${TEST_FILE} > out/ho/${GREP}
./s21_grep -ho ${TEMPLATE} ${TEST_FILE} > out/ho/${S21_SREP}
diff -s out/ho/${GREP} out/ho/${S21_SREP}

mkdir out/hs
grep  -hs ${TEMPLATE} ${TEST_FILE} > out/hs/${GREP}
./s21_grep -hs ${TEMPLATE} ${TEST_FILE} > out/hs/${S21_SREP}
diff -s out/hs/${GREP} out/hs/${S21_SREP}

mkdir out/i
grep  -i RY ${TEST_FILE} > out/i/${GREP}
./s21_grep -i RY ${TEST_FILE} > out/i/${S21_SREP}
diff -s out/i/${GREP} out/i/${S21_SREP}

mkdir out/ic
grep  -ic ${TEMPLATE} ${TEST_FILE} > out/ic/${GREP}
./s21_grep -ic ${TEMPLATE} ${TEST_FILE} > out/ic/${S21_SREP}
diff -s out/ic/${GREP} out/ic/${S21_SREP}

mkdir out/ie
grep  -ie ${TEMPLATE} ${TEST_FILE} > out/ie/${GREP}
./s21_grep -ie ${TEMPLATE} ${TEST_FILE} > out/ie/${S21_SREP}
diff -s out/ie/${GREP} out/ie/${S21_SREP}

mkdir out/ih
grep  -ih ${TEMPLATE} ${TEST_FILE} > out/ih/${GREP}
./s21_grep -ih ${TEMPLATE} ${TEST_FILE} > out/ih/${S21_SREP}
diff -s out/ih/${GREP} out/ih/${S21_SREP}

mkdir out/il
grep  -il ${TEMPLATE} ${TEST_FILE} > out/il/${GREP}
./s21_grep -il ${TEMPLATE} ${TEST_FILE} > out/il/${S21_SREP}
diff -s out/il/${GREP} out/il/${S21_SREP}

mkdir out/in
grep  -in ${TEMPLATE} ${TEST_FILE} > out/in/${GREP}
./s21_grep -in ${TEMPLATE} ${TEST_FILE} > out/in/${S21_SREP}
diff -s out/in/${GREP} out/in/${S21_SREP}

mkdir out/io
grep  -io ${TEMPLATE} ${TEST_FILE} > out/io/${GREP}
./s21_grep -io ${TEMPLATE} ${TEST_FILE} > out/io/${S21_SREP}
diff -s out/io/${GREP} out/io/${S21_SREP}

mkdir out/is
grep  -is ${TEMPLATE} ${TEST_FILE} > out/is/${GREP}
./s21_grep -is ${TEMPLATE} ${TEST_FILE} > out/is/${S21_SREP}
diff -s out/is/${GREP} out/is/${S21_SREP}

mkdir out/iv
grep  -iv ${TEMPLATE} ${TEST_FILE} > out/iv/${GREP}
./s21_grep -iv ${TEMPLATE} ${TEST_FILE} > out/iv/${S21_SREP}
diff -s out/iv/${GREP} out/iv/${S21_SREP}

mkdir out/l
grep  -l ${TEMPLATE} ${TEST_FILE} > out/l/${GREP}
./s21_grep -l ${TEMPLATE} ${TEST_FILE} > out/l/${S21_SREP}
diff -s out/l/${GREP} out/l/${S21_SREP}

mkdir out/le
grep -le ${TEMPLATE} ${TEST_FILE} > out/le/${GREP}
./s21_grep -le ${TEMPLATE} ${TEST_FILE} > out/le/${S21_SREP}
diff -s out/le/${GREP} out/le/${S21_SREP}

mkdir out/lf
grep -lf ${TEMPLATE_FILE} ${TEST_FILE} > out/lf/${GREP}
./s21_grep -lf ${TEMPLATE_FILE} ${TEST_FILE} > out/lf/${S21_SREP}
diff -s out/lf/${GREP} out/lf/${S21_SREP}

mkdir out/lh
grep -lh ${TEMPLATE} ${TEST_FILE} > out/lh/${GREP}
./s21_grep -lh ${TEMPLATE} ${TEST_FILE} > out/lh/${S21_SREP}
diff -s out/lh/${GREP} out/lh/${S21_SREP}

mkdir out/ln
grep  -ln ${TEMPLATE} ${TEST_FILE} > out/ln/${GREP}
./s21_grep -ln ${TEMPLATE} ${TEST_FILE} > out/ln/${S21_SREP}
diff -s out/ln/${GREP} out/ln/${S21_SREP}

mkdir out/lo
grep  -lo ${TEMPLATE} ${TEST_FILE} > out/lo/${GREP}
./s21_grep -lo ${TEMPLATE} ${TEST_FILE} > out/lo/${S21_SREP}
diff -s out/lo/${GREP} out/lo/${S21_SREP}

mkdir out/ls
grep  -ls ${TEMPLATE} ${TEST_FILE} > out/ls/${GREP}
./s21_grep -ls ${TEMPLATE} ${TEST_FILE} > out/ls/${S21_SREP}
diff -s out/ls/${GREP} out/ls/${S21_SREP}

mkdir out/n
grep  -n ${TEMPLATE} ${TEST_FILE} > out/n/${GREP}
./s21_grep -n ${TEMPLATE} ${TEST_FILE} > out/n/${S21_SREP}
diff -s out/n/${GREP} out/n/${S21_SREP}

mkdir out/ne
grep  -ne ${TEMPLATE} ${TEST_FILE} > out/ne/${GREP}
./s21_grep -ne ${TEMPLATE} ${TEST_FILE} > out/ne/${S21_SREP}
diff -s out/ne/${GREP} out/ne/${S21_SREP}

mkdir out/nf
grep  -nf ${TEMPLATE_FILE} ${TEST_FILE} > out/nf/${GREP}
./s21_grep -nf ${TEMPLATE_FILE} ${TEST_FILE} > out/nf/${S21_SREP}
diff -s out/nf/${GREP} out/nf/${S21_SREP}

mkdir out/nh
grep  -nh ${TEMPLATE} ${TEST_FILE} > out/nh/${GREP}
./s21_grep -nh ${TEMPLATE} ${TEST_FILE} > out/nh/${S21_SREP}
diff -s out/nh/${GREP} out/nh/${S21_SREP}

mkdir out/no
grep -no ${TEMPLATE} ${TEST_FILE} > out/no/${GREP}
./s21_grep -no ${TEMPLATE} ${TEST_FILE} > out/no/${S21_SREP}
diff -s out/no/${GREP} out/no/${S21_SREP}

mkdir out/ns
grep -ns ${TEMPLATE} ${TEST_FILE} > out/ns/${GREP}
./s21_grep -ns ${TEMPLATE} ${TEST_FILE} > out/ns/${S21_SREP}
diff -s out/ns/${GREP} out/ns/${S21_SREP}

mkdir out/o
grep  -o ${TEMPLATE} ${TEST_FILE} > out/o/${GREP}
./s21_grep -o ${TEMPLATE} ${TEST_FILE} > out/o/${S21_SREP}
diff -s out/o/${GREP} out/o/${S21_SREP}

mkdir out/oe
grep  -oe ${TEMPLATE} ${TEST_FILE} > out/oe/${GREP}
./s21_grep -oe ${TEMPLATE} ${TEST_FILE} > out/oe/${S21_SREP}
diff -s out/oe/${GREP} out/oe/${S21_SREP}

mkdir out/se
grep  -se ${TEMPLATE} ${TEST_FILE} > out/se/${GREP}
./s21_grep -se ${TEMPLATE} ${TEST_FILE} > out/se/${S21_SREP}
diff -s out/se/${GREP} out/se/${S21_SREP}

mkdir out/v
grep  -v ${TEMPLATE} ${TEST_FILE} > out/v/${GREP}
./s21_grep -v ${TEMPLATE} ${TEST_FILE} > out/v/${S21_SREP}
diff -s out/v/${GREP} out/v/${S21_SREP}

mkdir out/vc
grep  -vc ${TEMPLATE} ${TEST_FILE} > out/vc/${GREP}
./s21_grep -vc ${TEMPLATE} ${TEST_FILE} > out/vc/${S21_SREP}
diff -s out/vc/${GREP} out/vc/${S21_SREP}

mkdir out/ve
grep  -ve ${TEMPLATE} ${TEST_FILE} > out/ve/${GREP}
./s21_grep -ve ${TEMPLATE} ${TEST_FILE} > out/ve/${S21_SREP}
diff -s out/ve/${GREP} out/ve/${S21_SREP}

mkdir out/vf
grep  -vf ${TEMPLATE_FILE} ${TEST_FILE} > out/vf/${GREP}
./s21_grep -vf ${TEMPLATE_FILE} ${TEST_FILE} > out/vf/${S21_SREP}
diff -s out/vf/${GREP} out/vf/${S21_SREP}

mkdir out/vh
grep  -vh ${TEMPLATE} ${TEST_FILE} > out/vh/${GREP}
./s21_grep -vh ${TEMPLATE} ${TEST_FILE} > out/vh/${S21_SREP}
diff -s out/vh/${GREP} out/vh/${S21_SREP}

mkdir out/vl
grep  -vl ${TEMPLATE} ${TEST_FILE} > out/vh/${GREP}
./s21_grep -vl ${TEMPLATE} ${TEST_FILE} > out/vh/${S21_SREP}
diff -s out/vh/${GREP} out/vh/${S21_SREP}

mkdir out/vl2
grep -vl 1 ${TEST_FILE} > out/vl2/${GREP}
./s21_grep -vl 1 ${TEST_FILE} > out/vl2/${S21_SREP}
diff -s out/vl2/${GREP} out/vl2/${S21_SREP}

mkdir out/vn
grep -vn ${TEMPLATE} ${TEST_FILE} > out/vn/${GREP}
./s21_grep -vn ${TEMPLATE} ${TEST_FILE} > out/vn/${S21_SREP}
diff -s out/vn/${GREP} out/vn/${S21_SREP}

mkdir out/vo
grep -vo ${TEMPLATE} ${TEST_FILE} > out/vo/${GREP}
./s21_grep -vo ${TEMPLATE} ${TEST_FILE} > out/vo/${S21_SREP}
diff -s out/vo/${GREP} out/vo/${S21_SREP}

mkdir out/vs
grep -vs ${TEMPLATE} ${TEST_FILE} > out/vs/${GREP}
./s21_grep -vs ${TEMPLATE} ${TEST_FILE} > out/vs/${S21_SREP}
diff -s out/vs/${GREP} out/vs/${S21_SREP}

