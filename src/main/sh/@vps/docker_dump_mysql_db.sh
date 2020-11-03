#!/bin/bash

main() {
    ## validate args
    if [ -z "$1" ]; then
        echo "ERR: 'project' is required"
        exit 1
    fi

    ## process args
    project=$1
    now=$(date +"%Y%m%d%H%M%S")

    ## dump
    docker exec $dockerContainerName sh -c "exec mysqldump --all-databases -uroot -p'$password'" > $file
}

main $1
