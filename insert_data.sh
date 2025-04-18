#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\n ~~~ Running Insert Data ~~~ \n"

file="games.csv"

tail -n +2 "$file" | while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # Insertar WINNER si no existe
  RESULT=$($PSQL "SELECT name FROM teams WHERE name='$winner';")
  if [[ -z "$RESULT" ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$winner');"
  else
    echo "El equipo '$winner' ya existe."
  fi

  # Insertar OPPONENT si no existe
  RESULT=$($PSQL "SELECT name FROM teams WHERE name='$opponent';")
  if [[ -z "$RESULT" ]]; then
    $PSQL "INSERT INTO teams(name) VALUES('$opponent');"
  else
    echo "El equipo '$opponent' ya existe."
  fi

  # Insertar el GAME
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);"

done

