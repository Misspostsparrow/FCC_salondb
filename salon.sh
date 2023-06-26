#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU () {
    if [[ $1 ]]
    then
     echo -e "\n$1"
    fi
    echo -e "\nWelcome! Pick from the list of our services."
    #get list of services
    SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services")
    echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
    do
    echo "$SERVICE_ID) $NAME"
    done
    #echo -e "\n1. Hair cut\n2. Perm\n3. Trim\n3. Hair coloring\n4. Hair wash\n5. Exit"
    read SERVICE_ID_SELECTED

    case "$SERVICE_ID_SELECTED" in
    1) HAIR_CUT_MENU ;;
    2) PERM_MENU ;;
    3) TRIM_MENU ;;
    4) HAIR_COLORING_MENU ;;
    5) HAIR_WASH_MENU ;;
    6) HAIR_STYLING_MENU ;;
    7) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac

}
HAIR_CUT_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')." 
}
PERM_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')."  
}
TRIM_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')."  
}
HAIR_COLORING_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')."  
}
HAIR_WASH_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')."  
}
HAIR_STYLING_MENU () {
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #if customer does not exist
    if [[  -z "$CUSTOMER_NAME" ]] 
    then
    # get new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    
    read CUSTOMER_NAME
    # insert new customer
    INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
    
    # get appointment time
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed 's/^ //g'), $(echo $CUSTOMER_NAME | sed 's/^ //g')?"
    read SERVICE_TIME
    
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # insert appointment info
    INSERT_SERVICE_TIME_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID)")
    
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/^ //g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ //g')." 
}


EXIT() {
  echo -e "\nThank you for stopping in.\n"
}
MAIN_MENU
