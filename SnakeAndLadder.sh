#! /bin/bash/ 

echo "welcome to snake and ladder game"

playerOnePosition=0
playerTwoPosition=0

dieCount=0

function playerOption(){

	playerPosition=$1
	NOPLAY=0
	LADDER=1
	SNAKE=2

	dieValue=$(( (( $RANDOM%6 ))+1 ))

	case $(( (( $RANDOM%3 ))+1 )) in

		$NOPLAY) playerPosition=$playerPosition ;;

		$LADDER) playerPosition=$(( $playerPosition+$dieValue )) ;;

		$SNAKE) playerPosition=$(( $playerPosition-$dieValue )) ;;

	esac

	if [ $playerPosition -lt 0 ]
	then
		playerPosition=0
	elif [ $playerPosition -gt 100 ]
	then
		playerPosition=$(( $playerPosition-$dieValue ))
	fi

	echo $playerPosition
}

function playerSelection(){


	while [[ $playerOnePosition -lt 100 ]] && [[ $playerTwoPosition -lt 100 ]]
	do

		playerOnePosition=$(playerOption $playerOnePosition)

		echo "player one position is : "$playerOnePosition

		playerTwoPosition=$(playerOption $playerTwoPosition)

		echo "player two position is : "$playerTwoPosition

		dieCount=$(( $die_Count+1 ))
	done
}

function winnerDeclaration(){

	playerSelection

	if [ $playerOnePosition -eq 100 ]
	then

		echo "Player one won the game"
	else
		echo "Player two won the game"
	fi

	echo "number of times dies rolled to win is : "$dieCount
}

winnerDeclaration
