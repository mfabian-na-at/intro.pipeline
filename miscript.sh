#!/bin/sh
# A simple script with a function
add_a_user(){
    USER=$1
    PASSWORD=$2
    shift:shift
    #Having a good time
    COMMENTS=$@
    echo "Adding user $USER ..."
    echo useradd -c "$COMMENTS" $USER
    echo passwd $USER $PASSWORD
    echo "Added user" user $USER ($COMMENTS) with pass $PASSWORD
}

###
#Cuerpo del script comienza
echo "Comienza *************"
add_a_user boboddy perez boboddy stands buzinnez
add_a_user creed bratton qulity
add_a_user otro usuario como no
echo "Fin *************"
