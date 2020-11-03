###################################################
## Run backend to serve modules
##

#!/bin/bash

main() {
    ## validate args
    if [ -z "$1" ]; then
        echo "ERR: 'project' is required"
        exit
    fi
    if [ -z "$2" ]; then
        echo "ERR: 'version' is required"
        exit
    fi
    if [ -z "$3" ]; then
        echo "ERR: 'backend port' is required"
        exit
    fi

    ## process args
    project=$1
    version=$2
    port=$3
    hub=ndworks/hub-images

    ## clean
    docker container kill $project-backend
    docker container rm $project-backend

    ## update
    docker pull $hub:$project-backend-$version

    ## run
    docker container run \
        -d \
        --name=$project-backend \
        --network=$project-network \
        -p $port:9080 \
        -v /home/$project/static:/static \
        $hub:$project-backend-$version
}

main $1 $2 $3
