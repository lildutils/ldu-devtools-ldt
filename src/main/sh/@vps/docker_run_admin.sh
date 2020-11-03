###################################################
## Run admin module for landing pages by region
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
        echo "ERR: 'admin port' is required"
        exit
    fi
    if [ -z "$4" ]; then
        region="hu"
    else
        region=$4
    fi

    ## process args
    project=$1
    version=$2
    port=$3
    hub=ndworks/hub-images

    ## clean
    docker container kill $project-admin-$region
    docker container rm $project-admin-$region

    ## update
    docker pull $hub:$project-admin-$region-$version

    ## run
    docker container run \
        -d \
        --name=$project-admin-$region \
        --network=$project-network \
        -p $port:80 \
        -v /home/$project/static:/var/www/html/static \
        $hub:$project-admin-$region-$version
}

main $1 $2 $3 $4
