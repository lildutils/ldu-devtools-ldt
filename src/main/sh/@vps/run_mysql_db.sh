#!/bin/bash

main() {
    ## validate args
    if [ -z "$1" ]; then
        echo "ERR: 'project' is required"
        exit 1
    fi
    if [ -z "$2" ]; then
        echo "ERR: 'database port-idx' is required"
        exit 1
    fi

    ## process args
    project=$1
    port=$2
    passw="${project}DBp4ssw0rD123"

    ## prompt
    read -p 'INP: Are you sure, you want to (re)install the whole project and all of its data? (y/n) ' -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "INFO: The script run cancelled"
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    fi

    ## clean
    rm -rf /home/$project

    ## make
    mkdir /home/$project
    mkdir /home/$project/backup
    mkdir /home/$project/data
    mkdir /home/$project/config
    mkdir /home/$project/static

    ## networking
    docker network rm $project-network
    docker network create $project-network

    ## run
    docker container kill $project-database
    docker container rm $project-database
    docker container run \
        -d \
        --name=$project-database \
        --network=$project-network \
        -p 127.0.0.1:$port:3306 \
        -p 127.0.0.1::33060 \
        -e MYSQL_ROOT_PASSWORD=$passw \
        -v=/home/$project/data:/var/lib/mysql \
        mysql:8.0.17 \
        --default-authentication-plugin=mysql_native_password
}

main $1 $2
