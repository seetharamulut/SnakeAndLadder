#! /bin/bash/

echo "welcome to snake and ladder game"

Player_one_Position=0

function PlayerMovement(){

	Die_Value=$(( (( $RANDOM%6 ))+1 ))

	echo "player one die value is : " $Die_Value

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
	fi

	echo "Player position is : "$Player_one_Position
}

PlayerMovement
