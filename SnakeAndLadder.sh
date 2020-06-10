#! /bin/bash/ 

echo "welcome to snake and ladder game"

Player_one_Position=0
Player_Two_Position=0

Die_Count=0

function PlayerMovement(){

	Player_Position=$1

	Die_Value=$(( (( $RANDOM%6 ))+1 ))

	case $(( (( $RANDOM%3 ))+1 )) in

		1) Player_Position=$Player_Position ;;

		2) Player_Position=$(( $Player_Position+$Die_Value )) ;;

		3) Player_Position=$(( $Player_Position-$Die_Value )) ;;
	esac

	if [ $Player_Position -lt 0 ]
	then
		Player_Position=0
	elif [ $Player_Position -gt 100 ]
	then
		Player_Position=$(( $Player_Position-$Die_Value ))
	fi

	echo $Player_Position
}

while [[ $Player_one_Position -lt 100 ]] && [[ $Player_Two_Position -lt 100 ]]
do

	Player_one_Position=$(PlayerMovement $Player_one_Position)

	echo "player one position is : "$Player_one_Position

	Player_Two_Position=$(PlayerMovement $Player_Two_Position)

	echo "player two position is : "$Player_Two_Position

	Die_Count=$(( $Die_Count+1 ))

done

if [ $Player_one_Position -eq 100 ]
then

	echo "Player one won the game"
else
	echo "Player two won the game"
fi

echo "number of times dies rolled to win is : "$Die_Count

