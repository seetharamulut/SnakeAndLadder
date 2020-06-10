#! /bin/bash/

echo "welcome to snake and ladder game"

Player_one_Position=0

Die_Value=$(( (( $RANDOM%6 ))+1 ))

echo "player one die value is : " $Die_Value
