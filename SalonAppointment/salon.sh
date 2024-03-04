#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

LIST_SERVICES=$($PSQL "SELECT * FROM services")

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){

  SERVICE_ID_SELECTED=""
  SERVICE_NAME=""

if [[ $1 ]]; then
    echo -e "\n$1"
  fi

if [[ -z $LIST_SERVICES ]]
  then
    echo "Sorry, we don't have any service right now"
    sleep 2
    exit
  else
    echo -e "$LIST_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
fi

  read SERVICE_ID_SELECTED

#Doenst Pass the test after this, until the !
 if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
 then
   MAIN_MENU "Sorry, that is not a valid number! Please, choose again."
 else
    #get service by ID
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

      if [[ -z $SERVICE_NAME ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      fi
  fi

# !

  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
	then
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)")
  echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU