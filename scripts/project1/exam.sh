#!/bin/bash

# Variable definition
NUM=1
QUESTION=$HOME/scripts/project1
TOTAL_NUM=$(wc -l < $QUESTION/question/answer.txt)
TMP1=/tmp/tmp1

# Functions definition
ProbView() {
    cat $1
    echo
}


# Main Function
ls -1 $QUESTION/question/question*.txt > $TMP1
while [ $NUM -le $TOTAL_NUM ]
do
    PROB_FILE=$QUESTION/question/question$NUM.txt
    CORRECT_NUM=$(cat $QUESTION/question/answer.txt \
                        | sed -n "${NUM}p" \
                        | awk -F : '{print $2}')

    ProbView $PROB_FILE
    # echo $CORRECT_NUM
    echo -n "정답은? : "
    read ANSWER

    if [ "$ANSWER" = "$CORRECT_NUM" ]; then
        echo "[   OK   ]: 정답입니다." 
        NUM=$(expr $NUM + 1)
    else
        echo "[  FAIL  ]: 틀렸습니다. 다시 시도."
        echo
    fi
done

echo
echo "[   OK   ]: 합격." | boxes -d santa
echo