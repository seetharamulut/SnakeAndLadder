#! /bin/bash/ 

echo "welcome to snake and ladder game"

player_One_Position=0
player_Two_Position=0

die_Count=0

function playerOption(){

	player_Position=$1
	NO_PLAY=0
	LADDER=1
	SNAKE=2

	die_Value=$(( (( $RANDOM%6 ))+1 ))

	case $(( (( $RANDOM%3 ))+1 )) in

		$NO_PLAY) player_Position=$player_Position ;;

		$LADDER) player_Position=$(( $player_Position+$die_Value )) ;;

		$SNAKE) player_Position=$(( $player_Position-$die_Value )) ;;

	esac

	if [ $player_Position -lt 0 ]
	then
		player_Position=0
	elif [ $player_Position -gt 100 ]
	then
		player_Position=$(( $player_Position-$die_Value ))
	fi

	echo $player_Position
}

function player_Selection(){


	while [[ $player_One_Position -lt 100 ]] && [[ $player_Two_Position -lt 100 ]]
	do

		player_One_Position=$(playerOption $player_One_Position)

		echo "player one position is : "$player_One_Position

		player_Two_Position=$(playerOption $player_Two_Position)

		echo "player two position is : "$player_Two_Position

		die_Count=$(( $die_Count+1 ))

	done
}

function winner_Declaration(){

	player_Selection

	if [ $player_One_Position -eq 100 ]
	then

		echo "Player one won the game"
	else
		echo "Player two won the game"
	fi

	echo "number of times dies rolled to win is : "$die_Count
}

winner_Declaration
