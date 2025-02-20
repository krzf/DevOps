#/bin/bash
DIFF_RES=""
COUNT=0
SUCCESS_COUNT=0
FAIL_COUNT=0
isS()
{   (( COUNT++ ))
    if [ "$DIFF_RES" == "Files 1 and 2 are identical" ]
    then 
    (( SUCCESS_COUNT++ ))
    echo "FAIL"
    else
    (( FAIL_COUNT++ ))
    echo "SUCCESS"
    
    fi
}


./s21_grep "[0-9]" test1 > 1 
grep "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -e "[0-9]" test1 > 1 
grep -e "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -i "[0-9]" test1 > 1
grep -i "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -s "[0-9]" test1 nofile> 1
grep -s "[0-9]" test1 nofile> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -h "[0-9]" test1 test2 test3 > 1
grep -h "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -c "[0-9]" test1 > 1
grep -c "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -l "[0-9]" test1> 1
grep -l "[0-9]" test1> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -v "[0-9]" test1> 1
grep -v "[0-9]" test1> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -n "[0-9]" test1> 1
grep -n "[0-9]" test1> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -in "[0-9]" test1> 1
grep -in "[0-9]" test1> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -iv "[0-9]" test1> 1
grep -iv "[0-9]" test1> 2
DIFF_RES="$(diff -s 1 2)"
isS











grep -v hey 1.txt 2.txt > 1
./s21_grep -v hey 1.txt 2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -v "[0-9]" test1 > 1
grep -v "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -c "[0-9]" test1 > 1
grep -c "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -l "[0-9]" test1 > 1
grep -l "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS







./s21_grep "[0-9]" test1 test2 test3 > 1
grep "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -i "[0-9]" test1 test2 test3 > 1
grep -i "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -v "[0-9]" test1 test2 test3> 1
grep -v "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -c "[0-9]" test1 test2 test3 > 1
grep -c "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -l "[0-9]" test1 test2 test3 > 1
grep -l "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -h "[0-9]" test1 test2 test3 > 1
grep -h "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -s "[0-9]" test1 test2 test3 > 1
grep -s "[0-9]" test1 test2 test3 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -hs "[0-9]" test1 test2 test33 > 1
grep -hs "[0-9]" test1 test2 test33 > 2
DIFF_RES="$(diff -s 1 2)"
isS





./s21_grep -vcn "[0-9]" test1 > 1
grep -vcn "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vc "[0-9]" test1 > 1
grep -vc "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vn "[0-9]" test1 > 1
grep -vn "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -nc "[0-9]" test1 > 1
grep -nc "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS



./s21_grep -vcnl "[0-9]" test1 > 1
grep -vcnl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vcl "[0-9]" test1 > 1
grep -vcl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vnl "[0-9]" test1 > 1
grep -vnl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncl "[0-9]" test1 > 1
grep -ncl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncl "[0-9]" test1 > 1
grep -cl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS




./s21_grep -vcnli "[0-9]" test1 > 1
grep -vcnli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vcli "[0-9]" test1 > 1
grep -vcli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vnl "[0-9]" test1 > 1
grep -vnli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncl "[0-9]" test1 > 1
grep -ncli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncl "[0-9]" test1 > 1
grep -cl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS






./s21_grep -vcli "[0-9]" test1 > 1
grep -vcli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -vnli "[0-9]" test1 > 1
grep -vnli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncli "[0-9]" test1 > 1
grep -ncli "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -ncl "[0-9]" test1 > 1
grep -ncl "[0-9]" test1 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -l "[0-9]" test1 test2> 1 
grep -l "[0-9]" test1 test2> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -c "[0-9]" test1 test2 > 1 
grep -c "[0-9]" test1 test2> 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep -lc "[0-9]" test1 test2> 1 
grep -lc "[0-9]" test1 test2> 2
DIFF_RES="$(diff -s 1 2)"
isS


./s21_grep -e "[0-9]" test1 test2 -e "[0-9]" test1 test2> 1 
grep -e "[0-9]" test1 test2 -e "[0-9]" test1 test2 > 2
DIFF_RES="$(diff -s 1 2)"
isS

./s21_grep "[0-9]" test1 -n > 1 
grep "[0-9]" test1 -n > 2
DIFF_RES="$(diff -s 1 2)"
isS


echo "-------------------"
echo "-------------------"
echo "Total: $COUNT"
echo "SUCCESS: $FAIL_COUNT"
echo "FAIL: $SUCCESS_COUNT"



