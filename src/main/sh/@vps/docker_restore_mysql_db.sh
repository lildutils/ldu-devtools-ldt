#!/bin/bash

main() {
    ## validate args
    if [ -z "$1" ]; then
        echo "ERR: 'project' is required"
        exit 1
    fi
    if [ -z "$2" ]; then
        echo "ERR: 'dumpfile' is required"
        exit 1
    fi

    ## process args
    project=$1
    dumpfile=$2

    ## restore
    docker exec -i $dockerContainerName sh -c "exec mysql -uroot -p'$password'" < $file
}

main $1 $2
