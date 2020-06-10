#! /bin/bash/

echo "welcome to snake and ladder game"

Player_one_Position=0

Die_Count=0

function PlayerMovement(){


	Die_Value=$(( (( $RANDOM%6 ))+1 ))

	case $(( (( $RANDOM%3 ))+1 )) in

		1) echo "no play" ;;

		2) Player_one_Position=$(( $Player_one_Position+$Die_Value ))
		   echo "player gone through ladder" ;;

		3) Player_one_Position=$(( $Player_one_Position-$Die_Value ))
		   echo "player gone through snake" ;;
	esac

	if [ $Player_one_Position -lt 0 ]
	then
		Player_one_Position=0
	elif [ $Player_one_Position -gt 100 ]
	then
		Player_one_Position=$(( $Player_one_Position-$Die_Value ))
	fi

	echo "Player position is : "$Player_one_Position
}

while [ $Player_one_Position -lt 100 ]
do

	PlayerMovement

	Die_Count=$(( $Die_Count+1 ))

done

echo "Player one won the game"

echo "number of times dies rolled to win is : "$Die_Count

