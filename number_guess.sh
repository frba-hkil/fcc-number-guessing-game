#!/bin/bash
ANS=$(( $RANDOM % 10 + 1))
PSQL="psql -X --username=freecodecamp --dbname=users -t --no-align -c"
echo "Enter your username:"
read INPUT_USERNAME
USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username='$INPUT_USERNAME'")

if [[ -z $USERNAME_RESULT ]]
then
  echo -e "\nWelcome, $INPUT_USERNAME! It looks like this is your first time here."
  CREATE_USER=$($PSQL "INSERT INTO users (username) VALUES ('$INPUT_USERNAME')")
else
  IFS='|' read USERNAME GAMES BEST <<< "$USERNAME_RESULT"
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
fi

TRIES=1
echo -e "\nGuess the secret number between 1 and 1000:"
read NUM

while [[ $NUM != $ANS ]]
do
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read NUM
  else
    (( TRIES++ ))
    if [[ $NUM -lt $ANS ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read NUM
    else
      echo -e "It's lower than that, guess again:"
      read NUM
    fi
  fi
done

echo -e "\nYou guessed it in $TRIES tries. The secret number was $ANS. Nice job!"
USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username='$INPUT_USERNAME'")
IFS='|' read USERNAME GAMES BEST <<< "$USERNAME_RESULT"
UPDATE_GAME_COUNT=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$USERNAME'")
if [[ $TRIES -lt $BEST ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$TRIES WHERE username='$USERNAME'")
fi
